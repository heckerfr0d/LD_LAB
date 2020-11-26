`include "Hadif_B190513CS_Q01a.v"

module dff_fe(output q, q1, input d, clk);
  wire p, p1, clk1;
  nand(clk1, clk);
  dff_base dff1(p, p1, d, clk);
  dff_base dff2(q, q1, p, clk1);
endmodule