module stimulus;

wire [15:0] c;
reg [15:0] a, b;

integer i, j;

and_16 and_16_1(c, a, b);

always
begin
  $monitor("%b %b %b ", a, b, c);
  $dumpfile("and_16.vcd");
  $dumpvars(0, and_16_1);
  for(i=0;i<=65535;i=i+1)
    for(j=0;j<=65535;j=j+1)
    begin
      a=i; b=j; #10;
    end
end
endmodule