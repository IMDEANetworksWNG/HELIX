
`timescale 1 ns / 1 ps

	module tx_buffer_top #
	(
		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer AXIS_TDATA_WIDTH	= 64
	)
	(
		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  aclk,
		input wire  aresetn,
		
		output wire prog_empty,
		
		output wire  s00_axis_tready,
		input wire [AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,


		output wire  m00_axis_tvalid,
		output wire [AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready

	);
	
	reg wr_en;
	wire tready,tvalid;

    axis_data_fifo_0 uut (
        .s_axis_aresetn(aresetn),
        .s_axis_aclk(aclk),
        
        .s_axis_tvalid(s00_axis_tvalid),
        .s_axis_tready(s00_axis_tready),
        .s_axis_tdata(s00_axis_tdata),
        .s_axis_tlast(s00_axis_tlast),
        
        .m_axis_tvalid(tvalid),
        .m_axis_tready(tready),
        .m_axis_tdata(m00_axis_tdata),
        .m_axis_tlast(m00_axis_tlast),
        
        .prog_empty(prog_empty)
    );
    
    // Leave one idle cycle between slot and slot
    always @(posedge aclk) begin
        if (!aresetn) begin 
            wr_en <=1;
        end
        else begin
            wr_en <=1;
            if (m00_axis_tlast & m00_axis_tready) begin
                wr_en <=0;
            end            
        end
    end
    
    
    assign tready = wr_en & m00_axis_tready;
    assign m00_axis_tvalid = wr_en & tvalid;
    

	endmodule
