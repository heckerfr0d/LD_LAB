`include "Hadif_B190513CS_Q01.v"

module fulladder(output s, c, input a, b, cin);
  wire e, c1, c2;
  halfadder ha1(e, c1, a, b);
  halfadder ha2(s, c2, e, cin);
  or1 cout(c, c1, c2);
endmodule
