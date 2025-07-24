always @(posedge clk or posedge rst) begin
  if (rst)
    q[0] <= 0;
  else
    q[0] <= ~q[0]; // toggle logic (T = 1 → D = ~q)
end

always @(posedge q[0] or posedge rst) begin
  if (rst)
    q[1] <= 0;
  else
    q[1] <= ~q[1];
end

always @(posedge q[1] or posedge rst) begin
  if (rst)
    q[2] <= 0;
  else
    q[2] <= ~q[2];
end
endmodule
