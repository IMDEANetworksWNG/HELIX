`timescale 1ns / 1ps

module agc (
    input wire clk,
    input wire arst,
    
    input wire [15:0] data_in_I, // Input signal
    input wire [15:0] data_in_Q, // Input signal
    //input wire [15:0] Vref, // Reference voltage
    
    output wire [31:0] gain // Output signal

);

    // absolute value
    reg [15:0] abs_data_in_I,abs_data_in_Q;
    reg [16:0] abs_sum;
    
    //moving average
    integer ii=0;
    reg [16:0] mov_average [63:0];
    reg [16:0] filter_out; 
    reg [22:0] acc;
    
    wire [16:0] divisor_in;

    // Parameters
    localparam SHIFT = 6;
    localparam Vref = 10000;
    

    // Absolute value abs = |I| + |Q|
    always @(posedge clk) begin
         if(data_in_I[15]) begin
            abs_data_in_I <= -data_in_I;
         end else begin
            abs_data_in_I <= data_in_I;
         end
         if(data_in_Q[15]) begin
            abs_data_in_Q <= -data_in_Q;
         end else begin
            abs_data_in_Q <= data_in_Q;
         end
         abs_sum <= abs_data_in_I + abs_data_in_Q;
    end

   //Moving Average 64 
   always @(posedge clk) begin
      for(ii=0; ii<63; ii=ii+1)
            mov_average[ii] <= mov_average[ii-1];
      mov_average[0] <= abs_sum;     
    end
    
    always @(posedge clk) begin
        filter_out<=abs_sum-mov_average[63];
    end
    
    always @(posedge clk) begin
        if (!arst) begin 
            acc <= 32'b0;
        end
        else begin
            acc <= acc + filter_out;
        end
    end
    
    assign divisor_in = acc << SHIFT; // Output of the accumulator divided by 64
    
    //Division
    div_gen_0 # (
	) divisor (
	    .aclk(),
		.s_axis_divisor_tdata(divisor_in),
		.s_axis_divisor_tvalid(1),
		
		.s_axis_dividend_tdata(Vref),
		.s_axis_dividend_tvalid(1),
		
		.m_axis_dout_tdata(gain),
		.m_axis_dout_tvalid()
	);
    


endmodule
