module stimulus;

wire [3:0] o;
reg [2:0] count;

demux4 demux_1(o, count[1:0], count[2], 1'b1);

initial
begin
  count = -1;
end

always
begin
    $monitor("%b %b %b  %b", count[2], count[1], count[0], o);
    $dumpfile("demux4.vcd");
    $dumpvars(0, demux_1);
    count = count+1; #10;
end
endmodule