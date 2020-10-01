`include "xor.v"

module stimulus;

wire c;
reg a, b;

xor1 xor_1(c, a, b);

always
begin
    $monitor("%b %b %b", a, b, c);
    $dumpfile("xor.vcd");
    $dumpvars(0, xor_1);
    a = 1'b0; b = 1'b0; #10;
    a = 1'b0; b = 1'b1; #10;
    a = 1'b1; b = 1'b0; #10;
    a = 1'b1; b = 1'b1; #10;
end
endmodule