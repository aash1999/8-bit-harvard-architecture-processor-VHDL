module hadder_1(a,b,out,c);
input a,b;
output out,c;
assign out = a^b;
assign c = a&b;
endmodule
