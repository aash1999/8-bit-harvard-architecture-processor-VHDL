module mux_adder(i0,i1,out);
input [1:0]i0,i1;
output [1:0]out;
reg out;
always @(i0 or i1)
begin
	if(i1 == 2'b00)
	out = 2'b00;
	else if(i1 == 2'b01 | i1 == 2'b10)
	out = i0;
	else if(i1 == 2'b11)
	out = 2'b11;
end
endmodule
