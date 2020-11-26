module mux(output o, input s, i0, i1);

wire s1, a1, a2;

nand(s1, s);
and1 and_1(a1, s1, i0);
and1 and_2(a2, s, i1);
or1 or_1(o, a1, a2);

endmodule