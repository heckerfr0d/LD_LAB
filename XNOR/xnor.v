module xnor1(output c, input a, input b);

wire a1, b1, c1, c2;

nand(a1, a);
nand(b1, b);
nand(c1, a1, b1);
nand(c2, a, b);
nand(c, c1, c2);

endmodule