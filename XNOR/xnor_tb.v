`include "xnor.v"

module stimulus;

wire c;
reg a, b;

xnor1 xnor_1(c, a, b);

always
begin
    $monitor("%b %b %b", a, b, c);
    $dumpfile("xnor.vcd");
    $dumpvars(0, xnor_1);
    a = 1'b0; b = 1'b0; #10;
    a = 1'b0; b = 1'b1; #10;
    a = 1'b1; b = 1'b0; #10;
    a = 1'b1; b = 1'b1; #10;
end
endmodule