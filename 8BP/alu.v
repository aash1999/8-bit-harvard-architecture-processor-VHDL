`include "decoder.v"
`include "register_memory.v"
`include "data_memory.v"
`include "adder_8.v"
`include "custommem.v"
`include "sub_8.v"
`include "multiplier.v"
`include "div.v"
`include "Nand.v"
`include "Negation.v"
`include "Or.v"
`include "Xor.v"
`include "Nor.v"
`include "Not.v"
`include "Lshifter.v"
//`include "Nxor.v"

module alu(instruction,clk,reset,out1,out2,out,r1,r2);
input [31:0] instruction;
input clk,reset;
output reg [7:0] out1,out2;
output [15:0] out;
wire [7:0] dl;
wire[7:0] imm_value,imm_value2;
wire[4:0] rdst,rdst2,rdst1,rsrc2,rsrc1,src_address,dst_address;
wire [5:0]opcode;
output [7:0] r1,r2;
assign opcode = instruction[31:26];
decoder mod1(instruction , imm_value,src_address,dst_address,rdst2,rdst1,rsrc2,rsrc1,rdst);
//register_memory mem1(rdst1,rsrc1,imm_value,r1);
//register_memory mem2(rdst1,rsrc1,imm_value,r2);
reg [1:0] select;
always@(*)
begin
	if(opcode == 6'b000001)
	select = 2'b01;
	else if(opcode == 6'b000010)begin
	select = 2'b10;
	end
	else if(opcode == 6'b000011)begin
	select = 2'b11;	
	end
	else begin
	select = 2'b00;
	end
end
custommem mem1(rdst1,rdst2,rsrc1,rsrc2,imm_value,imm_value2,r1,r2,select,src_address,dst_address);
wire [7:0] add,sub,quoitent,reminder,o_neg,o_or,o_xor,o_nand,o_nor,o_not,left,o_nxor;
wire [15:0] mul;
adder_8 add1(r1,r2,add);
sub_8 sub1(r2,r1,sub);
multiplier mul1(r2,r1,mul);
div div1(r2,r1,quoitent,reminder);
Negation neg1(r1,o_neg);
Or or1(r2,r1,o_or);
Xor xor1(r2,r1,o_xor);
Nand nand1(r2,r1,o_nand);
Nor nor1(r2,r1,o_nor);
Not not1(r1,o_not);
Lshifter lshift1(r2,r1[2:0],left);
//Nxor nxor1 (r1,r2,o_nxor);

always@(*)
begin
	case(opcode)
	6'b000000 :begin
		out2 = 8'b0;
		out1 = imm_value;
	end
	6'b000001 :begin
		out2 = 8'b0;
		out1 = r1;
	end
	6'b000010: begin
		out2 = 8'b0;
		out1 = r1;
	end
	6'b000011 : begin
		out2 = 8'b0;
		out1 = r1;
	end
	6'b000100 :begin
		out2 =8'b0;
		out1 = add;
	end
	6'b000101 :begin
		out2 = 8'b0;
		out1 = sub;
	end
	6'b000111 : begin
		out2 = mul[15:8];
		out1 = mul[7:0];
	end
	6'b001000 : begin
		out2 = reminder;
		out1 = quoitent;
	end
	6'b000110 : begin
		out2 = 8'b0;
		out1 = o_neg;
	end
	6'b001001 : begin
		out2 = 8'b0;
		out1 = o_or;
	end
	6'b001010 : begin
		out2 = 8'b0;
		out1 = o_xor;
	end
	6'b001011 : begin
		out2 = 8'b0;
		out1 = o_nand;
	end
	6'b001100 : begin
		out2 = 8'b0;
		out1 = o_nor;
	end
	6'b001101 : begin
		out2 = 8'b0;
		out1 = o_nxor;
	end
	6'b001110 : begin
		out2 = 8'b0;
		out1 = o_not;
	end
	6'b001111 : begin
		out2 = 8'b0;
		out1 = left;
	end

	endcase
end
assign out = {out2,out1};

//register_memory mem3(rdst1,_,out1,_);

endmodule


