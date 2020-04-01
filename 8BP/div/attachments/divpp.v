`include "dff8.v"
`include "divstage.v"
module divpp(num,den,quo,rem,clk,reset);
input [7:0]num,den;
input clk,reset;
output [7:0]quo,rem;
wire z;
wire [7:0]a2,a4,a6,a8,a10,a12,a14,a16,a17,q2,q4,q6,q8,q10,q12,q14,q16;
wire [7:0]d2,d4,d6,d8,d10,d12,d14,dd2,dd4,dd6,dd8,dd10,dd12,dd14,den1,den2,den3,den4,den5,den6,den7;
reg [7:0]rem;

divstage x0(8'b00000000,num,a2,q2,den);
dff8 x10(a2,d2,clk,reset);
dff8 x20(q2,dd2,clk,reset);
dff8 x30(den,den1,clk,reset);

divstage x1(d2,dd2,a4,q4,den1);
dff8 x11(a4,d4,clk,reset);
dff8 x21(q4,dd4,clk,reset);
dff8 x31(den1,den2,clk,reset);

divstage x2(d4,dd4,a6,q6,den2);
dff8 x12(a6,d6,clk,reset);
dff8 x22(q6,dd6,clk,reset);
dff8 x32(den2,den3,clk,reset);

divstage x3(d6,dd6,a8,q8,den3);
dff8 x13(a8,d8,clk,reset);
dff8 x23(q8,dd8,clk,reset);
dff8 x33(den3,den4,clk,reset);

divstage x4(d8,dd8,a10,q10,den4);
dff8 x14(a10,d10,clk,reset);
dff8 x24(q10,dd10,clk,reset);
dff8 x34(den4,den5,clk,reset);

divstage x5(d10,dd10,a12,q12,den5);
dff8 x15(a12,d12,clk,reset);
dff8 x25(q12,dd12,clk,reset);
dff8 x35(den5,den6,clk,reset);

divstage x6(d12,dd12,a14,q14,den6);
dff8 x16(a14,d14,clk,reset);
dff8 x26(q14,dd14,clk,reset);
dff8 x36(den6,den7,clk,reset);

divstage x7(d14,dd14,a16,q16,den7);



assign quo=q16;
 rca8 z8(a16,den7,a17,z);
always@(*)
begin
if(a16[7]==0)
	rem<=a16;
else
	rem<=a17;
end

endmodule