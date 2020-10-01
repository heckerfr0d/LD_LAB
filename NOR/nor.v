module nor1(output c, input a, input b);

wire a1, b1, c1;

nand(a1, a);
nand(b1, b);
nand(c1, a1, b1);
nand(c, c1);

endmodule