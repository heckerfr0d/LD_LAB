module and1(output c, input a, b);
  wire c1;
  nand(c1, a, b);
  nand(c, c1);
endmodule

module or1(output c, input a, input b);
  wire a1, b1;
  nand(a1, a);
  nand(b1, b);
  nand(c, a1, b1);
endmodule

module xor1(output c, input a, input b);
  wire c1, c2;
  nand(c1, a, b);
  or1 or_1(c2, a, b);
  and1 and_1(c, c1, c2);
endmodule

module halfadder(output s, c, input a, b);
  xor1 sum(s, a, b);
  and1 carry(c, a, b);
endmodule