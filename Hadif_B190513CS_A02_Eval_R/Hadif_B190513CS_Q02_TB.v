`include "Hadif_B190513CS_Q02.v"

module AIIdash_eval_tb;

wire signed [15:0] out_dash;
wire zr_dash,ng_dash;
reg signed [15:0] x,y;
reg [6:0] f0;
reg signed [15:0] y_dash;
reg [6:0] f1;
circuitII_dash a(out_dash, zr, ng, x, y, f0[6], f0[5], f0[4], f0[3], f0[2], f0[1], f0[0], y_dash, f1[6], f1[5], f1[4], f1[3], f1[2], f1[1], f1[0]);


initial
begin
  x = 1023;
  y = 2047;
  y_dash=1234;
  $dumpfile("alu.vcd");
  $dumpvars(0, a);
  $display("x =%d, y =%d", x, y);
  // $display("         x               y         zx  nx  zy  ny  f0  no         out        zr  ng");
  $display("|    x  |    y   |zx  |nx  |zy  |ny |f0  |f1  |no  |zx' |nx' |zy' |ny'|f0  |f1  |no  |    out        |zr  |ng |");
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d(x+y+y') |%b   |%b  |", x, y, f0[6], f0[5], f0[4], f0[3], f0[2], f0[1], f0[0], f1[6], f1[5], f1[4], f1[3], f1[2], f1[1], f1[0], out_dash, zr, ng);
  f0 = 7'b0000100 ;  // x+y|
  f1 = 7'b0000100 ; #10 ; // x+y|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d (x+128) |%b   |%b  |", x, y, f0[6], f0[5], f0[4], f0[3], f0[2], f0[1], f0[0], f1[6], f1[5], f1[4], f1[3], f1[2], f1[1], f1[0], out_dash, zr, ng);
  f0 = 7'b0011000 ;  // x+128|
  f1 = 7'b0000110 ; #10 ; // x+128|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d(x+y+128)|%b   |%b  |", x, y, f0[6], f0[5], f0[4], f0[3], f0[2], f0[1], f0[0], f1[6], f1[5], f1[4], f1[3], f1[2], f1[1], f1[0], out_dash, zr, ng);
  f0 = 7'b0000100 ;  // x+128|
  f1 = 7'b0000110 ; #10 ; // x+128|

  $finish;
end
endmodule