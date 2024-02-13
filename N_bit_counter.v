module N_bit_counter #(
    parameter N = 4
)(
    input clk, rstn,
    output [N-1:0] out
);
    wire [N-1:0] q_to_clk;
    wire [N-1:0] qn_to_d;

    genvar i;
    generate
        D_flipflop ff1(qn_to_d[0], rstn, clk, q_to_clk[0], qn_to_d[0]);
        for (i = 1; i<N; i=i+1) begin
            D_flipflop ff2(qn_to_d[i], rstn, q_to_clk[i-1], q_to_clk[i], qn_to_d[i]);
        end
    endgenerate
    assign out = qn_to_d;
endmodule