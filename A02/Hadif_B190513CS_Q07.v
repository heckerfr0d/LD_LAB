module neg_16(output [15:0] o, input [15:0] a);
  nand n1 [15:0] (o, a);
endmodule
