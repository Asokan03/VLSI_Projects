module tb_SIPO;
    reg clk, rst, serial_in;
    wire [3:0] parallel_out;

    SIPO uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | serial_in=%b | parallel_out=%b", $time, serial_in, parallel_out);

        clk = 0;
        rst = 1;
        serial_in = 0;

        #10 rst = 0;

        // Send serial data 1 0 1 1
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;

        #20 $finish;
    end
endmodule
