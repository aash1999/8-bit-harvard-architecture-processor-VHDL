module Rshifter(ip,s,out);
input [7:0] ip;
input [2:0] s;
output [7:0] out;

//LAYER 1
wire [7:0]out01;
mux_2to1 layer11(ip[0],1'b0,s[0],out01[0]);
mux_2to1 layer12(ip[1],ip[0],s[0],out01[1]);
mux_2to1 layer13(ip[2],ip[1],s[0],out01[2]);
mux_2to1 layer14(ip[3],ip[2],s[0],out01[3]);
mux_2to1 layer15(ip[4],ip[3],s[0],out01[4]);
mux_2to1 layer16(ip[5],ip[4],s[0],out01[5]);
mux_2to1 layer17(ip[6],ip[5],s[0],out01[6]);
mux_2to1 layer18(ip[7],ip[6],s[0],out01[7]);

//LAYER 2

wire [7:0]out02;
mux_2to1 layer21(out01[0],1'b0,s[1],out02[0]);
mux_2to1 layer22(out01[1],1'b0,s[1],out02[1]);
mux_2to1 layer23(out01[2],out01[0],s[1],out02[2]);
mux_2to1 layer24(out01[3],out01[1],s[1],out02[3]);
mux_2to1 layer25(out01[4],out01[2],s[1],out02[4]);
mux_2to1 layer26(out01[5],out01[3],s[1],out02[5]);
mux_2to1 layer27(out01[6],out01[4],s[1],out02[6]);
mux_2to1 layer28(out01[7],out01[5],s[1],out02[7]);


//LAYER 3

wire [7:0]out03;
mux_2to1 layer31(out02[0],1'b0,s[2],out[7]);
mux_2to1 layer32(out02[1],1'b0,s[2],out[6]);
mux_2to1 layer33(out02[2],1'b0,s[2],out[5]);
mux_2to1 layer34(out02[3],1'b0,s[2],out[4]);
mux_2to1 layer35(out02[4],out02[0],s[2],out[3]);
mux_2to1 layer36(out02[5],out02[1],s[2],out[2]);
mux_2to1 layer37(out02[6],out02[2],s[2],out[1]);
mux_2to1 layer38(out02[7],out02[3],s[2],out[0]);

endmodule