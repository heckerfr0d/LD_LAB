module and2(output c, input a, input b);

wire c1;

nand(c1, a, b);
nand(c, c1);

endmodule