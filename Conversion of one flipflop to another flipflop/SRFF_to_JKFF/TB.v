`timescale 1ns / 1ps

module tb_jk_ff_using_sr();

  reg clk;
  reg rst;
  reg j, k;
  wire q;

  // Instantiate the DUT
  jk_ff_using_sr dut (
    .clk(clk),
    .rst(rst),
    .j(j),
    .k(k),
    .q(q)
  );

  // Clock generation: toggle every 5ns => 10ns period
  always #5 clk = ~clk;

  initial begin
    $display("Time\tclk\trst\tJ\tK\tQ");
    $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, clk, rst, j, k, q);

    // Initialize
    clk = 0;
    rst = 1; j = 0; k = 0;   // Apply reset
    #10;

    rst = 0;

    // J=0, K=0 → No change
    j = 0; k = 0; #10;

    // J=0, K=1 → Reset
    j = 0; k = 1; #10;

    // J=1, K=0 → Set
    j = 1; k = 0; #10;

    // J=1, K=1 → Toggle
    j = 1; k = 1; #10;
    #10;  // Another toggle

    // J=0, K=0 → No change again
    j = 0; k = 0; #10;

    $finish;
  end

endmodule
