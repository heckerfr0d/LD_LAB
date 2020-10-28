`include "Hadif_B190513CS_Q08.v"

module alu_tb;

wire signed [15:0] o;
wire zr, ng;
reg signed [15:0] x, y;
reg [5:0] f;

alu a(o, zr, ng, x, y, f[5], f[4], f[3], f[2], f[1], f[0]);

initial
begin
  x = 1023;
  y = 2047;
  $dumpfile("alu.vcd");
  $dumpvars(0, a);
  $display("x =%d, y =%d", x, y);
  // $display("         x               y         zx  nx  zy  ny  f  no         out        zr  ng");
  $display("|    x  |    y   |zx  |nx  |zy  |ny |f   |no |    out       |zr  |ng |");
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (0)   |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b101010 ; #10 ; // 0
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (1)   |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b111111 ; #10 ; // 1
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (-1)  |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b111010 ; #10 ; // -1
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (x)   |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b001100 ; #10 ; // x
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (y)   |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b110000 ; #10 ; // y
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (!x)  |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b001101 ; #10 ; // !x
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (!y)  |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b110001 ; #10 ; // !y
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (-x)  |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b001111 ; #10 ; // -x
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (-y)  |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b110011 ; #10 ; // -y
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (x+1) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b011111 ; #10 ; // x+1
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (y+1) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b110111 ; #10 ; // y+1
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (x-1) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b001110 ; #10 ; // x-1
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (y-1) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b110010 ; #10 ; // y-1
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (x+y) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
  f = 6'b000010 ; #10 ; // x+y
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (x-y) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b010011 ; #10 ; // x-y
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (y-x) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b000111 ; #10 ; // y-x
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (x&y) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b000000 ; #10 ; // x&y
  $monitor("|%d |%d  |%b   |%b   |%b   |%b  |%b   |%b  |%d  (x|y) |%b   |%b  |", x, y, f[5], f[4], f[3], f[2], f[1], f[0], o, zr, ng);
	f = 6'b010101 ; #10 ; // x|y
  $finish;
end
endmodule