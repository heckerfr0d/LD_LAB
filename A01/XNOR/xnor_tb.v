module stimulus;

wire c;
reg [1:0] count;

xnor1 xnor_1(c, count[1], count[0]);

initial
begin
  count = -1;
end

always
begin
    $monitor("%b %b %b", count[1], count[0], c);
    $dumpfile("xnor.vcd");
    $dumpvars(0, xnor_1);
    count = count+1; #10;
end
endmodule