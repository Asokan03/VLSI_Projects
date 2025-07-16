`timescale 1ns / 1ps

module tb_ff;

    // === Modify the following based on flip-flop type ===
    reg clk, rst;
    reg d;              // For D FF → change to t, j, k, s, r for others
    wire q;

    // === DUT Instantiation (change module name and ports accordingly) ===
    d_ff dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Stimulus block
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1; d = 0;

        // Apply reset
        #10 rst = 0;

        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 1;

        // Apply reset again mid-way
        #10 rst = 1;
        #10 rst = 0;

        // More test vectors
        #10 d = 0;
        #10 d = 1;

        #10 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time = %0t | clk = %b | rst = %b | d = %b | q = %b", $time, clk, rst, d, q);
    end

endmodule
