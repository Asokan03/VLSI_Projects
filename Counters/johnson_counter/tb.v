module tb_johnson;

reg clk, rst;
wire [3:0] q;

// Instantiate the Johnson Counter
johnson_counter dut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock Generation
always #5 clk = ~clk;

initial begin
    $monitor("Time=%0dns, rst=%b, q=%b", $time, rst, q);

    clk = 0;
    rst = 1;
    #10 rst = 0;

    #100 $finish;
end

endmodule
