module demux(output o0, o1, input s, i);

wire s1;

nand(s1, s);
and1 and_1(o0, s1, i);
and1 and_2(o1, s, i);

endmodule