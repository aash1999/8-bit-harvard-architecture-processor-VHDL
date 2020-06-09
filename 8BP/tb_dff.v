`timescale 1ns / 1ps
module dflipflop_tb;
reg d,clock,reset;
wire q;

dff_1 mod(d,q,clock,reset);
initial 
begin
	$dumpfile("dflipflop.vcd");
    $dumpvars(0,dflipflop_tb);
	#0 clock=0;reset =1;
	#1 reset =0;d=1;
	#1 reset =1;d=0;
	#1 reset =1;d=1;
	#1 reset =0;d=0;
end
always
begin
	#1 clock = ~clock;
end

always
begin
	#10 $finish;
end

initial
$monitor($time," clock = %b,reset = %b,d = %b ,q = %b" ,clock,reset,d,q);
endmodule