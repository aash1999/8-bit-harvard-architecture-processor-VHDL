`include "div.v"
module divtb;
reg [7:0]num,den;
wire [7:0]quo,rem;
div modd(num,den,quo,rem);
initial 
begin
$dumpfile("div.vcd");
$dumpvars(0,divtb);
num=8'b00000101;den=8'b00000010;
#2 num=8'b00001011;den=8'b00000011;
#2 num=8'b10101110;den=8'b01001101;
#2 num=8'b11111111;den=8'b0;
end
initial
$monitor($time," num=%d  den=%d --> quo=%d  rem=%d",num,den,quo,rem);
endmodule