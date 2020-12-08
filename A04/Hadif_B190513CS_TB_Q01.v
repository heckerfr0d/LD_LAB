`include "Hadif_B190513CS_Q01.v"

module mult_tb;
wire signed [31:0] O;
reg signed [15:0] X, Y;
reg clk, L;

mult m1(O, X, Y, clk, L);

initial
begin
    $dumpfile("alu.vcd");
    $dumpvars(0, m1);
    $monitor("clk = %b, Load = %b, X = %d, Y = %d, O = %d", clk, L, X, Y, O);
    clk = 0;
    L =  1;
    X = 11111;
    for(Y=0;Y<12;Y=Y+1)
        #15;
    $finish;
end

always #5 clk = ~clk;

always #7 L = ~L;

endmodule