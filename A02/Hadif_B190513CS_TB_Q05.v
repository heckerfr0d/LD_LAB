`include "Hadif_B190513CS_Q05.v"

module add16_tb;

wire [15:0] s;
reg [15:0] a, b;

add_16 a16(s[15:0], a, b);

initial
begin
  $dumpfile("add16.vcd");
  $dumpvars(0, a16);
  for (a = 0; a<255 ; a = a+1 )
    for (b = 0; b<255 ; b = b+1)
    begin
        $monitor("%d +%d =%d", a, b, s);
        #10;
    end
  $finish;
end
endmodule