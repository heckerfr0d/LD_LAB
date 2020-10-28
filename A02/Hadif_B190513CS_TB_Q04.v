`include "Hadif_B190513CS_Q04.v"

module add4_tb;

wire [4:0] s;
reg [7:0] count;

add_4 a4(s[3:0], s[4], count[7:4], count[3:0], 1'b0);

initial
begin
  $dumpfile("add4.vcd");
  $dumpvars(0, a4);
  for (count = 0; count<255 ; count = count+1 )
  begin
    $monitor("%b + %b = %b", count[7:4], count[3:0], s[3:0]);
    #10;
  end
  $finish;
end
endmodule