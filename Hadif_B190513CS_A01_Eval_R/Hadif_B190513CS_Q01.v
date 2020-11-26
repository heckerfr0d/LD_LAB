module and1(output c, input a, input b);
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

module and_16(output [15:0] c, input [15:0] a, b);
  and1 and_16_1 [15:0] (c, a, b);
endmodule

module or_16(output [15:0] c, input [15:0] a, b);
  or1 or_16_1 [15:0] (c, a, b);
endmodule

module nor1(output c, input a, input b);
  wire c1;
  or1 or_1(c1, a, b);
  nand(c, c1);
endmodule

module xnor1(output c, input a, input b);
  wire a1, b1, c1, c2;
  nor1 nor_1(c1, a, b);
  and1 and_1(c2, a, b);
  or1 or_1(c, c1, c2);
endmodule

module xor1(output c, input a, input b);
  wire a1, b1, c1, c2;
  nand(a1, a);
  nand(b1, b);
  nand(c1, a, b1);
  nand(c2, a1, b);
  nand(c, c1, c2);
endmodule

module xor_16(output [15:0] c, input [15:0] a, b);
  xor1 xor_16_1 [15:0] (c, a, b);
endmodule

module mux_16(output [15:0] o, input s, input [15:0] i0, i1);
  wire s1;
  wire [15:0] a1, a2;
  nand(s1, s);
  and1 and_1 [15:0] (a1, s1, i0);
  and1 and_2 [15:0] (a2, s, i1);
  or1 or_1 [15:0] (o, a1, a2);
endmodule

module mux4(output [15:0] o, input [1:0] s, input [15:0] i0, i1, i2, i3);
  wire [15:0] o1, o2;
  mux_16 mux4_1(o1, s[0], i0, i1);
  mux_16 mux4_2(o2, s[0], i2, i3);
  mux_16 mux4_3(o, s[1], o1, o2);
endmodule

module circuitI(output [15:0] OUTPUT, input [15:0] INPUT_A, INPUT_B, input [1:0] S);

wire [15:0] a, xo, na, nb, no, n3, oab, no2, xno, i0, i1, i3, o1;
wire s1;

nand n1_16 [15:0] (na, INPUT_A);
nand n2_16 [15:0] (nb, INPUT_B);

xor_16 x1(xo, INPUT_A, INPUT_B);
and_16 a1(a, na, nb);

or_16 orr1(oab, INPUT_A, INPUT_B);
nor1 nor1_16 [15:0] (no, na, nb);

nor1 nor2_16 [15:0] (no2, xo, a);
nand n3_16 [15:0] (n3, no);
xnor1 xnor_16 [15:0] (xno, oab, n3);

nand n4_16 [15:0] (i0, xo);
nand n5_16 [15:0] (i1, no2);
nand n6_16 [15:0] (i3, xno);

mux4 m1(o1, S, i0, i1, oab, i3);
nand n7_16 [15:0] (OUTPUT, o1);

endmodule