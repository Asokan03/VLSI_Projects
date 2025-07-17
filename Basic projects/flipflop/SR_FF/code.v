module sr_ff (
    input clk,
    input rst,      // asynchronous active-high reset
    input s,
    input r,
    output reg q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;             // reset output
    else begin
        case ({s, r})
            2'b00: q <= q;     // Hold
            2'b01: q <= 1'b0;  // Reset
            2'b10: q <= 1'b1;  // Set
            2'b11: q <= 1'bx;  // Invalid
        endcase
    end
end

endmodule
