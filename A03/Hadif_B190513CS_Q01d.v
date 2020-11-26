`include "Hadif_B190513CS_Q01c.v"

module dff_re_arl(output q, q1, input d, clk, res);

wire res1;
nand(res1, res);
dff_re_arh dff1(q, q1, d, clk, res1);

endmodule