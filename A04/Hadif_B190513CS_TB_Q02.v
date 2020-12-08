`include "Hadif_B190513CS_Q02.v"

module xpyxmy_tb;
wire signed [31:0] O;
reg signed [15:0] X, Y;
reg clk, L;

xpyxmy x1(O, X, Y, clk, L);

initial
begin
    $dumpfile("alu.vcd");
    $dumpvars(0, x1);
    $monitor("clk = %b, Load = %b, X = %d, Y = %d, O = %d", clk, L, X, Y, O);
    clk = 0;
    L =  1;
    X = 10;
    for(Y=0;Y<12;Y=Y+1)
        #15;
    $finish;
end

always #5 clk = ~clk;

always #7 L = ~L;

endmodule