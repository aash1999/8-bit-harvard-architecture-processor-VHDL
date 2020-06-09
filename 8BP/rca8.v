`include "had.v"
`include "fad.v"
module rca8(a,b,s,c1);
input signed[7:0]a;
input signed[7:0]b;
output signed[7:0]s;
output signed c1;
wire [7:0]c;

had m0(a[0],b[0],s[0],c[0]);
fad m1(a[1],b[1],c[0],s[1],c[1]);
fad m2(a[2],b[2],c[1],s[2],c[2]);
fad m3(a[3],b[3],c[2],s[3],c[3]);
fad m4(a[4],b[4],c[3],s[4],c[4]);
fad m5(a[5],b[5],c[4],s[5],c[5]);
fad m6(a[6],b[6],c[5],s[6],c[6]);
fad m7(a[7],b[7],c[6],s[7],c[7]);
assign c1 = c[7];
endmodule