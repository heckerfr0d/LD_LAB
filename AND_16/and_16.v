`include "and.v"

module and_16(c, a, b);

output [15:0] c;
input [15:0] a, b;

and2 and_16_1 [15:0] (c, a, b);

endmodule