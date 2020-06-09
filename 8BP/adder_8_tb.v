`timescale 1ns / 1ps
module adder_8_tb;
reg [7:0] a,b;
wire [15:0] out;
multiplier mod1(a,b,out);
initial
begin
	$dumpfile("rdcla.vcd");
    $dumpvars(0,adder_8_tb);
	#0 a= 8'b00101011 ;b =8'b00110001;
end
initial
begin
$monitor($time," a=[%d],b=[%d],sum=[%d]" ,a,b,out);
end
endmodule