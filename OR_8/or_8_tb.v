module stimulus;

wire c;
reg [7:0] a1;

integer i;
or_8 or_8_1(c, a1);

always
begin
    $monitor("%b %b %b %b %b %b %b %b   %b", a1[0], a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], c);
    $dumpfile("or_8.vcd");
    $dumpvars(0, or_8_1);
    for(i=0;i<=255;i=i+1)
    begin
      a1=i;  #10;
    end
end
endmodule