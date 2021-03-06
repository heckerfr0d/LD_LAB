`include "Hadif_B190513CS_Q07.v"

module ram4k_tb;

wire [15:0] o;
reg [15:0] in;
reg [11:0] add;
reg load, clk;

ram4k r1(o, in, add, load, clk);

initial
begin
  clk=0;
  in=0;
  load=0;
  add=0;
  $dumpfile("dff.vcd");
  $dumpvars(0, r1);
  $display("clk  load     add    in    out");
  $monitor("  %b     %b       %d %d  %d", clk, load, add, in, o);
end

always #5 in = in+123;
always #3 clk = ~clk;
always #7 load = ~load;
always #13 add = add+1;

endmodule