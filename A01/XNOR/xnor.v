module xnor1(output c, input a, input b);

wire a1, b1, c1, c2;

nor1 nor_1(c1, a, b);
and1 and_1(c2, a, b);
or1 or_1(c, c1, c2);

endmodule