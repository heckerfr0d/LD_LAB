module stimulus;

wire [15:0] c;
reg s;
reg [15:0] a, b;
integer i, j;

mux_16 mux_1(c, s, a, b);

initial
begin
  $monitor("%b %b %b  %b ", s, a, b, c);
  $dumpfile("mux_16.vcd");
  $dumpvars(0, mux_1);
  for(i=0;i<=65535;i=i+1)
    for(j=0;j<=65535;j=j+1)
    begin
      a=i; b=j; s=j; #10;
    end
end
endmodule