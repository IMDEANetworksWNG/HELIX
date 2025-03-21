`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 05:43:30 PM
// Design Name: 
// Module Name: udp_fragmentation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module udp_fragmentation(

    input  wire        clk,
    input  wire        rst,

    input  wire [63:0] s_udp_payload_axis_tdata,
    input  wire [7:0]  s_udp_payload_axis_tkeep,
    input  wire        s_udp_payload_axis_tvalid,
    output reg        s_udp_payload_axis_tready,
    input  wire        s_udp_payload_axis_tlast,
    input  wire        s_udp_payload_axis_tuser,
    
    input  wire [63:0] s_axis_tdata,
    input  wire [7:0]  s_axis_tkeep,
    input  wire        s_axis_tvalid,
    output wire        s_axis_tready,
    input  wire        s_axis_tlast,
    input  wire        s_axis_tuser,
        
    output  wire [63:0] m_axis_tdata,
    output  wire [7:0]  m_axis_tkeep,
    output  wire        m_axis_tvalid,
    input wire        m_axis_tready,
    output  reg        m_axis_tlast,
    output  wire        m_axis_tuser,
    
    output wire [15:0] udp_length,
    output reg [63:0]  control_dma,
    
    input wire [31:0] mss,
    input wire [31:0] ifg

    );


localparam PACKET_SIZE = 'h100;
localparam PACKET_IDLE = 'd12;

// Params
localparam WAIT_TRIGGER = 3'b000;
localparam SEND = 3'b001;
localparam IDLE = 3'b010;
//localparam STORAGE = 3'b101;
//localparam END_STORAGE = 3'b110;
//localparam FINISH = 3'b111;
//localparam BURST = 'h100;
reg[31:0] counter_0,counter_1,counter_2;

reg[2:0] state_w = WAIT_TRIGGER;
reg wr_en, rd_en,fifo_res;
reg [31:0] r_addr,size;

wire arst =! (rst | fifo_res);

wire fifo_s_axis_tready, fifo_m_axis_tvalid,fifo_m_axis_tready,af;
wire[31:0] data_count;

assign udp_length=PACKET_SIZE;



assign s_axis_tready=(fifo_s_axis_tready == 'b1 & rd_en == 'b1  & af == 'b0);

assign m_axis_tvalid=(fifo_m_axis_tvalid == 'b1 & wr_en  == 'b1);
assign fifo_m_axis_tready = m_axis_tready && wr_en;

//assign 


   always @ (posedge clk) begin
        if(rst) begin
            counter_0 <=0;
            counter_1 <=0;
            counter_2 <=0;
            m_axis_tlast <= 0;
            wr_en<= 0;
            rd_en<= 0;
            fifo_res<=0;
            state_w <= WAIT_TRIGGER;
        end
        else begin
            case(state_w)
                WAIT_TRIGGER: begin
                    counter_0 <=0;
                    counter_1 <=0;
                    counter_2 <=0;
                    m_axis_tlast <= 0;
                    control_dma <=0;
                    wr_en<= 0;
                    rd_en<= 0;
                    fifo_res<=0;
                    s_udp_payload_axis_tready<= 1;
                    if(s_udp_payload_axis_tvalid==1 && s_udp_payload_axis_tlast==1) begin
                        if (s_udp_payload_axis_tdata[63:62]==2'b11) begin
                        size<=s_udp_payload_axis_tdata[31:0];
                        control_dma <= {1'b1,s_udp_payload_axis_tdata[62:0]};
                        //control_dma <= {1'b1,s_udp_payload_axis_tdata[59:32],3'b000,s_udp_payload_axis_tdata[28:0],3'b000};
                        counter_0=0;
                        s_udp_payload_axis_tready<= 0;
                        state_w <= SEND;
                        end
                    end
                end
                SEND: begin
                    m_axis_tlast <= 0;
                    rd_en<= 1;
                    wr_en<= 1;
                    if(m_axis_tready && fifo_m_axis_tvalid) begin
                        counter_0<= counter_0+1;
                        counter_1<= counter_1+1;
                        if(counter_0>=size-1) begin
                           state_w <= WAIT_TRIGGER;
                           rd_en<=0;
                           wr_en<=0;
                           fifo_res<=1;
                        end
                        else if(counter_1>=mss-1) begin
                            counter_1<=0;
                            rd_en<=1;
                            wr_en<=0;
                            state_w <= IDLE;
                        end
                        else if(counter_1>=mss-2) begin
                            m_axis_tlast <= 1;
                        end
                    end    
                    else begin
                        m_axis_tlast <= 0;
                    end
                end
                IDLE: begin
                    m_axis_tlast <= 0;
                    wr_en<= 0;
                    rd_en<=1;
                    counter_2<= counter_2+1;
                    if(counter_2>=ifg-1) begin
                       counter_2<= 0;
                       state_w <= SEND;
                       rd_en<=1;
                       wr_en<=1;
                    end
                end

                default: begin
                    state_w <= WAIT_TRIGGER;
                end
            endcase
        end
    end
    
//    ila_2 ila_2(
//            .clk (clk),
//       .probe0 (m_axis_tvalid),
//        .probe1 (s_axis_tready),
//        .probe2 (m_axis_tready),
//        .probe3 (s_axis_tvalid),
//        .probe4 (state_w),
//        .probe5 (size),
//        .probe6 (counter_0),
//        .probe7 (counter_1),
//        .probe8 (data_count),
//        .probe9 (af)        
//    );
    
    
    
    axis_data_fifo_0 fifo_0 (
        .s_axis_aresetn(arst),
        .s_axis_aclk(clk),

        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(fifo_s_axis_tready),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tuser(s_axis_tuser),
        
        .m_axis_tvalid(fifo_m_axis_tvalid),
        .m_axis_tready(fifo_m_axis_tready),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(),
        .m_axis_tuser(m_axis_tuser),
        
        .axis_wr_data_count(data_count),
        .almost_full(af)
    );
    
    
    
endmodule