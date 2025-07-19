module siso_shift_register (
    input clk,
    input reset,
    input serial_in,
    output serial_out
);

reg [3:0] shift_reg;

assign serial_out = shift_reg[3];  // MSB is the output

always @(posedge clk or posedge reset) begin
    if (reset)
        shift_reg <= 4'b0000;
    else begin
        shift_reg <= {shift_reg[2:0], serial_in};  // Shift left and insert serial_in
    end
end

endmodule
