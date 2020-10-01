`include "xor.v"

module xor_16(c, a, b);

output [15:0] c;
input [15:0] a, b;

xor1 xor_16_1 [15:0] (c, a, b);

endmodule