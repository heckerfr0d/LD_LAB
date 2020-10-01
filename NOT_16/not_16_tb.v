`include "not_16.v"

module stimulus;

wire [15:0] b;
reg [15:0] a;

integer i;

not_16 not_16_1(b, a);

initial
begin
  i=0;
  $monitor("%b %b ", a, b);
  $dumpfile("not_16.vcd");
  $dumpvars(0, not_16_1);
  while(i<=65535)
  begin
      a=i;
      i=i+1;  #10;
  end
end
endmodule