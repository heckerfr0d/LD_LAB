module mux_16(output [15:0] o, input s, input [15:0] i0, i1);

wire s1;
wire [15:0] a1, a2;

nand(s1, s);
and1 and_1 [15:0] (a1, s1, i0);
and1 and_2 [15:0] (a2, s, i1);
or1 or_1 [15:0] (o, a1, a2);

endmodule