`include "Hadif_B190513CS_Q02.v"

module bcell_tb;

wire o;
reg in, load, clk;

bcell b1(o, in, load, clk);

initial
begin
  clk=0;
  in=0;
  load=0;
  $dumpfile("dff.vcd");
  $dumpvars(0, b1);
  $display("clk ld in out");
  $monitor("  %b  %b  %b  %b", clk, load, in, o);
end

always #5 in = ~in;
always #3 clk = ~clk;
always #13 load = ~load;

endmodule