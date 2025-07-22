module pipo_4bit (
    input  wire       clk,
    input  wire       reset,
    input  wire       load,
    input  wire [3:0] d_in,
    output reg  [3:0] q_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q_out <= 4'b0000;
        else if (load)
            q_out <= d_in;
    end

endmodule
