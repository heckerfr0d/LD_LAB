module or_8(output c, input [7:0] a);

wire [7:0] a1;

nand nand_1 [7:0] (a1, a);
nand(c, a1[0], a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);

endmodule