`timescale 1ns / 1ps

module tb;

    reg clk;
    reg rst;
    reg s;
    reg r;
    wire q;

    // Instantiate the SR flip-flop
    sr_ff uut (
        .clk(clk),
        .rst(rst),
        .s(s),
        .r(r),
        .q(q)
    );

    // Clock generation: toggle every 2ns → 4ns period
    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end

    // Apply stimulus
    initial begin
        // Initial values
        rst = 1; s = 0; r = 0;
        #3 rst = 0;   // Deassert reset at 3ns

        // Apply inputs at positive edges
        #5 s = 1; r = 0;   // Set
        #10 s = 0; r = 1;  // Reset
        #10 s = 1; r = 1;  // Invalid
        #10 s = 0; r = 0;  // Hold
        #10 s = 1; r = 0;  // Set
        #10 s = 0; r = 1;  // Reset
        #10 $finish;
    end

endmodule
