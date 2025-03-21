`timescale 1 ns / 1 ps

module agc # (
	)(
    input wire clk,
    input wire arst,
    
    input wire [15:0] data_in_I, // Input signal
    input wire [15:0] data_in_Q, // Input signal
    //input wire [15:0] Vref, // Reference voltage
    
    output wire [23:0] gain, // Output signal
    input wire [14:0] Vref

);

    // absolute value
    reg [15:0] abs_data_in_I,abs_data_in_Q;
    reg [15:0] abs_sum;
    
    //moving average
    integer ii=0;
    reg [15:0] mov_average [63:0];
    reg signed [15:0] filter_out; 
    reg signed [23:0] acc;
    
    reg [16:0] divisor_in;
    
    wire valid;
   

    // Parameters
    localparam SHIFT = 6;
    //localparam 
    

    // Absolute value abs = |I| + |Q|
    always @(posedge clk) begin
        if (!arst) begin 
            abs_data_in_I <= 16'b0;
            abs_data_in_Q <= 16'b0;
            abs_sum  <= 16'b0;
        end
        else begin
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
    end

   //Moving Average 64 
   always @(posedge clk) begin
      if (!arst) begin 
          for(ii=0; ii<64; ii=ii+1)
            mov_average[ii] <= 17'b0;
      end
      else begin
          for(ii=0; ii<64; ii=ii+1)
                mov_average[ii] <= mov_average[ii-1];
          mov_average[0] <= abs_sum; 
      end    
    end
    
    always @(posedge clk) begin
        if (!arst) begin 
            filter_out <= 16'b0;
        end
        else begin
            filter_out<=abs_sum-mov_average[63];
        end
    end
    
    always @(posedge clk) begin
        if (!arst) begin 
            acc <= 23'b0;
        end
        else begin
            acc <= acc + filter_out;
            if(acc<0)begin
                acc<= 23'b0;
            end
        end
    end
    
   always @(posedge clk) begin
        if (!arst) begin 
            divisor_in <= 16'b0;
        end
        else begin
               divisor_in <= acc >> SHIFT;
        end
    end
    
    //assign divisor_in = acc >> SHIFT; // Output of the accumulator divided by 64
    assign valid =1;
    
    //Division
    div_gen_0 # (
	) divisor (
	    .aclk(clk),
	    .aresetn(arst),
		.s_axis_divisor_tdata(divisor_in),
		.s_axis_divisor_tvalid(valid),
		
		.s_axis_dividend_tdata(Vref),
		.s_axis_dividend_tvalid(valid),
		
		.m_axis_dout_tdata(gain),
		.m_axis_dout_tvalid()
	);
    


endmodule