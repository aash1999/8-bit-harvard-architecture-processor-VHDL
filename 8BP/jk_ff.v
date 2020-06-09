module jk_ff(clk,reset,j,k,q);
input clk,reset,j,k;
output reg q;



always @(posedge clk )
begin
	if(reset)
	begin
		q=0;
	end
	else
	begin
		q=(j&(~q))|((~k)&q);
		
	end
end
endmodule