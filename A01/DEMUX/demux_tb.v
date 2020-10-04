module stimulus;

wire o0, o1;
reg [1:0] count;

demux demux_1(o0, o1, count[1], count[0]);

initial
begin
  count = -1;
end

always
begin
    $monitor("%b %b  %b %b", count[1], count[0], o0, o1);
    $dumpfile("demux.vcd");
    $dumpvars(0, demux_1);
    count = count+1; #10;
end
endmodule