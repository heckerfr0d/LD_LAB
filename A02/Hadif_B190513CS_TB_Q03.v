`include "Hadif_B190513CS_Q03.v"

module inc4_tb;

wire [3:0] s;
reg [3:0] count;
wire c;

incr_4 i4(s, c, count, 1'b1);

initial
begin
  $dumpfile("inc4.vcd");
  $dumpvars(0, i4);
  for (count = 0; count<15 ; count = count+1 )
  begin
    $monitor("%b + %b = %b", count, 4'b1, s);
    #10;
  end
  $finish;
end
endmodule