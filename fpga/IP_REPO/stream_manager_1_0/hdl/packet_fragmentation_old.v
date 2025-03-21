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


module packet_fragmentation(

    input  wire        clk,
    input  wire        arst,
    
    input  wire [63:0] s_axis_tdata,
    input wire          s_axis_tvalid,
    output reg        s_axis_tready,
    input  wire        s_axis_tlast,
    input  wire        s_axis_tuser,
        
    output  wire [63:0] m_axis_tdata,
    output  reg        m_axis_tvalid,
    input wire        m_axis_tready,
    output  reg        m_axis_tlast,
    output  wire        m_axis_tuser,
    
    input wire  trigger,
    input wire [31:0] mss,
    input wire [31:0] ifg,
    input wire [31:0] transfer_size

    );


// Params
localparam WAIT_TRIGGER = 3'b000;
localparam SEND = 3'b001;
localparam IDLE = 3'b010;

reg[31:0] transfer_size_count,mss_count,ifg_count;
reg [63:0] data;
reg[2:0] state_w = WAIT_TRIGGER;
assign m_axis_tdata=data;



reg trigger_r,trigger_rising_edge;

always @ (posedge clk) begin

end


always @ (posedge clk) begin
    if(!arst) begin
        transfer_size_count <=0;
        mss_count <=0;
        ifg_count <=0;
        m_axis_tlast <= 0;
        s_axis_tready<=0;
        m_axis_tvalid<=0;
        state_w <= WAIT_TRIGGER;
    end
    else begin
        case(state_w)
            WAIT_TRIGGER: begin
                transfer_size_count <=0;
                mss_count <=0;
                ifg_count <=0;
                m_axis_tlast <= 0;
                s_axis_tready<=0;
                m_axis_tvalid<=0;
                data<={64{1'b0}};
                if (trigger_rising_edge) begin
                    if (s_axis_tvalid && m_axis_tready) begin
                        transfer_size_count<= transfer_size_count+1;
                        mss_count<= mss_count+1;
                        transfer_size_count=0;
                        s_axis_tready<=1;
                        m_axis_tvalid<=1;
                        data<=s_axis_tdata;
                        state_w <= SEND;
                        trigger_rising_edge <=0;
                    end
                end               
                else begin                
                    trigger_rising_edge <= !trigger_r && trigger;
                    trigger_r<=trigger;
                end
            end
            SEND: begin
                m_axis_tlast <= 0;
                data<={64{1'b0}};
                if(m_axis_tready && s_axis_tvalid) begin
                    data<=s_axis_tdata;
                    transfer_size_count<= transfer_size_count+1;
                    mss_count<= mss_count+1;
                    s_axis_tready<=1;
                    m_axis_tvalid<=1;
                    if(transfer_size_count>=transfer_size-1) begin
                       s_axis_tready<=0;
                       m_axis_tvalid<=0;
                       m_axis_tlast<=1;
                       data<={64{1'b0}};
                       state_w <= WAIT_TRIGGER;
                    end
                    else if(mss_count>=mss-1) begin
                        mss_count<=0;
                        s_axis_tready<=0;
                        m_axis_tvalid<=0;
                        m_axis_tlast<=1;
                        data<={64{1'b0}};
                        state_w <= IDLE;
                    end
                    else if(mss_count>=mss-2) begin
                        m_axis_tlast <= 1;
                    end
                end    
                else begin
                    s_axis_tready<=0;
                    m_axis_tvalid<=0;
                    m_axis_tlast <= 0;
                end
            end
            IDLE: begin
                m_axis_tlast <= 0;
                ifg_count<= ifg_count+1;
                data<={64{1'b0}};
                if(ifg_count>=ifg-1) begin
                   ifg_count<= 0;
                   s_axis_tready<=1;
                   m_axis_tvalid<=1;
                   state_w <= SEND;
                end
            end

            default: begin
                state_w <= WAIT_TRIGGER;
            end
        endcase
    end
end

ila_0 ila_0(
    .clk (clk),
    .probe0 (m_axis_tvalid),
    .probe1 (s_axis_tready),
    .probe2 (m_axis_tready),
    .probe3 (s_axis_tvalid),
    .probe4 (state_w),
    .probe5 (mss_count),
    .probe6 (ifg_count),
    .probe7 (transfer_size_count),
    .probe8 (m_axis_tdata),
    .probe9 (m_axis_tlast),
    .probe10 (trigger),
    .probe11 (trigger_r),
    .probe12 (trigger_rising_edge)
    
);

      
    
endmodule