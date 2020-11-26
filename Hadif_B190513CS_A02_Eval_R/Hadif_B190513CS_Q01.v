module and1(output c, input a, b);
  wire c1;
  nand(c1, a, b);
  nand(c, c1);
endmodule

module or1(output c, input a, input b);
  wire a1, b1;
  nand(a1, a);
  nand(b1, b);
  nand(c, a1, b1);
endmodule

module xor1(output c, input a, input b);
  wire c1, c2;
  nand(c1, a, b);
  or1 or_1(c2, a, b);
  and1 and_1(c, c1, c2);
endmodule

module halfadder(output s, c, input a, b);
  xor1 sum(s, a, b);
  and1 carry(c, a, b);
endmodule

module fulladder(output s, c, input a, b, cin);
  wire e, c1, c2;
  halfadder ha1(e, c1, a, b);
  halfadder ha2(s, c2, e, cin);
  or1 cout(c, c1, c2);
endmodule

module add_4(output [3:0] s, output c1, input [3:0] a, b, input cin);
  wire [2:0] c;
  fulladder f0(s[0], c[0], a[0], b[0], cin);
  fulladder f1(s[1], c[1], a[1], b[1], c[0]);
  fulladder f2(s[2], c[2], a[2], b[2], c[1]);
  fulladder f3(s[3], c1, a[3], b[3], c[2]);
endmodule

module add_16(output [15:0] s, input [15:0] a, b);
  wire [3:0] c;
  add_4 a1(s[3:0], c[0], a[3:0], b[3:0], 1'b0);
  add_4 a2(s[7:4], c[1], a[7:4], b[7:4], c[0]);
  add_4 a3(s[11:8], c[2], a[11:8], b[11:8], c[1]);
  add_4 a4(s[15:12], c[3], a[15:12], b[15:12], c[2]);
endmodule

module neg_16(output [15:0] o, input [15:0] a);
  nand n1 [15:0] (o, a);
endmodule

module mux_16(output [15:0] o, input s, input [15:0] i0, i1);
  wire s1;
  wire [15:0] a1, a2;
  nand(s1, s);
  and1 and_1 [15:0] (a1, s1, i0);
  and1 and_2 [15:0] (a2, s, i1);
  or1 or_1 [15:0] (o, a1, a2);
endmodule

module circuitII(out,zr,ng,x,y,zx,nx,zy,ny,f,f1,no);

output [15:0] out;
output zr,ng;
input [15:0] x,y;
input zx,nx,zy,ny,f,f1,no;

  wire [15:0] px1, px2, py1, py2, py3, x1, y1, xpy, xy, fxy, o1, zr0;
  wire zr1, zx1, zy1, c;
  nand(zx1, zx);
  nand(zy1, zy);
  and1 azx [15:0] (px1, x, zx1);
  xor1 xnx [15:0] (px2, px1, nx);
  and1 azy [15:0] (py1, y, zy1);
  xor1 xny [15:0] (py2, py1, ny);
  mux_16 m128(py3, f1, y, 16'b0000000010000000);
  add_16 a1(xpy, px2, py3);
  and1 axy [15:0] (xy, px2, py3);
  mux_16 mf(fxy, f, xy, xpy);
  xor1 xno [15:0] (out, fxy, no);
  neg_16 n3(zr0, out);
  nand(zr1, zr0[0], zr0[1], zr0[2], zr0[3], zr0[4], zr0[5], zr0[6], zr0[7], zr0[8], zr0[9], zr0[10], zr0[11], zr0[12], zr0[13], zr0[14], zr0[15]);
  nand(zr, zr1);
  nand(ng, zr0[15]);

endmodule