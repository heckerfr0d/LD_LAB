`include "Hadif_B190513CS_Q02.v"

module fa_tb;

wire [1:0] s;
reg [2:0] count;

fulladder fa(s[0], s[1], count[2], count[1], count[0]);

initial
begin
  $dumpfile("fa.vcd");
  $dumpvars(0, fa);
  for (count = 0; count<7 ; count = count+1 )
  begin
    $monitor("%b + %b + %b = %b", count[2], count[1], count[0], s);
    #10;
  end
  $finish;
end
endmodule