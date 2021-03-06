`include "Hadif_B190513CS_Q01.v"

module div(output [15:0] R2, input [15:0] x, y, input clk, input load);
  wire [15:0] R0, R1, xpy, xmy;
  reg [15:0] q, r;
  reg [16:0] diff;
  reg [4:0] n;
  reg lsb;
  wire ready=!n;
  initial
  begin
    n=0;
    q=16'bx;
  end
  register r0(R0, x, load, clk);
  register r1(R1, y, load, clk);
  always @(posedge clk)
    if(ready&&load)
    begin
      n=16;
      {r, q} = {16'b0, R0};
      while(n)
      begin
        diff = {r, q[15]} - {1'b0, R1};
        if(diff[16])
          {r, q} = {r[14:0], q, 1'b0};
        else
          {r, q} = {diff[15:0], q[14:0], 1'b1};
        n = n-1;
      end
    end
  register r2(R2, q, 1'b1, clk);
endmodule