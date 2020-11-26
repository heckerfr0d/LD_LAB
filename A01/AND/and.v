module and1(output c, input a, b);

wire c1;

nand(c1, a, b);
nand(c, c1);

endmodule