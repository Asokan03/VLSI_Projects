module mux4_to_1 (
  input i0,
  input i1,
  input i2,
  input i3,
  input [1:0] sel,
  output reg y
);

always @(*) begin
  case (sel)
    2'b00: y = i0;
    2'b01: y = i1;
    2'b10: y = i2;
    2'b11: y = i3;
    default: y = 1'b0;
  endcase
end

endmodule
