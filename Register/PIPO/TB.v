`timescale 1ns / 1ps

module pipo_4bit_tb;

    reg clk;
    reg reset;
    reg load;
    reg [3:0] d_in;
    wire [3:0] q_out;

    // Instantiate the PIPO DUT
    pipo_4bit dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .d_in(d_in),
        .q_out(q_out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | Reset=%b | Load=%b | D_in=%b | Q_out=%b", $time, reset, load, d_in, q_out);

        // Initial states
        clk = 0; reset = 1; load = 0; d_in = 4'b0000;

        #10 reset = 0;

        // Load data 1010
        d_in = 4'b1010; load = 1; #10;

        // Keep load low, change input
        d_in = 4'b1111; load = 0; #10;

        // Load again
        load = 1; #10;

        // Reset
        reset = 1; #10;
        reset = 0; #10;

        // Load 0001
        d_in = 4'b0001; load = 1; #10;

        $finish;
    end

endmodule
