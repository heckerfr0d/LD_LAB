module mux4(output [15:0] o, input [1:0] s, input [15:0] i0, i1, i2, i3);

wire [15:0] o1, o2;

mux_16 mux4_1(o1, s[0], i0, i1);
mux_16 mux4_2(o2, s[0], i2, i3);
mux_16 mux4_3(o, s[1], o1, o2);

endmodule