`include "Hadif_B190513CS_Q01a.v"

module and1(output c, input a, input b);
  wire c1;
  nand(c1, a, b);
  nand(c, c1);
endmodule

module dff_re_sr(output q, q1, input d, clk, res);
  wire d1;
  and1 and1_1(d1, d, res);
  dff_re dff1(q, q1, d1, clk);
endmodule