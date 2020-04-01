`include "pc_6.v"
`include "instruction.v"
`include "alu1.v"
module TB();
reg clk, reset;
wire [5:0] counter;
wire [31:0] Instruction_out;
wire [7:0] out1,out2;
output [7:0] r1,r2; 
output [15:0] out;
output [7:0] R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11;
pc_6 counter1(clk, reset, counter);
instruction mem1(Instruction_out, counter);
alu01 alu1(Instruction_out,clk,reset,out1,out2,out,r1,r2,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11);
initial 
begin 
clk=0;
forever #2 clk=~clk;
end
initial
begin
#0 reset=1;
#10;reset =0;
end
initial
#90 $finish;
initial
$monitor("r1 = %3d || r2 = %3d || r3 = %3d || r4 = %3d || r5 = %3d || r6 = %3d || r7 = %3d || r8 = %3d || r9 = %3d || r10 = %3d || r11 = %3d",R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11);
endmodule 