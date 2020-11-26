`include "Hadif_B190513CS_Q06.v"

module ram4k(output [15:0] o, input [15:0] in, input [11:0] add, input load, clk);
  wire [7:0] r;
  wire [15:0] o0, o1, o2, o3, o4, o5, o6, o7;
  demux8 d1(r, add[11:9], load);
  ram512 r0(o0, in, add[8:0], r[0], clk);
  ram512 r1(o1, in, add[8:0], r[1], clk);
  ram512 r2(o2, in, add[8:0], r[2], clk);
  ram512 r3(o3, in, add[8:0], r[3], clk);
  ram512 r4(o4, in, add[8:0], r[4], clk);
  ram512 r5(o5, in, add[8:0], r[5], clk);
  ram512 r6(o6, in, add[8:0], r[6], clk);
  ram512 r7(o7, in, add[8:0], r[7], clk);
  mux8 m1(o, add[11:9], o0, o1, o2, o3, o4, o5, o6, o7);
endmodule