`timescale 1ns / 1ps

module agc_tb;

    reg clk;
    reg arst;
    reg [15:0] data_in_I;
    reg [15:0] data_in_Q;
    wire [31:0] gain;

    // Instantiate the AGC module
    agc uut (
        .clk(clk),
        .arst(arst),
        .data_in_I(data_in_I),
        .data_in_Q(data_in_Q),
        .gain(gain)
    );

    // Clock generation (100 MHz -> 10 ns period)
    always #5 clk = ~clk;

    // Stimulus process
    initial begin
        // Initialize signals
        clk = 0;
        arst = 0;
        data_in_I = 0;
        data_in_Q = 0;
        
        // Apply reset
        #20 arst = 1; 
        
        // Apply test vectors
        #10 data_in_I = 16'd5000; data_in_Q = 16'd3000;
        #10 data_in_I = -16'd7000; data_in_Q = 16'd2000;
        #10 data_in_I = 16'd1000; data_in_Q = -16'd500;
        #10 data_in_I = -16'd2000; data_in_Q = -16'd1000;
        
        // Hold the simulation for a while
        #1000;

        // Finish simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %t | I = %d | Q = %d | Gain = %d", 
                  $time, data_in_I, data_in_Q, gain);
    end

endmodule
