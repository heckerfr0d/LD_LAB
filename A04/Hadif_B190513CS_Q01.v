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
  nand n1 [15:0] (a1, s1, i0);
  nand n2 [15:0] (a2, s, i1);
  nand n3 [15:0] (o, a1, a2);
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

module demux(output o0, o1, input s, i);
  wire s1;
  nand(s1, s);
  and1 and_1(o0, s1, i);
  and1 and_2(o1, s, i);
endmodule

module dff_base(output q, q1, input d, clk);
  wire a, b;
  nand(a, d, clk);
  nand(b, a, clk);
  nand(q, a, q1);
  nand(q1, b, q);
endmodule

module dff_re(output q, q1, input d, clk);
  wire a, b, clk1, clk2, clk3, clk4, clk5;
  nand(clk1, clk);
  nand(clk2, clk1);
  nand(clk3, clk2);
  nand(clk4, clk, clk3);
  nand(clk5, clk4);
  dff_base dff1(q, q1, d, clk5);
endmodule

module mux(output o, input s, i0, i1);
  wire s1, a1, a2;
  nand(s1, s);
  nand(a1, s1, i0);
  nand(a2, s, i1);
  nand(o, a1, a2);
endmodule

module bcell(output o, input in, load, clk);
  wire d, q1;
  mux m1(d, load, o, in);
  dff_re dff1(o, q1, d, clk);
endmodule

module register(output [15:0] o, input [15:0] in, input load, clk);
  bcell b1 [15:0] (o, in, load, clk);
endmodule

module mult(output [31:0] R2, input [15:0] x, y, input clk, input load);
  wire [15:0] R0, R1;
  reg [31:0] prod;
  reg [4:0] n;
  reg lsb;
  wire ready=!n;
  initial n=0;
  register r0(R0, x, load, clk);
  register r1(R1, y, load, clk);
  always @(posedge clk)
    if(ready&&load)
    begin
      n=16;
      prod={16'b0, R1[15] ? -R1 : R1};
      while(n)
      begin
        lsb = prod[0];
        prod = prod >> 1;
        n = n-1;
        if(lsb)
          prod[31:15] = prod[30:15] + (R0[15] ? -R0 : R0);
      end
      if(!n)
        prod = R0[15]^R1[15] ? -prod : prod;
    end
  register r2(R2[31:16], prod[31:16], 1'b1, clk);
  register r2_(R2[15:0], prod[15:0], 1'b1, clk);
endmodule