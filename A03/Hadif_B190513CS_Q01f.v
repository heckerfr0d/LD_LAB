`include "Hadif_B190513CS_Q01b.v"
`include "Hadif_B190513CS_Q01e.v"

module dff_fe_sr(output q, q1, input d, clk, res);

wire d1;

and1 and_1(d1, d, res);
dff_fe dff1(q, q1, d1, clk);

endmodule