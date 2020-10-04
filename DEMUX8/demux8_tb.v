module stimulus;

wire [7:0] o;
reg [3:0] count;

demux8 demux_1(o, count[2:0], count[3]);

initial
begin
  count = -1;
end

always
begin
    $monitor("%b %b  %b", count[3], count[2:0], o);
    $dumpfile("demux4.vcd");
    $dumpvars(0, demux_1);
    count = count+1; #10;
end
endmodule