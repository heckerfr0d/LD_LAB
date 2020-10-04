module stimulus;

wire [15:0] o;
reg [2:0] s;
reg [15:0] a [7:0];
integer l;

mux8 mux_1(o, s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);

initial
begin
  for(l=0;l<8;l++)
      a[l]=l;
  $monitor("%b %b %b %b %b %b %b %b %b  %b", s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], o);
  $dumpfile("mux8.vcd");
  $dumpvars(0, mux_1);
  for(l=0;l<8;l++)
  begin
    s=l; #10;
  end
end
endmodule