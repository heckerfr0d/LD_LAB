module stimulus;

wire [15:0] o;
reg [1:0] s;
reg [15:0] a [3:0];
integer i;

mux4 mux_1(o, s, a[0], a[1], a[2], a[3]);

initial
begin
  for(i=0;i<4;i++)
      a[i]=i;
  $monitor("%b %b %b %b %b  %b", s, a[0], a[1], a[2], a[3], o);
  $dumpfile("mux_4.vcd");
  $dumpvars(0, mux_1);
  for(i=0;i<4;i++)
  begin
    s=i;  #10;
  end
end
endmodule