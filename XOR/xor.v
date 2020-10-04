module xor1(output c, input a, input b);

wire c1, c2;

nand(c1, a, b);
or1 or_1(c2, a, b);
and1 and_1(c, c1, c2);

endmodule