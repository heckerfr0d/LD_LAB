module demux4(output [3:0] o, input [1:0] s, input i, e);

wire o0, o1;
wire [3:0] o2;

demux d4_1(o0, o1, s[1], i);
demux d4_2(o2[0], o2[1], s[0], o0);
demux d4_3(o2[2], o2[3], s[0], o1);
and1 and_1 [3:0] (o, o2, e);

endmodule