`include "and.v"

module stimulus;

wire c;
reg [1:0] count;

and2 and_1(c, count[1], count[0]);

initial
begin
  count = -1;
end

always
begin
    $monitor("%b %b %b", count[1], count[0], c);
    $dumpfile("and.vcd");
    $dumpvars(0, and_1);
    count = count+1; #10;

    // a = 1'b0; b = 1'b0; #10;
    // a = 1'b0; b = 1'b1; #10;
    // a = 1'b1; b = 1'b0; #10;
    // a = 1'b1; b = 1'b1; #10;
end
endmodule