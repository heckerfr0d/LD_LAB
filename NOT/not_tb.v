module stimulus;

wire c;
reg a;

not1 not_1(c, a);

always
begin
    $monitor("%b %b ", a, c);
    $dumpvars(0, not_1);
    $dumpfile("not.vcd");
    a = 1'b0; #10;
    a = 1'b1; #10;
end
endmodule