
module division(a,b,q,r);
input [7:0] a,b;
output [7:0] q,r;

wire [7:0]a0 = 8'b00000000;
wire [7:0]q0;
assign q0 = a;
wire [7:0]m0 ;
assign m0={1'b0,b[6:0]};

wire [7:0] mr00;
assign mr00 = ~m0;
wire [7:0] mr0;
wire [7:0]carry00;
f_adder mod0001(mr00[0],1'b1,1'b0,mr0[0],carry00[0]);
f_adder mod0002(mr00[1],1'b0,carry00[0],mr0[1],carry00[1]);
f_adder mod0003(mr00[2],1'b0,carry00[1],mr0[2],carry00[2]);
f_adder mod0004(mr00[3],1'b0,carry00[2],mr0[3],carry00[3]);
f_adder mod0005(mr00[4],1'b0,carry00[3],mr0[4],carry00[4]);
f_adder mod0006(mr00[5],1'b0,carry00[4],mr0[5],carry00[5]);
f_adder mod0007(mr00[6],1'b0,carry00[5],mr0[6],carry00[6]);
f_adder mod0008(mr00[7],1'b0,carry00[6],mr0[7],carry00[7]);

reg [7:0]a01,q01;
reg [7:0]m01;
always @(a0)
begin
	if (a0[7] == 0)
	begin
		{a01[7:0],qo1[7:0]} = {a0[6:0],q0[7:0],1'b0};
		m01[7:0] = mr0[7:0];
	end
	else 
	begin
		{a01[7:0],q01[7:0]}= {a0[6:0],q0[7:0],1'b0};
		m01 = mr0;
	end
end

wire [7:0] a02,carry01;
f_adder mod0009(a01[0],m01[0],1'b0,a02[0],carry01[0]);
f_adder mod0010(a01[1],m01[1],carry01[0],a02[1],carry01[1]);
f_adder mod0010(a01[2],m01[2],carry01[1],a02[2],carry01[2]);
f_adder mod0010(a01[3],m01[3],carry01[2],a02[3],carry01[3]);
f_adder mod0010(a01[4],m01[4],carry01[3],a02[4],carry01[4]);
f_adder mod0010(a01[5],m01[5],carry01[4],a02[5],carry01[5]);
f_adder mod0010(a01[6],m01[6],carry01[5],a02[6],carry01[6]);
f_adder mod0010(a01[7],m01[7],carry01[6],a02[7],carry01[7]);

reg [7:0] q02;

always @(a02)
begin
	if(a02[7]==0)
	q02[7:0] = {q01[7:1],1'b1};
	else
	q02[7:0] = {q01[7:1],1'b0};
end

endmodule
