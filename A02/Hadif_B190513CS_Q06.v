`include "Hadif_B190513CS_Q03.v"

module incr_16(output [15:0] o, input [15:0] a);
  wire [3:0] c1;
  incr_4 i1(o[3:0], c1[0], a[3:0], 1'b1);
  incr_4 i2(o[7:4], c1[1], a[7:4], c1[0]);
  incr_4 i3(o[11:8], c1[2], a[11:8], c1[1]);
  incr_4 i4(o[15:12], c1[3], a[15:12], c1[2]);
endmodule