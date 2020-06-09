module mux_2to1(i0,i1,s0,out);
input i0,i1,s0;
output  reg out;
always@(*)
begin
	if(s0==1'b0)
	out = i0;
	else 
	out = i1;
end
endmodule
