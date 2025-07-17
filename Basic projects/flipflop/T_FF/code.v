module t_ff (
    input clk,
    input rst,     // Asynchronous active high reset
    input t,
    output reg q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else if (t)
        q <= ~q;    // Toggle
    else
        q <= q;     // Hold
end

endmodule
