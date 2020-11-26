`include "Hadif_B190513CS_Q03.v"

module reg_tb;

wire [15:0] o;
reg [15:0] in;
reg load, clk;

register r1(o, in, load, clk);

initial
begin
  clk=0;
  in=0;
  load=0;
  $dumpfile("dff.vcd");
  $dumpvars(0, r1);
  $display("clk  load     in    out");
  $monitor("  %b     %b  %d  %d", clk, load, in, o);
end

always #5 in = in+1;
always #3 clk = ~clk;
always #13 load = ~load;

endmodule