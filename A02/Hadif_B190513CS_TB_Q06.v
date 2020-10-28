`include "Hadif_B190513CS_Q06.v"

module incr16_tb;

wire [15:0] s;
reg [15:0] a;

incr_16 i16(s, a);

initial
begin
  $dumpfile("inc16.vcd");
  $dumpvars(0, i16);
  for (a = 0; a<65535 ; a = a+1 )
  begin
    $monitor("%d + 1 =%d", a, s);
    #10;
  end
  $finish;
end
endmodule