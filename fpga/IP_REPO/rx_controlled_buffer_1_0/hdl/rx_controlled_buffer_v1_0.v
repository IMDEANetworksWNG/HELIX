
`timescale 1 ns / 1 ps

	module rx_controlled_buffer_v1_0 #
	(
		// Users to add parameters here

        parameter DATA_WIDTH = 64,     // Width of the AXI Stream data
        parameter FIFO_DEPTH = 1024*32*2,    // Depth of the FIFO in words
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4,

		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= DATA_WIDTH,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= DATA_WIDTH
	)
	(
		// Users to add ports here
        input aclk,
        input arst,
        
        input axi_lite_clk,
        input axi_lite_arst,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
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
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
	
	wire  tvalid,tlast,tready, fifo_valid, fifo_ready;
    wire [DATA_WIDTH-1 : 0] tdata;
    
    wire [C_S00_AXI_DATA_WIDTH-1:0] fifo_count_0, fifo_count_1;  // Tracks the number of entries in the FIFO
    wire [C_S00_AXI_DATA_WIDTH-1:0] packet_size_i,packet_size_o; 
    reg wr_en,fifo_full;
    
    //localparam WAIT_TRIGGER = 3'b000;
localparam SEND = 2'b00;
localparam FULL = 2'b01;


reg[1:0] state_w = SEND;

reg [32:0] fifo_count0_reg;

always @(posedge aclk) begin
    if (!arst) begin
        fifo_count0_reg <= 0;
    end else begin
        fifo_count0_reg <= fifo_count_0 + fifo_count_1;  // Capture FIFO count on clock edge
        //fifo_count1_reg <= fifo_count_1;
    end
end

    
// Instantiation of Axi Bus Interface S00_AXI
	rx_controlled_buffer_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) rx_controlled_buffer_v1_0_S00_AXI_inst (
	    .prog_full(packet_size_i), 
		.S_AXI_ACLK(axi_lite_clk),
		.S_AXI_ARESETN(axi_lite_arst),
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
    
    assign fifo_valid = wr_en & s00_axis_tvalid;
    //assign s00_axis_tready = wr_en & fifo_ready;
    assign s00_axis_tready = 1;

    
    always @ (posedge aclk) begin
    if(!arst) begin
        wr_en <= 1;
        state_w <= SEND;
    end
    else begin
        case(state_w)
            SEND: begin
                wr_en<=1;
                if (s00_axis_tlast & s00_axis_tvalid) begin
                    if (fifo_full) begin
                        wr_en<=0;
                        state_w <= FULL;
                    end
                end
            end
            FULL: begin
                wr_en<=0;
                if (s00_axis_tlast & s00_axis_tvalid) begin
                    if (!fifo_full) begin
                        wr_en<=1;
                        state_w <= SEND;
                    end
                end 
            end

            default: begin
                state_w <= SEND;
            end
        endcase
    end
end

always @ (posedge aclk) begin
    if (!arst) begin
        fifo_full <= 0;
    end
    else begin
        if (fifo_count0_reg  > packet_size_o) begin
            fifo_full <= 1;
        end
        else begin
            fifo_full <= 0;
        end
    end
end
    
    
//    ila_0 ila_0(
//    .clk (aclk),
//    .probe0 (s00_axis_tlast),
//    .probe1 (s00_axis_tvalid),
//    .probe2 (fifo_full),
//    .probe3 (fifo_count_0),
//    .probe4 (fifo_count_1),
//    .probe5 (packet_size_o),
//    .probe6 (wr_en),
//    .probe7 (s00_axis_tdata),
//    .probe8 (state_w),
//    .probe9 (s00_axis_tready),
//    .probe10 (fifo_count0_reg)
//    );
    
    
    	  fifo_0 #(
  ) fifo_0 (
    .s_axis_aresetn(arst),
    .s_axis_aclk(aclk),

    .s_axis_tvalid(fifo_valid),
    .s_axis_tready(fifo_ready),
    .s_axis_tdata(s00_axis_tdata),
    .s_axis_tlast(s00_axis_tlast),
    
    
    .m_axis_tvalid(tvalid),
    .m_axis_tready(tready),
    .m_axis_tdata(tdata),
    .m_axis_tlast(tlast),
    
    .axis_wr_data_count(fifo_count_0)

  );
  
  	  fifo_0 #(
  ) fifo_1 (
    .s_axis_aresetn(arst),
    .s_axis_aclk(aclk),

    .s_axis_tvalid(tvalid),
    .s_axis_tready(tready),
    .s_axis_tdata(tdata),
    .s_axis_tlast(tlast),


    .m_axis_tvalid(m00_axis_tvalid),
    .m_axis_tready(m00_axis_tready),
    .m_axis_tdata(m00_axis_tdata),
    .m_axis_tlast(m00_axis_tlast),
    
    .axis_wr_data_count(fifo_count_1)

  );
  
genvar index;
generate
    for (index=0; index < 32; index=index+1)
    begin: gen_code_label
        vt_single_sync #(2'd2, 1'b0) vt_single_sync
        (
            .clk(aclk),
            .port_i(packet_size_i[index]),
            .port_o(packet_size_o[index])
        );
    end
endgenerate
  

endmodule

