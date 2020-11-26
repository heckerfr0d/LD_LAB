`include "Hadif_B190513CS_Q01g.v"

module dff_fe_arl(output q, q1, input d, clk, res);
  wire p, p1, clk1;
  nand(clk1, clk);
  dff_ares dff1(p, p1, d, clk, res);
  dff_ares dff2(q, q1, p, clk1, res);
endmodule