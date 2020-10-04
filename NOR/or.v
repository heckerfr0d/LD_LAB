module or1(output c, input a, input b);

wire a1, b1;

nand(a1, a);
nand(b1, b);
nand(c, a1, b1);

endmodule