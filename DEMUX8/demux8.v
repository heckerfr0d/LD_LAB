module demux8(output [7:0] o, input [2:0] s, input i);

wire s2;

nand(s2, s[2]);
demux4 d8_1(o[3:0], s[1:0], i, s2);
demux4 d8_2(o[7:4], s[1:0], i, s[2]);

endmodule