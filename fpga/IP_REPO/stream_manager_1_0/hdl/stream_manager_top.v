
`timescale 1 ns / 1 ps

	module stream_manager_top #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 5,

		// Parameters of Axi Slave Bus Interface S00_UDP_AXIS
		parameter integer C_S00_UDP_AXIS_TDATA_WIDTH	= 64,

		// Parameters of Axi Slave Bus Interface S01_RF_AXIS
		parameter integer C_S01_RF_AXIS_TDATA_WIDTH	= 64,

		// Parameters of Axi Master Bus Interface M00_UDP_AXIS
		parameter integer C_M00_UDP_AXIS_TDATA_WIDTH	= 64,

		// Parameters of Axi Master Bus Interface M01_RF_AXIS
		parameter integer C_M01_RF_AXIS_TDATA_WIDTH	= 64
	)
	(
        input wire  udp_aclk,
		input wire  udp_aresetn,

		input wire  rf_aclk,
		input wire  rf_aresetn,
		
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

		// Ports of Axi Slave Bus Interface S00_UDP_AXIS
		output wire  s00_udp_axis_tready,
		input wire [C_S00_UDP_AXIS_TDATA_WIDTH-1 : 0] s00_udp_axis_tdata,
		input wire  s00_udp_axis_tlast,
		input wire  s00_udp_axis_tvalid,

		// Ports of Axi Slave Bus Interface S01_RF_AXIS
		output wire  s01_rf_axis_tready,
		input wire [C_S01_RF_AXIS_TDATA_WIDTH-1 : 0] s01_rf_axis_tdata,
		input wire  s01_rf_axis_tlast,
		input wire  s01_rf_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_UDP_AXIS
		output wire  m00_udp_axis_tvalid,
		output wire [C_M00_UDP_AXIS_TDATA_WIDTH-1 : 0] m00_udp_axis_tdata,
		output wire  m00_udp_axis_tlast,
		input wire  m00_udp_axis_tready,
		output wire m00_udp_axis_tuser,

		// Ports of Axi Master Bus Interface M01_RF_AXIS
		output wire  m01_rf_axis_tvalid,
		output wire [C_M01_RF_AXIS_TDATA_WIDTH-1 : 0] m01_rf_axis_tdata,
		output wire  m01_rf_axis_tlast,
		input wire  m01_rf_axis_tready,
		output wire m01_rf_axis_tuser,
		
		output wire tx_init,
		output wire rx_init,
		output wire slot_recv,
	    output wire tx_rst_out,
		output wire rx_rst_out,
		
		input wire tx_arst_in,
		input wire rx_arst_in,
		input wire side_info_completed
		
	);
	
		wire  udp2tx_tvalid,udp2tx_tlast,udp2tx_tready;
		wire [C_M00_UDP_AXIS_TDATA_WIDTH-1 : 0] udp2tx_tdata;
		
		wire  rx2udp_tvalid, rx2udp_tlast,rx2udp_tready;
		wire [C_M00_UDP_AXIS_TDATA_WIDTH-1 : 0] rx2udp_tdata;
		
		wire [C_S00_AXI_DATA_WIDTH-1 : 0] mss_rx,ifg_rx,ts_rx,mss_tx,ifg_tx,ts_tx;
		wire [C_S00_AXI_DATA_WIDTH/2-1 :0] control_i,control_o;
		wire [32-1 :0] tx_data_count,rx_data_count;
		
		wire rf_tready,rx_arst_in_s, tx_arst_in_s , rf_tvalid,rx_init_s,side_info_completed_s;
		
		assign m00_udp_axis_tuser=1;
		
// Instantiation of Axi Bus Interface S00_AXI
	stream_manager_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) stream_manager_v1_0_S00_AXI_inst (
		.S_AXI_ACLK(udp_aclk),
		
		.control_i(control_i),
		.control_o(control_o),
        .mss_rx(mss_rx),
        .ifg_rx(ifg_rx),
        .ts_rx(ts_rx),
        
        .mss_tx(mss_tx),
        .ifg_tx(ifg_tx),
        .ts_tx(ts_tx),
		
		.S_AXI_ARESETN(udp_aresetn),
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


	packet_fragmentation # ( 
	) packet_fragmentation_RX (
		.clk(udp_aclk),
		.arst(rx_arst_in),

		.s_axis_tdata(rx2udp_tdata),
		.s_axis_tvalid(rx2udp_tvalid),
		.s_axis_tready(rx2udp_tready),
		.s_axis_tlast(rx2udp_tlast),

		.m_axis_tdata(m00_udp_axis_tdata),
		.m_axis_tvalid(m00_udp_axis_tvalid),
		.m_axis_tready(m00_udp_axis_tready),
		.m_axis_tlast(m00_udp_axis_tlast),

		.trigger(control_o[15]),
		.side_info_enabled(control_o[13]),
		.side_info_completed(side_info_completed_s),
		.mss(mss_rx),
		.ifg(ifg_rx),
		.transfer_size(ts_rx),
		.transfer_completed(control_i[1]),
		.transfer_init(rx_init),
		.slot_processed(slot_recv),
		.reset_out(rx_rst_out)
	);

		packet_fragmentation # ( 
	) packet_fragmentation_TX (
		.clk(udp_aclk),
		.arst(tx_arst_in),

		.s_axis_tdata(s00_udp_axis_tdata),
		.s_axis_tvalid(s00_udp_axis_tvalid),
		.s_axis_tready(s00_udp_axis_tready),
		.s_axis_tlast(s00_udp_axis_tlast),

		.m_axis_tdata(udp2tx_tdata),
		.m_axis_tvalid(udp2tx_tvalid),
		.m_axis_tready(udp2tx_tready),
		.m_axis_tlast(udp2tx_tlast),

		.trigger(control_o[14]),
		.side_info_enabled(),
		.side_info_completed(),
		.mss(mss_tx),
		.ifg(ifg_tx),
		.transfer_size(ts_tx),
		.slot_processed(),
		.transfer_completed(control_i[0]),
		.transfer_init(tx_init),
		.reset_out(tx_rst_out)
	);
	
	  fifo_CCD #(
  ) fifo_CCD_TX (
    .s_axis_aresetn(tx_arst_in),
    .s_axis_aclk(udp_aclk),

    .s_axis_tvalid(udp2tx_tvalid),
    .s_axis_tready(udp2tx_tready),
    .s_axis_tdata(udp2tx_tdata),
    .s_axis_tlast(udp2tx_tlast),
    
    .m_axis_aclk(rf_aclk),
    
    .m_axis_tvalid(m01_rf_axis_tvalid),
    .m_axis_tready(m01_rf_axis_tready),
    .m_axis_tdata(m01_rf_axis_tdata),
    .m_axis_tlast(m01_rf_axis_tlast),
    .axis_wr_data_count(tx_data_count)

  );
  
  	  fifo_CCD #(
  ) fifo_CCD_RX (
    .s_axis_aresetn(rx_arst_in_s),
    .s_axis_aclk(rf_aclk),

    .s_axis_tvalid(rf_tvalid),
    .s_axis_tready(rf_tready),
    .s_axis_tdata(s01_rf_axis_tdata),
    .s_axis_tlast(s01_rf_axis_tlast),
    
    .m_axis_aclk(udp_aclk),

    .m_axis_tvalid(rx2udp_tvalid),
    .m_axis_tready(rx2udp_tready),
    .m_axis_tdata(rx2udp_tdata),
    .m_axis_tlast(rx2udp_tlast)

  );
  
//ila_0 ila_udp(
//    .clk (udp_aclk),
//    .probe0 (rx2udp_tdata),
//    .probe1 (rx2udp_tready),
//    .probe2 (rx2udp_tvalid),
//    .probe3 (rx2udp_tlast),
//    .probe4 (m00_udp_axis_tdata),
//    .probe5 (m00_udp_axis_tready),
//    .probe6 (m00_udp_axis_tvalid),
//    .probe7 (control_o[13]),
//    .probe8 (side_info_completed_s)
//    );
//    ila_1 ila_rx(
//    .clk (rf_aclk),
//        .probe0 (s01_rf_axis_tvalid),
//    .probe1 (s01_rf_axis_tready),
//    .probe2 (s01_rf_axis_tdata),
//    .probe3 (s01_rf_axis_tlast),
    
//    .probe4 (rx_arst_in_s),
//    .probe5 (rx_init_s),
//    .probe6 (rf_tready),
//    .probe7 (rf_tvalid)
    
//    );
    
    vt_single_sync vt_single_sync_rx_rst 
    (
    .clk(rf_aclk),
    .port_i(rx_arst_in),
    .port_o(rx_arst_in_s)
    );
    
        vt_single_sync vt_single_sync_rx_init
    (
    .clk(rf_aclk),
    .port_i(rx_init),
    .port_o(rx_init_s)
    );
    
    vt_single_sync vt_single_sync_side_info_completed
    (
    .clk(udp_aclk),
    .port_i(side_info_completed),
    .port_o(side_info_completed_s)
    );
    
//        vt_single_sync vt_single_sync_tx_in_rst 
//    (
//    .clk(udp_clk),
//    .port_i(tx_rst_in),
//    .port_o(tx_reset_s)
//    );
    
  
    assign s01_rf_axis_tready= rf_tready && rx_init_s;
    assign rf_tvalid= s01_rf_axis_tvalid && rx_init_s;

	endmodule
