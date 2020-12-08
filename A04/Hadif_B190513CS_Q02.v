`include "Hadif_B190513CS_Q01.v"

module xpyxmy(output [31:0] R2, input [15:0] x, y, input clk, input load);
  wire [15:0] R0, R1, xpy, xmy;
  wire zr, ng;
  reg [31:0] prod;
  reg [4:0] n;
  reg lsb;
  wire ready=!n;
  initial n=0;
  register r0(R0, x, load, clk);
  register r1(R1, y, load, clk);
  alu ap(xpy, zr, ng, R0, R1, 0, 0, 0, 0, 1, 0);
  alu am(xmy, zr, ng, R0, R1, 0, 1, 0, 0, 1, 1);
  always @(posedge clk)
    if(ready&&load)
    begin
      n=16;
      prod={16'b0, xmy[15] ? -xmy : xmy};
      while(n)
      begin
        lsb = prod[0];
        prod = prod >> 1;
        n = n-1;
        if(lsb)
          prod[31:15] = prod[30:15] + (xpy[15] ? -xpy : xpy);
      end
      if(!n)
        prod = xpy[15]^xmy[15] ? -prod : prod;
    end
  register r2(R2[31:16], prod[31:16], 1'b1, clk);
  register r2_(R2[15:0], prod[15:0], 1'b1, clk);
endmodule