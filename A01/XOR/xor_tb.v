module stimulus;

wire c;
reg [1:0] count;

xor1 xor_1(c, count[1], count[0]);

initial
begin
  count = -1;
end

always
begin
    $monitor("%b %b %b", count[1], count[0], c);
    $dumpfile("xor.vcd");
    $dumpvars(0, xor_1);
    count = count+1; #10;
end
endmodule