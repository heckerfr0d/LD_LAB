`include "Hadif_B190513CS_Q01.v"

module circuitII_dash(out_dash,zr_dash,ng_dash,x,y,zx,nx,zy,ny,f,f1,no,y_dash,zx_dash,nx_dash,zy_dash,ny_dash,f_dash,f1_dash,no_dash);

  output [15:0] out_dash;
  output zr_dash,ng_dash;
  input [15:0] x,y;
  input zx,nx,zy,ny,f,f1,no;
  input [15:0] y_dash;
  input zx_dash,nx_dash,zy_dash,ny_dash,f_dash,f1_dash,no_dash;
  wire [15:0] o;
  wire zr, ng;
  circuitII c1(o,zr,ng,x,y,zx,nx,zy,ny,f,f1,no);
  circuitII c2(out_dash,zr_dash,ng_dash,o,y_dash,zx_dash,nx_dash,zy_dash,ny_dash,f_dash,f1_dash,no_dash);
endmodule