`include "Hadif_B190513CS_Q01.v"

module incr_4(output [3:0] o, output c, input [3:0] a, input i);
  wire [2:0] c1;
  halfadder inc0 (o[0], c1[0], a[0], i);
  halfadder inc1 (o[1], c1[1], a[1], c1[0]);
  halfadder inc2 (o[2], c1[2], a[2], c1[1]);
  halfadder inc3 (o[3], c, a[3], c1[2]);
endmodule