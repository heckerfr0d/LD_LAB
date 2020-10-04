module nor1(output c, input a, input b);

wire c1;

or1 or_1(c1, a, b);
nand(c, c1);

endmodule