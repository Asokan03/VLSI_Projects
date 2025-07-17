`timescale 1ns/1ps
module tb;

reg clk, rst, j, k;
wire q;

// Instantiate the JK Flip-Flop
jk_ff uut (
    .clk(clk),
    .rst(rst),
    .j(j),
    .k(k),
    .q(q)
);

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    $display("Time\tclk\trst\tj\tk\tq");
    $monitor("%dns\t%b\t%b\t%b\t%b\t%b", $time, clk, rst, j, k, q);

    // Initial values
    clk = 0;
    rst = 1; j = 0; k = 0;

    // Release reset
    #10 rst = 0;

    // Test cases
    #10 j = 0; k = 0;   // No change
    #10 j = 0; k = 1;   // Reset
    #10 j = 1; k = 0;   // Set
    #10 j = 1; k = 1;   // Toggle
    #10 j = 1; k = 1;   // Toggle again
    #10 j = 0; k = 1;   // Reset
    #10 j = 0; k = 0;   // Hold
    #10 j = 1; k = 0;   // Set
    #10 j = 0; k = 0;

    // Activate reset again
    #10 rst = 1;
    #10 rst = 0;

    #20 $finish;
end

endmodule
