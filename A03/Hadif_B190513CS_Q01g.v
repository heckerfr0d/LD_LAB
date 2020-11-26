`include "Hadif_B190513CS_Q01c.v"

module dff_fe_arh(output q, q1, input d, clk, res);
  wire p, p1, clk1, res1;
  nand(clk1, clk);
  nand(res1, res);
  dff_ares dff1(p, p1, d, clk, res1);
  dff_ares dff2(q, q1, p, clk1, res1);
endmodule