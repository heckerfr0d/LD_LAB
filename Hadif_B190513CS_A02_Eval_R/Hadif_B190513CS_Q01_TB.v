`include "Hadif_B190513CS_Q01.v"

module AII_eval_tb;

wire signed [15:0] o;
wire zr, ng;
reg signed [15:0] x, y;
reg [6:0] f;

circuitII a(o, zr, ng, x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0]);

initial
begin
  x = 1023;
  y = 2047;
  $dumpfile("alu.vcd");
  $dumpvars(0, a);
  $display("x =%d, y =%d", x, y);
  // $display("         x               y         zx  nx  zy  ny  f  no         out        zr  ng");
  $display("|    x  |    y   |zx  |nx  |zy  |ny |f   |f1  |no  |    out       |zr  |ng |");
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d  ( 1 ) |%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 7'b1111101 ; #10 ; //  1|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d  (!y ) |%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 7'b1100001 ; #10 ; //  !y|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d  (x-1) |%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 7'b0011100 ; #10 ; // x-1|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d  (y-1) |%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 7'b1100100 ; #10 ; // y-1|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d  (x+y) |%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
  f = 7'b0000100 ; #10 ; // x+y|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d (x+128)|%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
  f = 7'b0000110 ; #10 ; // x+128|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d  (x-y) |%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 7'b0100101 ; #10 ; // x-y|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d  (x&y) |%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 7'b0000000 ; #10 ; // x&y|
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b   |%b   |%d  (x|y) |%b   |%b  |", x, y, f[6], f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 7'b0101001 ; #10 ; // x|y|
  $finish;
end
endmodule