module D_flipflop (
    input d, rstn, clk,
    output reg q, qn
);
    always @(posedge clk or negedge rstn) begin
        if (~rstn) q <= 0;
        else q <= d;
        assign qn = ~q;
    end
endmodule