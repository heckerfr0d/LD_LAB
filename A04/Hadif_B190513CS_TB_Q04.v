`include "Hadif_B190513CS_Q04.v"

module div_tb;
wire signed [15:0] O;
reg signed [15:0] X, Y;
reg clk, L;

div d1(O, X, Y, clk, L);

initial
begin
    $dumpfile("alu.vcd");
    $dumpvars(0, d1);
    $monitor("clk = %b, Load = %b, X = %d, Y = %d, O = %d", clk, L, X, Y, O);
    clk = 0;
    L =  1;
    X = 25; Y = 5; #11;
    X = 301; Y = 39; #11;
    X = 294; Y = 47; #11;
    X = 400; Y = 99; #11;
    X = 1762; Y = 345; #11;
    X = 1872; Y = 624; #11;
    X = 2254; Y = 696; #11;
    X = 3672; Y = 921; #11;
    X = 4722; Y = 1087; #11;
    X = 5683; Y = 1178; #11;
    X = 6729; Y = 1356; #11;
    X = 7257; Y = 1893; #11;
    X = 8934; Y = 1942; #11;
    X = 9956; Y = 2489; #11;
    X = 10573; Y = 2735; #11;
    X = 11483; Y = 2929; #11;
    X = 12784; Y = 3196; #11;
    X = 13892; Y = 3372; #11;
    X = 14631; Y = 3567; #11;
    X = 15789; Y = 3986; #11;
    X = 16982; Y = 4321; #11;
    X = 17992; Y = 4498; #11;
    X = 18543; Y = 5000; #11;
    $finish;
end

always #5 clk = ~clk;

always #7 L = ~L;

endmodule