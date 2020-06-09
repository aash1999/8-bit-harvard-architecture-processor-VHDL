`timescale 1ns / 1ps
module shifter_tb;
reg [7:0] a;
reg [2:0] b;
wire [7:0] out;
Rshifter mod1(a,b,out);
initial
begin
	$dumpfile("rdcla.vcd");
    $dumpvars(0,shifter_tb);
	#0 a= 8'b00101011 ;b =3'b000;
	#1 a= 8'b00101011 ;b =3'b001;
	#1 a= 8'b00101011 ;b =3'b010;
	#1 a= 8'b00101011 ;b =3'b011;
	#1 a= 8'b00101011 ;b =3'b100;
	#1 a= 8'b00101011 ;b =3'b101;
	#1 a= 8'b00101011 ;b =3'b110;
	#1 a= 8'b00101011 ;b =3'b111;
end
initial
begin
$monitor($time," a=[%8b],s=[%3b],shift=[%8b]" ,a,b,out);
end
endmodule