`include "Hadif_B190513CS_Q01f.v"
module dff_fe_sr_tb;

wire q, q1;
reg clk, d, res;

dff_fe_sr dff1(q, q1, d, clk, res);

initial
begin
  clk=0;
  d=0;
  res=1;
  $dumpfile("dff.vcd");
  $dumpvars(0, dff1);
  $display("clk res d q q'");
  $monitor(" %b  %b  %b %b %b", clk, res, d, q, q1);
end

always #5 d = ~d;
always #3 clk = ~clk;
always #13 res = ~res;

endmodule