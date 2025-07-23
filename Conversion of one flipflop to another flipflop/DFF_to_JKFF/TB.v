module tb_jk_ff_using_dff;

    reg clk, rst, j, k;
    wire q;

    // Instantiate the design
    jk_ff_using_dff dut (
        .clk(clk),
        .rst(rst),
        .j(j),
        .k(k),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("jk_ff_using_dff.vcd");
        $dumpvars(0, tb_jk_ff_using_dff);

        clk = 0; rst = 1; j = 0; k = 0;
        #10 rst = 0;

        // No change
        j = 0; k = 0; #10;

        // Reset (Q=0)
        j = 0; k = 1; #10;

        // Set (Q=1)
        j = 1; k = 0; #10;

        // Toggle (Q=~Q)
        j = 1; k = 1; #10;
        j = 1; k = 1; #10;

        // Again Reset
        j = 0; k = 1; #10;

        $finish;
    end
endmodule
