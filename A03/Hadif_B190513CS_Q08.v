`include "Hadif_B190513CS_Q07.v"

module ram16k(output [15:0] o, input [15:0] in, input [13:0] add, input load, clk);
  wire [3:0] r;
  wire [15:0] o0, o1, o2, o3;
  demux4 d1(r, add[13:12], load, 1'b1);
  ram4k r0(o0, in, add[11:0], r[0], clk);
  ram4k r1(o1, in, add[11:0], r[1], clk);
  ram4k r2(o2, in, add[11:0], r[2], clk);
  ram4k r3(o3, in, add[11:0], r[3], clk);
  mux4 m1(o, add[13:12], o0, o1, o2, o3);
endmodule