`include "Hadif_B190513CS_Q03.v"

module and1(output c, input a, input b);
  wire c1;
  nand(c1, a, b);
  nand(c, c1);
endmodule

module demux(output o0, o1, input s, i);
  wire s1;
  nand(s1, s);
  and1 and_1(o0, s1, i);
  and1 and_2(o1, s, i);
endmodule

module demux4(output [3:0] o, input [1:0] s, input i, e);
  wire o0, o1;
  wire [3:0] o2;
  demux d4_1(o0, o1, s[1], i);
  demux d4_2(o2[0], o2[1], s[0], o0);
  demux d4_3(o2[2], o2[3], s[0], o1);
  and1 and_1 [3:0] (o, o2, e);
endmodule

module demux8(output [7:0] o, input [2:0] s, input i);
  wire s2;
  nand(s2, s[2]);
  demux4 d8_1(o[3:0], s[1:0], i, s2);
  demux4 d8_2(o[7:4], s[1:0], i, s[2]);
endmodule

module mux_16(output [15:0] o, input s, input [15:0] i0, i1);
  wire s1;
  wire [15:0] a1, a2;
  nand(s1, s);
  nand n1 [15:0] (a1, s1, i0);
  nand n2 [15:0] (a2, s, i1);
  nand n3 [15:0] (o, a1, a2);
endmodule

module mux4(output [15:0] o, input [1:0] s, input [15:0] i0, i1, i2, i3);
  wire [15:0] o1, o2;
  mux_16 mux4_1(o1, s[0], i0, i1);
  mux_16 mux4_2(o2, s[0], i2, i3);
  mux_16 mux4_3(o, s[1], o1, o2);
endmodule

module mux8(output [15:0] o, input [2:0] s, input [15:0] i0, i1, i2, i3, i4, i5, i6, i7);
  wire [15:0] o1, o2;
  mux4 mux4_1(o1, s[1:0], i0, i1, i2, i3);
  mux4 mux4_2(o2, s[1:0], i4, i5, i6, i7);
  mux_16 mux_1(o, s[2], o1, o2);
endmodule

module ram8(output [15:0] out, input [15:0] in, input [2:0] add, input load, clk);
  wire [7:0] r;
  wire [15:0] o0, o1, o2, o3, o4, o5, o6, o7;
  demux8 d1(r, add, load);
  register r0(o0, in, r[0], clk);
  register r1(o1, in, r[1], clk);
  register r2(o2, in, r[2], clk);
  register r3(o3, in, r[3], clk);
  register r4(o4, in, r[4], clk);
  register r5(o5, in, r[5], clk);
  register r6(o6, in, r[6], clk);
  register r7(o7, in, r[7], clk);
  mux8 m1(out, add, o0, o1, o2, o3, o4, o5, o6, o7);
endmodule