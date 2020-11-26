`include "Hadif_B190513CS_Q02.v"

module add_4(output [3:0] s, output c1, input [3:0] a, b, input cin);
  wire [2:0] c;
  fulladder f0(s[0], c[0], a[0], b[0], cin);
  fulladder f1(s[1], c[1], a[1], b[1], c[0]);
  fulladder f2(s[2], c[2], a[2], b[2], c[1]);
  fulladder f3(s[3], c1, a[3], b[3], c[2]);
endmodule
