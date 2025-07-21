module SIPO (
    input wire clk,
    input wire rst,
    input wire serial_in,
    output reg [3:0] parallel_out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        parallel_out <= 4'b0000;
    else
        parallel_out <= {parallel_out[2:0], serial_in};  // Shift left
end

endmodule
