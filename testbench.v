module testbench ();
    parameter N_8 = 8;
    parameter N_16 = 16;
    parameter N_32 = 32;
    reg clk, rstn;
    wire [3:0] out_4;
    wire [N_8-1:0] out_8;
    wire [N_16-1:0] out_16;
    wire [N_32-1:0] out_32;
    N_bit_counter counter_4(clk, rstn, out_4);
    N_bit_counter #(N_8)counter_8(clk, rstn, out_8);
    N_bit_counter #(N_16)counter_16(clk, rstn, out_16);
    N_bit_counter #(N_32)counter_32(clk, rstn, out_32);

    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end

    initial begin
        rstn = 0;
        repeat(5) @(negedge clk);
        rstn = 1;
        repeat(10000000) @(negedge clk);
        $stop;
    end

    initial begin
        $monitor("out_4 = %d, out_8 = %d, out_16 = %d, out_32 = %d", out_4, out_8, out_16, out_32);
    end
endmodule