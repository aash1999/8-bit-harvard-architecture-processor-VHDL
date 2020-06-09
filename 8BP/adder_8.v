`include "mux_adder.v"
module adder_8(a,b,out);
input [7:0] a,b;
output [7:0] out;
wire [1:0]ip00,ip01,ip02,ip03,ip04,ip05,ip06,ip07,ip08;
assign ip00 = 2'b00;
assign ip01 = {a[0],b[0]};
assign ip02 = {a[1],b[1]};
assign ip03 = {a[2],b[2]};
assign ip04 = {a[3],b[3]};
assign ip05 = {a[4],b[4]};
assign ip06 = {a[5],b[5]};
assign ip07 = {a[6],b[6]};
assign ip08 = {a[7],b[7]};

wire [1:0]ip10,ip11,ip12,ip13,ip14,ip15,ip16,ip17,ip18;
mux_adder mod00(ip00,ip01,ip11);
mux_adder mod01(ip01,ip02,ip12);
mux_adder mod02(ip02,ip03,ip13);
mux_adder mod03(ip03,ip04,ip14);
mux_adder mod04(ip04,ip05,ip15);
mux_adder mod05(ip05,ip06,ip16);
mux_adder mod06(ip06,ip07,ip17);
assign ip10 = 2'b00;
assign ip18 = ip08;
wire [1:0]ip20,ip21,ip22,ip23,ip24,ip25,ip26,ip27,ip28;
assign ip20 = ip10;
assign ip21 = ip11;
mux_adder mod10(ip10,ip12,ip22);
mux_adder mod11(ip11,ip13,ip23);
mux_adder mod12(ip12,ip14,ip24);
mux_adder mod13(ip13,ip15,ip25);
mux_adder mod14(ip14,ip16,ip26);
mux_adder mod15(ip15,ip17,ip27);
assign ip28 = ip18;
wire [1:0]ip30,ip31,ip32,ip33,ip34,ip35,ip36,ip37,ip38;
assign ip30 = ip20;
assign ip31 = ip21;
assign ip32 = ip22;
assign ip33 = ip23;
mux_adder mod20(ip20,ip24,ip34);
mux_adder mod21(ip21,ip25,ip35);
mux_adder mod22(ip22,ip26,ip36);
mux_adder mod23(ip23,ip27,ip37);

assign ip38 = ip28;
wire [7:0]out1;
assign out1[0] = ip30[0];
assign out1[1] = ip31[0];
assign out1[2] = ip32[0];
assign out1[3] = ip33[0];
assign out1[4] = ip34[0];
assign out1[5] = ip35[0];
assign out1[6] = ip36[0];
assign out1[7] = ip37[0];
assign out = a^b^out1;

endmodule









