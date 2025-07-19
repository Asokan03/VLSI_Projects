`timescale 1ns / 1ps

module siso_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg serial_in;
    wire serial_out;

    // Instantiate your design
    siso uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // Clock generation: 10 ns clock period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        serial_in = 0;

        // Hold reset for a few cycles
        #10;
        reset = 0;

        // Apply serial input bits one by one (example: 1 0 1 1)
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Observe more cycles to see output bits shift out
        serial_in = 0; #50;

        $finish;
    end

endmodule
