// JK Flip-Flop using SR Flip-Flop Logic
module jk_ff_using_sr (
    input wire clk,
    input wire rst,    // Active-high async reset
    input wire j,
    input wire k,
    output reg q
);
    wire s, r;

    // SR equivalent logic
    assign s = j & ~q;
    assign r = k & q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else begin
            case ({s, r})
                2'b00: q <= q;       // No change
                2'b01: q <= 0;       // Reset
                2'b10: q <= 1;       // Set
                default: q <= q;     // Avoid invalid (2'b11)
            endcase
        end
    end
endmodule
