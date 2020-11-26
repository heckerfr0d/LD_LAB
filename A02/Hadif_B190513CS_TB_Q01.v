`include "Hadif_B190513CS_Q01.v"

module ha_tb;

wire [1:0] s;
reg [1:0] count;

halfadder ha(s[0], s[1], count[0], count[1]);

initial
begin
  $dumpfile("ha.vcd");
  $dumpvars(0, ha);
  for (count = 0; count<3 ; count = count+1 )
  begin
    $monitor("%b + %b = %b", count[1], count[0], s);
    #10;
  end
  $finish;
end
endmodule