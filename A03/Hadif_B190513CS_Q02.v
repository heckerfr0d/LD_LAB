`include "Hadif_B190513CS_Q01a.v"

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