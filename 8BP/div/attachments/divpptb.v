`include "divpp.v"
module divpptb;
reg [7:0]num,den;
reg clk,reset;
wire [7:0]quo,rem;
divpp modd(num,den,quo,rem,clk,reset);
initial 
begin
$dumpfile("divpp.vcd");
$dumpvars(0,divpptb);
reset=1'b1;clk=1'b0;
num=8'b0000101;den=8'b00000010;reset=1'b0;
#2 num=8'b00001011;den=8'b00000011;
#2 num=8'b10111110;den=8'b01001101;
#2 num=8'b11100010;den=8'b00011101;
end
always
begin
#1 clk=~clk;
end
always
begin
#40 $finish;
end
initial
$monitor($time," num=%d  den=%d --> quo=%d  rem=%d",num,den,quo,rem);
endmodule