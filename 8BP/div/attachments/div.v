`include "divstage.v"
module div(num,den,quo,rem);
input [7:0]num,den;
output [7:0]quo,rem;
wire z;
wire [7:0]a2,a4,a6,a8,a10,a12,a14,a16,a17,q2,q4,q6,q8,q10,q12,q14,q16;
reg [7:0]rem;

divstage x0(8'b00000000,num,a2,q2,den);
divstage x1(a2,q2,a4,q4,den);
divstage x2(a4,q4,a6,q6,den);
divstage x3(a6,q6,a8,q8,den);
divstage x4(a8,q8,a10,q10,den);
divstage x5(a10,q10,a12,q12,den);
divstage x6(a12,q12,a14,q14,den);
divstage x7(a14,q14,a16,q16,den);

assign quo=q16;
 rca8 z8(a16,den,a17,z);
always@(*)
begin
if(a16[7]==0)
	rem<=a16;
else
	rem<=a17;
end

endmodule