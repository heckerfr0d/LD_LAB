module stimulus;

wire c;
reg [2:0] count;

mux mux_1(c, count[2], count[1], count[0]);

initial
begin
  count = -1;
end

always
begin
    $monitor("%b %b %b  %b", count[2], count[1], count[0], c);
    $dumpfile("mux.vcd");
    $dumpvars(0, mux_1);
    count = count+1; #10;
end
endmodule