
`timescale 1 ns / 1 ps

	module automatic_gain_control_v1_0 #
	(
		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer AXIS_TDATA_WIDTH	= 32, //0.5 of full range
				// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  aclk,
		input wire  aresetn,
		input wire  axi_resetn,
		
		
		input wire slot_finished,
		input wire slot_detected,
		
	    input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,
		
		output wire  s00_axis_tready,
		input wire  [AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,



		output wire  s01_axis_tready,
		input wire [AXIS_TDATA_WIDTH-1 : 0] s01_axis_tdata,
		input wire  s01_axis_tlast,
		input wire  s01_axis_tvalid,


		output wire  m00_axis_tvalid,
		output wire  [AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready,


		output wire  m01_axis_tvalid,
		output wire [AXIS_TDATA_WIDTH-1 : 0] m01_axis_tdata,
		output wire  m01_axis_tlast,
		input wire  m01_axis_tready
	);
	
	wire [23:0] agc_out;
	reg signed [11:0] gain_b0,gain_b1;
	reg lock;
	wire signed [15:0] data_in_0_I,data_in_1_I,data_in_0_Q, data_in_1_Q;
	
	reg signed [15:0] data_out_1_I,data_out_0_I;
    reg signed [15:0] data_out_1_Q,data_out_0_Q;
    
    wire [31:0] control;
    
    wire signed [27:0] mult_result_0,mult_result_1,mult_result_2,mult_result_3;
    wire signed [19:0] shifted_result_0,shifted_result_1,shifted_result_2,shifted_result_3;

// Instantiation of Axi Bus Interface S00_AXI
	agc_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) agc_S00_AXI_inst (
		.S_AXI_ACLK(aclk),
		
		.control(control),
		
		.S_AXI_ARESETN(axi_resetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

    // Instantiate the AGC module -- This module uses 1 samples every 2 
    assign data_in_0_I = s00_axis_tdata[15:0];
    assign data_in_1_I = s00_axis_tdata[31:16];
    assign data_in_0_Q = s01_axis_tdata[15:0];
    assign data_in_1_Q = s01_axis_tdata[31:16];
    
    agc uut(
        .clk(aclk),
        .arst(aresetn),
        .data_in_I(s00_axis_tdata[15:0]),
        .data_in_Q(s01_axis_tdata[15:0]),
        .gain(agc_out),
        .Vref(control[14:0])
    );
    
    always @(posedge aclk) begin
        if (!aresetn) begin 
            gain_b0 <= 12'b0;
            gain_b1 <= 12'b0;
        end
        else begin
           if (~lock||slot_finished) begin
                gain_b1 <= gain_b0;
            end   
            if (~lock||slot_detected) begin
                if(agc_out[22:8]>8) begin
                    gain_b0 <= 8 <<< 8;
                end else begin
                    gain_b0 <= agc_out[11:0];
                end
            end            
        end
    end
    
   always @(posedge aclk) begin
        if (!aresetn) begin 
            lock <= 0;
        end
        else begin
            if (slot_detected) begin
                lock <=1;
            end            
        end
    end
    
    // Intermediate multiplication result (28-bit)
    assign mult_result_0 = data_in_0_I * gain_b1;
    assign mult_result_1 = data_in_1_I * gain_b1;
    assign mult_result_2 = data_in_0_Q * gain_b1;
    assign mult_result_3 = data_in_1_Q * gain_b1;

    // Adjust by shifting right 4 bits to remove the fractional part
    assign shifted_result_0 = mult_result_0 >>> 8; // Arithmetic shift
    assign shifted_result_1 = mult_result_1 >>> 8;
    assign shifted_result_2 = mult_result_2 >>> 8; // Arithmetic shift
    assign shifted_result_3 = mult_result_3 >>> 8;

    always @(posedge aclk) begin
        if (!aresetn) begin 
            data_out_1_I <= 16'b0;
            data_out_1_Q <= 16'b0;
            data_out_0_I <= 16'b0;
            data_out_0_Q <= 16'b0;
        end
        else begin
//                 data_out_I <= (shifted_result_0 > 16'sd32767) ? 16'sh7FFF :  // Max positive
//                                (shifted_result_0 < -16'sd32768) ? -16'sh8000 : // Max negative
//                                shifted_result_0[15:0]; // Truncate to 16-bit
            if (control[31]) begin
                data_out_0_I <=shifted_result_0[15:0];
                data_out_1_I <=shifted_result_1[15:0];
                data_out_0_Q <=shifted_result_2[15:0];
                data_out_1_Q <=shifted_result_3[15:0];
            end else begin 
                data_out_0_I <=s00_axis_tdata[15:0];
                data_out_1_I <=s00_axis_tdata[31:16];
                data_out_0_Q <=s01_axis_tdata[15:0];
                data_out_1_Q <=s01_axis_tdata[31:16];
            end
        end
    end

    assign m00_axis_tdata = {data_out_1_I, data_out_0_I};
    assign m01_axis_tdata = {data_out_1_Q, data_out_0_Q};
    assign m00_axis_tvalid=1;
    assign m01_axis_tvalid=1;
    
//        ila_0 ila (
//        .clk(aclk),
//        .probe0(s00_axis_tdata),
//        .probe1(m00_axis_tdata),
//        .probe2(lock),
//        .probe3(slot_finished),
//        .probe4(agc_out),
//        .probe5(gain_b1),
//        .probe6(data_out_0_I),
//        .probe7(control),
//        .probe8(mult_result_0),
//        .probe9(gain_b0),
//        .probe10(slot_detected)
//    );
    

	endmodule
