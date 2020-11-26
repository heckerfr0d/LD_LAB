`include "Hadif_B190513CS_Q01.v"

module stimulus_eval;

wire [15:0] oA;
reg [15:0] iA, iB;
reg [1:0] S;

circuitI c1(oA, iA, iB, S);

initial
begin
  iA = 5;
  iB = 7;
  $dumpvars(0, c1);
  $dumpfile("eval.vcd");
  for(S=0; S<3; S=S+1)
  begin
    $monitor("%b %b %b   %b", iA, iB, S, oA); #10;
  end
end

endmodule