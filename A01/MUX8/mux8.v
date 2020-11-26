module mux8(output [15:0] o, input [2:0] s, input [15:0] i0, i1, i2, i3, i4, i5, i6, i7);

wire [15:0] o1, o2;

mux4 mux4_1(o1, s[1:0], i0, i1, i2, i3);
mux4 mux4_2(o2, s[1:0], i4, i5, i6, i7);
mux_16 mux_1(o, s[2], o1, o2);

endmodule