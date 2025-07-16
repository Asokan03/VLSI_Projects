module d_ff (
    input  wire clk,    // Clock input
    input  wire rst,    // Asynchronous active-high reset
    input  wire d,      // Data input
    output reg  q       // Output
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;   // Reset output to 0
        else
            q <= d;      // Latch data on rising edge of clk
    end

endmodule
