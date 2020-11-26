`include "Hadif_B190513CS_Q01e.v"
module dff_tb;

wire q, q1;
reg clk;
reg d;

dff_fe dff1(q, q1, d, clk);

initial
begin
  clk=0;
  d=0;
  $dumpfile("dff.vcd");
  $dumpvars(0, dff1);
  $display("clk d q q'");
  $monitor(" %b %b %b %b", clk, d, q, q1);
end

always #5 d = ~d;
always #3 clk = ~clk;

endmodule