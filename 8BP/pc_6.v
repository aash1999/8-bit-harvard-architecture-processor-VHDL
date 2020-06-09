`include "jk_ff.v"
module pc_6(clk,reset,out);
input clk,reset;
output [5:0] out;
jk_ff mod1(clk,reset,1'b1,1'b1,out[0]);
jk_ff mod2(clk,reset,out[0],out[0],out[1]);
wire o1;
assign o1 = out[0]&out[1];
jk_ff mod3(clk,reset,o1,o1,out[2]);
wire o2;
assign o2 = o1&out[2];
jk_ff mod4(clk,reset,o2,o2,out[3]);
wire o3;
assign o3 = o2&out[3];
jk_ff mod5(clk,reset,o3,o3,out[4]);
wire o4;
assign o4 = o3&out[4];
jk_ff mod6(clk,reset,o4,o4,out[5]);
endmodule 