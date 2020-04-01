`include "hadder_1.v"
`include "f_adder.v"
module multiplier(a,b,out);
input [7:0] a,b;
output [15:0] out;
wire [7:0] p0,p1,p2,p3,p4,p5,p6,p7;
wire [7:0] b0,b1,b2,b3,b4,b5,b6,b7;
assign b0 = {b[0],b[0],b[0],b[0],b[0],b[0],b[0],b[0]};
assign b1 = {b[1],b[1],b[1],b[1],b[1],b[1],b[1],b[1]};
assign b2 = {b[2],b[2],b[2],b[2],b[2],b[2],b[2],b[2]};
assign b3 = {b[3],b[3],b[3],b[3],b[3],b[3],b[3],b[3]};
assign b4 = {b[4],b[4],b[4],b[4],b[4],b[4],b[4],b[4]};
assign b5 = {b[5],b[5],b[5],b[5],b[5],b[5],b[5],b[5]};
assign b6 = {b[6],b[6],b[6],b[6],b[6],b[6],b[6],b[6]};
assign b7 = {b[7],b[7],b[7],b[7],b[7],b[7],b[7],b[7]};

assign p0 = a&b0;
assign p1 = a&b1;
assign p2 = a&b2;
assign p3 = a&b3;
assign p4 = a&b4;
assign p5 = a&b5;
assign p6 = a&b6;
assign p7 = a&b7;

wire [9:0] s01;
wire [7:0] c01;

assign s01[0] = p0[0];
hadder_1 mod001(p0[1],p1[0],s01[1],c01[0]);
f_adder mod01(p0[2],p1[1],p2[0],s01[2],c01[1]);
f_adder mod02(p0[3],p1[2],p2[1],s01[3],c01[2]);
f_adder mod03(p0[4],p1[3],p2[2],s01[4],c01[3]);
f_adder mod04(p0[5],p1[4],p2[3],s01[5],c01[4]);
f_adder mod05(p0[6],p1[5],p2[4],s01[6],c01[5]);
f_adder mod06(p0[7],p1[6],p2[5],s01[7],c01[6]);
hadder_1 mod002(p1[7],p2[6],s01[8],c01[7]);
assign s01[9] = p2[7];

wire [9:0] s02;
wire [7:0] c02;

assign s02[0] = p3[0];
hadder_1 mod011(p3[1],p4[0],s02[1],c02[0]);
f_adder mod11(p3[2],p4[1],p5[0],s02[2],c02[1]);
f_adder mod12(p3[3],p4[2],p5[1],s02[3],c02[2]);
f_adder mod13(p3[4],p4[3],p5[2],s02[4],c02[3]);
f_adder mod14(p3[5],p4[4],p5[3],s02[5],c02[4]);
f_adder mod15(p3[6],p4[5],p5[4],s02[6],c02[5]);
f_adder mod16(p3[7],p4[6],p5[5],s02[7],c02[6]);
hadder_1 mod012(p1[7],p2[6],s02[8],c02[7]);
assign s02[9] = p5[7];

wire [10:0] s11;
wire [9:0] c11;

assign s11[0]= s01[0];
assign s11[1]=s01[1];
hadder_1 mod021(s01[2],c01[0],s11[2],c11[0]);
f_adder mod21(s01[3],c01[1],s02[0],s11[3],c11[1]);
f_adder mod22(s01[4],c01[2],s02[1],s11[4],c11[2]);
f_adder mod23(s01[5],c01[3],s02[2],s11[5],c11[3]);
f_adder mod24(s01[6],c01[4],s02[3],s11[6],c11[4]);
f_adder mod25(s01[7],c01[5],s02[4],s11[7],c11[5]);
f_adder mod26(s01[8],c01[6],s02[5],s11[8],c11[6]);
f_adder mod27(s01[9],c01[7],s02[6],s11[9],c11[7]);
assign s11[10] = s02[7];
assign c11[8] = s02[8];
assign c11[9] = s02[9];

wire [9:0]s12;
wire [8:0]c12;

