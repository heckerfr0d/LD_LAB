`include "Hadif_B190513CS_Q04.v"

module add_16(output [15:0] s, input [15:0] a, b);
  wire [3:0] c;
  add_4 a1(s[3:0], c[0], a[3:0], b[3:0], 1'b0);
  add_4 a2(s[7:4], c[1], a[7:4], b[7:4], c[0]);
  add_4 a3(s[11:8], c[2], a[11:8], b[11:8], c[1]);
  add_4 a4(s[15:12], c[3], a[15:12], b[15:12], c[2]);
endmodule