module Negation(a,out);
input [7:0] a;
output [7:0] out;
assign out = ~a + 1;
endmodule