assign s12[0]= c02[0];
hadder_1 mod031(c02[1],p6[0],s12[1],c12[0]);
f_adder mod32(c02[2],p6[1],p7[0],s12[2],c12[1]);
f_adder mod33(c02[3],p6[2],p7[1],s12[3],c12[2]);
f_adder mod34(c02[4],p6[3],p7[2],s12[4],c12[3]);
f_adder mod35(c02[5],p6[4],p7[3],s12[5],c12[4]);
f_adder mod36(c02[6],p6[5],p7[4],s12[6],c12[5]);
f_adder mod37(c02[7],p6[6],p7[5],s12[7],c12[6]);
hadder_1 mod38(p6[7],p7[6],s12[8],c12[7]);
assign s12[9] = p7[7];


wire [13:0] s21;
wire [10:0] c21;

assign s21[0] = s11[0];
assign s21[1] = s11[1];
assign s21[2] = s11[2];
hadder_1 mod41(s11[3],c11[0],s21[3],c21[0]);
hadder_1 mod42(s11[4],c11[1],s21[4],c21[1]);
f_adder mod041(s11[5],c11[2],s12[0],s21[5],c21[2]);
f_adder mod042(s11[6],c11[3],s12[1],s21[6],c21[3]);
f_adder mod43(s11[7],c11[4],s12[2],s21[7],c21[4]);
f_adder mod44(s11[8],c11[5],s12[3],s21[8],c21[5]);
f_adder mod45(s11[9],c11[6],s12[4],s21[9],c21[6]);
f_adder mod46(s11[10],c11[7],s12[5],s21[10],c21[7]);
hadder_1 mod47(c11[8],s12[6],s21[11],c21[8]);
hadder_1 mod48(c11[9],s12[7],s21[12],c21[9]);
assign s21[13] = s12[8];
assign c21[10] = s12[9];

wire [14:0] s31;
wire [10:0] c31;
assign s31[0] = s21[0];
assign s31[1] = s21[1];
assign s31[2] = s21[2];
assign s31[3] = s21[3];
hadder_1 mod51(s21[4],c21[0],s31[4],c31[0]);
hadder_1 mod52(s21[5],c21[1],s31[5],c31[1]);
hadder_1 mod53(s21[6],c21[2],s31[6],c31[2]);
f_adder mod051(s21[7],c21[3],c12[0],s31[7],c31[3]);
f_adder mod052(s21[8],c21[4],c12[1],s31[8],c31[4]);
f_adder mod053(s21[9],c21[5],c12[2],s31[9],c31[5]);
f_adder mod54(s21[10],c21[6],c12[3],s31[10],c31[6]);
f_adder mod55(s21[11],c21[7],c12[4],s31[11],c31[7]);
f_adder mod56(s21[12],c21[8],c12[5],s31[12],c31[8]);
f_adder mod57(s21[13],c21[9],c12[6],s31[13],c31[9]);
hadder_1 mod58(c21[10],c12[7],s31[14],c31[10]);

assign out[0] = s31[0];
assign out[1] = s31[1];
assign out[2] = s31[2];
assign out[3] = s31[3];
assign out[4] = s31[4];
wire [10:0] cout;
f_adder l1(s31[5],c31[0],1'b0,out[5],cout[0]);
f_adder l2(s31[6],c31[1],cout[0],out[6],cout[1]);
f_adder l3(s31[7],c31[2],cout[1],out[7],cout[2]);
f_adder l4(s31[8],c31[3],cout[2],out[8],cout[3]);
f_adder l5(s31[9],c31[4],cout[3],out[9],cout[4]);
f_adder l6(s31[10],c31[5],cout[4],out[10],cout[5]);
f_adder l7(s31[11],c31[6],cout[5],out[11],cout[6]);
f_adder l8(s31[12],c31[7],cout[6],out[12],cout[7]);
f_adder l9(s31[13],c31[8],cout[7],out[13],cout[8]);
f_adder l10(s31[14],c31[9],cout[8],out[14],cout[9]);
hadder_1 l0(c31[10],cout[9],out[15],cout[10]);
endmodule







