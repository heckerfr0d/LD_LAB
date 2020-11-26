module dff_ares(output q, q1, input d, clk, res);
  wire a, b;
  nand(a, d, clk);
  nand(b, a, clk);
  nand(q, a, q1);
  nand(q1, b, q, res);
endmodule

module dff_re_arh(output q, q1, input d, clk, res);
  wire a, b, clk1, clk2, clk3, clk4, clk5, res1;
  nand(clk1, clk);
  nand(clk2, clk1);
  nand(clk3, clk2);
  nand(clk4, clk, clk3);
  nand(clk5, clk4);
  nand(res1, res);
  dff_ares dff1(q, q1, d, clk5, res1);
endmodule