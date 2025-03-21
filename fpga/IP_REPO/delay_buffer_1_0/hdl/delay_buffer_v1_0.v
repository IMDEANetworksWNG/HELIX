
`timescale 1 ns / 1 ps

	module delay_buffer_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 64,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 64
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  clk,
		input wire  aresetn,
		
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
	

localparam SEND = 1'b1;
localparam IDLE = 1'b0;
reg[2:0] state_w = IDLE;
reg send;
wire tready,tvalid,start_transmission;
wire[31:0] data_count;


always @ (posedge clk) begin
    if(!aresetn) begin
        send<= 0;
        state_w <= IDLE;
    end
    else begin
        case(state_w)
            IDLE: begin
                if(start_transmission) begin
                   send<= 1;
                   state_w <= SEND;
                end
            end

            SEND: begin
                if(m00_axis_tlast) begin
                   send<= 0;
                   state_w <= IDLE;
                end  
            end
            default: begin
                state_w <= IDLE;
            end
        endcase
    end
end

	  axis_data_fifo_0 #(
  ) fifo (
    .s_axis_aresetn(aresetn),
    .s_axis_aclk(clk),

    .s_axis_tvalid(s00_axis_tvalid),
    .s_axis_tready(s00_axis_tready),
    .s_axis_tdata(s00_axis_tdata),
    .s_axis_tlast(s00_axis_tlast),
    
    .m_axis_tvalid(tvalid),
    .m_axis_tready(tready),
    .m_axis_tdata(m00_axis_tdata),
    .m_axis_tlast(m00_axis_tlast),
    .prog_full(start_transmission),
    .axis_wr_data_count(data_count)

  );
  
//  ila_0#()
//  ila(
//    .clk(clk),
//    .probe0(tvalid),
//    .probe1(tready),
//    .probe2(send),
//    .probe3(start_transmission),
//    .probe4(m00_axis_tlast),
//    .probe5(m00_axis_tvalid),
//    .probe6(s00_axis_tvalid),
//    .probe7(data_count)
    
//  );
  
assign m00_axis_tvalid= tvalid && send;
assign tready= m00_axis_tready && send;

	endmodule
