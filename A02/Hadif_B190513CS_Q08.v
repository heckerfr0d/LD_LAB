`include "Hadif_B190513CS_Q05.v"
`include "Hadif_B190513CS_Q07.v"

module mux_16(output [15:0] o, input s, input [15:0] i0, i1);
  wire s1;
  wire [15:0] a1, a2;
  nand(s1, s);
  and1 and_1 [15:0] (a1, s1, i0);
  and1 and_2 [15:0] (a2, s, i1);
  or1 or_1 [15:0] (o, a1, a2);
endmodule

module alu(output [15:0] o, output zr, ng, input [15:0] x, y, input zx, nx, zy, ny, f, no);
  wire [15:0] px1, px2, py1, py2, x1, y1, xpy, xy, fxy, o1, zr0;
  wire zr1, zx1, zy1, c;
  nand(zx1, zx);
  nand(zy1, zy);
  and1 azx [15:0] (px1, x, zx1);
  xor1 xnx [15:0] (px2, px1, nx);
  and1 azy [15:0] (py1, y, zy1);
  xor1 xny [15:0] (py2, py1, ny);
  add_16 a1(xpy, px2, py2);
  and1 axy [15:0] (xy, px2, py2);
  mux_16 mf(fxy, f, xy, xpy);
  xor1 xno [15:0] (o, fxy, no);
  neg_16 n3(zr0, o);
  nand(zr1, zr0[0], zr0[1], zr0[2], zr0[3], zr0[4], zr0[5], zr0[6], zr0[7], zr0[8], zr0[9], zr0[10], zr0[11], zr0[12], zr0[13], zr0[14], zr0[15]);
  nand(zr, zr1);
  nand(ng, zr0[15]);
endmodule