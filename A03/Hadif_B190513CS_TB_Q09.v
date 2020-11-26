`include "Hadif_B190513CS_Q09.v"

module counter_tb;

wire signed [15:0] o;
reg signed [15:0] in;
reg load, clk, res, inc;

counter c1(o, in, res, load, inc, clk);

initial
begin
  clk=0;
  in=0;
  load=1;
  inc=0;
  res=0;
  $dumpfile("dff.vcd");
  $dumpvars(0, c1);
  $display("clk  load  inc  res    in    out");
  $monitor("  %b     %b    %b    %b %d  %d", clk, load, inc, res, in, o);
  #4 load=0;
  #4 inc=1;
  #4 in=-32123;
  #4 load=1;
  #4 load=0;
  #6 in=12345; load=1; inc=0;
  #4 res=1;
  #4 res=0; inc=1;
  #4 res=1;
  #4 res=0; load=0;
  #4 res=1;
  #4 in=0; res=0; load=1;
  #4 load=0; inc=1;
  #4 in=22222; res=1; inc=0;
  #4 $finish;
end

always #2 clk = ~clk;

endmodule