module tb_ring_counter;
    reg clk, rst;
    wire [3:0] q;

    ring_counter dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

        always #5 clk = ~clk; // Clock period = 5ns

    initial begin
      $strobe("Time\tclk\trst\tq");
      $monitor("%0dns\t%b\t%b\t%b", $time, clk, rst, q);
       clk = 0; rst = 1; #10; // Assert reset
        rst = 0;      // Deassert reset

        #100; // Run for some time
        $finish;
    end

endmodule
