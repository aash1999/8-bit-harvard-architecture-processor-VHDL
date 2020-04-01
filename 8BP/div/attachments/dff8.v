module dff8(d,q,clk,res);
input [7:0]d;
input clk,res;
output [7:0]q;
reg q;
always@(posedge clk)
begin
	if(res==1)
		q<=1'b0;
	else
		q<=d;
end
endmodule