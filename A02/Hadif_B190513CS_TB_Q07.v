`include "Hadif_B190513CS_Q07.v"

module neg16_tb;

wire [15:0] b;
reg [15:0] a;

integer i;

neg_16 ng1(b, a);

initial
begin
  i=0;
  $dumpfile("neg_16.vcd");
  $dumpvars(0, ng1);
  $monitor("%b %b ", a, b);
  while(i<=65535)
  begin
      a=i;
      i=i+1;  #10;
  end
  $finish;
end
endmodule