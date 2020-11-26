`include "Hadif_B190513CS_Q04.v"

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

module incr_4(output [3:0] o, output c, input [3:0] a, input i);
  wire [2:0] c1;
  halfadder inc0 (o[0], c1[0], a[0], i);
  halfadder inc1 (o[1], c1[1], a[1], c1[0]);
  halfadder inc2 (o[2], c1[2], a[2], c1[1]);
  halfadder inc3 (o[3], c, a[3], c1[2]);
endmodule

module incr_16(output [15:0] o, input [15:0] a);
  wire [3:0] c1;
  incr_4 i1(o[3:0], c1[0], a[3:0], 1'b1);
  incr_4 i2(o[7:4], c1[1], a[7:4], c1[0]);
  incr_4 i3(o[11:8], c1[2], a[11:8], c1[1]);
  incr_4 i4(o[15:12], c1[3], a[15:12], c1[2]);
endmodule

module counter(output [15:0] o, input [15:0] in, input res, load, inc, clk);
  wire [15:0] in1, x1, x2, x3, x4;
  wire res1, load1, inc1, rload;
  incr_16 i1(in1, o);
  mux_16 m1(x1, inc, o, in1);
  mux_16 m2(x2, load, x1, in);
  mux_16 m3(x3, res, x2, 16'b0);
  nand(res1, res);
  nand(inc1, inc);
  nand(load1, load);
  nand(rload, res1, inc1, load1);
  register r1(o, x3, rload, clk);
endmodule