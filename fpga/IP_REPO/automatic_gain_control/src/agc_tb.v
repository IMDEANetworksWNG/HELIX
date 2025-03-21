`timescale 1ns / 1ps

module agc_tb;

    reg clk;
    reg arst;
    reg signed [15:0] data_in_I;
    reg signed [15:0] data_in_Q;
    
    reg signed [15:0] data_out_I;
    reg signed [15:0] data_out_Q;
    
    //wire [23:0] gain;
    reg signed [11:0] gain;
    wire [23:0] agc_out;
    
        // Arrays to store binary data from files
    reg signed [15:0] I_mem [0:100000]; // Adjust size based on your file length
    reg signed [15:0] Q_mem [0:100000]; 
    integer index = 0;
    integer num_samples = 100000;  // Adjust based on actual file length
    
    // Instantiate the AGC module
    agc uut (
        .clk(clk),
        .arst(arst),
        .data_in_I(data_in_I),
        .data_in_Q(data_in_Q),
        .gain(agc_out)
    );

    
    
    always @(posedge clk) begin
        if (!arst) begin 
            gain <= 12'b0;
        end
        else begin
                if(agc_out[22:8]>8) begin
                    gain <= 8;
                end else begin
                    gain <= agc_out[11:0];
                end      
        end
    end
    
           // Intermediate multiplication result (48-bit)
    wire signed [27:0] mult_result_0,mult_result_1;
    assign mult_result_0 = data_in_I * gain;
    assign mult_result_1 = data_in_Q * gain;

    // Adjust by shifting right 4 bits to remove the fractional part
    wire signed [19:0] shifted_result_0,shifted_result_1;
    assign shifted_result_0 = mult_result_0 >>> 8; // Arithmetic shift
    assign shifted_result_1 = mult_result_1 >>> 8;

    always @(posedge clk) begin
        if (!arst) begin 
            data_out_I <= 16'b0;
            data_out_Q <= 16'b0;
        end
        else begin
//                 data_out_I <= (shifted_result_0 > 16'sd32767) ? 16'sh7FFF :  // Max positive
//                                (shifted_result_0 < -16'sd32768) ? -16'sh8000 : // Max negative
//                                shifted_result_0[15:0]; // Truncate to 16-bit
                       data_out_I <=shifted_result_0[15:0];
                                
//                data_out_Q <= (shifted_result_1 > 16'sd32767) ? 16'sh7FFF :  // Max positive
//                    (shifted_result_1 < -16'sd32768) ? -16'sh8000 : // Max negative
                    data_out_Q=shifted_result_1[15:0]; 
        end
    end

    // Clock generation (100 MHz -> 10 ns period)
    always #5 clk = ~clk;

    // Load binary data from files
    initial begin
        // Read binary files into memory arrays
        $readmemb("dataIn_HBW_I.txt", I_mem);
        $readmemb("dataIn_HBW_Q.txt", Q_mem);

        // Initialize signals
        clk = 0;
        arst = 0;
        data_in_I = 0;
        data_in_Q = 0;

        // Apply reset
        #20 arst = 1;

        // Apply test vectors from memory
        for (index = 0; index < num_samples; index = index + 1) begin
            data_in_I = I_mem[index];
            data_in_Q = Q_mem[index];
            #10;  // Wait for next clock cycle
        end

        // Hold for a while before finishing
        #50;
        $finish;
    end


    // Monitor output
//    initial begin
//        $monitor("Time = %t | I = %d | Q = %d | Gain = %d", 
//                  $time, data_in_I, data_in_Q, gain,mult_result_0,mult_result_1,data_out_I,data_out_Q);
//    end

endmodule

