module tb_async_up_counter;

reg clk, rst;
wire [2:0] q;

async_up_counter uut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Generate clock
always #5 clk = ~clk;  // 10 ns period

initial begin
    $display("Time\t clk rst q");
    $monitor("%0t\t %b   %b   %b", $time, clk, rst, q);
    
    clk = 0;
    rst = 1;
    #12 rst = 0;

    #100 $finish;
end

endmodule
