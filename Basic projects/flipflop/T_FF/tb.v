`timescale 1ns/1ps

module t_ff_tb;

  // Testbench signals
  reg clk;
  reg rst;
  reg t;
  wire q;

  // DUT instantiation
  t_ff dut (
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q)
  );

  // Clock generation (10ns period => 100 MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle every 5ns
  end

  // Stimulus
  initial begin
    $display("Time\tclk\trst\tt\tq");
    $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, rst, t, q);

    // Initialize
    rst = 1; t = 0;
    #10;
    
    rst = 0;

    // T=0: Should hold
    #10; t = 0;
    #10;

    // T=1: Should toggle
    #10; t = 1;
    #20;

    // T=1: Should keep toggling
    #20;

    // T=0: Hold again
    #10; t = 0;
    #20;

    // Apply reset again
    #10; rst = 1;
    #10; rst = 0;

    // Final toggles
    #10; t = 1;
    #20;

    $finish;
  end

endmodule
