module dff_base(output q, q1, input d, clk);
  wire a, b;
  nand(a, d, clk);
  nand(b, a, clk);
  nand(q, a, q1);
  nand(q1, b, q);
endmodule

module dff_re(output q, q1, input d, clk);
  wire a, b, clk1, clk2, clk3, clk4, clk5;
  nand(clk1, clk);
  nand(clk2, clk1);
  nand(clk3, clk2);
  nand(clk4, clk, clk3);
  nand(clk5, clk4);
  dff_base dff1(q, q1, d, clk5);
endmodule