// JK Flip-Flop using D Flip-Flop logic
module jk_ff_using_dff (
    input wire clk,
    input wire rst,       // active high reset
    input wire j,
    input wire k,
    output reg q
);
    wire d;

    // Derive D from J, K, and Q
    assign d = (j & ~q) | (~k & q);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
endmodule
