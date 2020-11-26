`include "Hadif_B190513CS_Q02.v"

module register(output [15:0] o, input [15:0] in, input load, clk);
  bcell b1 [15:0] (o, in, load, clk);
endmodule