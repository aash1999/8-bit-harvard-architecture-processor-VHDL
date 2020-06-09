`include "rca8.v"
module divstage(a,q,aa,qq,den);
input [7:0]a,q,den;
output [7:0]aa,qq;
reg [7:0]a1,q1,m0,qq;
wire [7:0]mm,mx;
wire x,y;

assign mm=~den;
rca8 z9(8'b00000001,mm,mx,y);

always@(*)
begin
if(a[7]==1'b0)begin
	{a1,q1}<={a[6:0],q[7:0],1'b0};
	m0<=mx;
	end
else begin
	{a1,q1}<={a[6:0],q[7:0],1'b0};
	m0<=den;
	end
end
rca8 z0(a1,m0,aa,x);
always@(*)
begin
if(aa[7]==0)
	qq<={q1[7:1],1'b1};
else
	qq<={q1[7:1],1'b0};
end
endmodule