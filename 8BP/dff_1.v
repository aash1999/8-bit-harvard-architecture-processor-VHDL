module dff_1(d,q,clk,reset);
input clk ,d,reset;
output reg q;
always @(posedge clk)
begin
	if(reset)
	q<=1'b0;
	else 
	q<=d;
end
endmodule 

