module fad(a,b,c,s,d);
input a,b,c;
output s,d;
assign s=a^b^c;
assign d=(a&b)|(b&c)|(c&a);
endmodule