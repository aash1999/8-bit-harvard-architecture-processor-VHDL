module decoder(instruction , imm_value,src_address,dst_address,rdst2,rdst1,rsrc2,rsrc1,rdst);
input [31:0]instruction;
output reg[7:0] imm_value,src_address,dst_address;
output reg[4:0] rdst,rdst2,rdst1,rsrc2,rsrc1;
wire [5:0]opcode ;
assign opcode = instruction[31:26];

always@(*)
begin
	case(opcode)
	6'b000000 : begin
		rdst1 = instruction[25:21];
		imm_value = instruction[7:0];
	end
	6'b000001 : begin
		rdst1 = instruction[25:21];
		rsrc1 = instruction[4:0];
	end
	6'b000010 : begin //reg <-data
		src_address = instruction[7:0];
		rdst1 =  instruction[25:21];
	end
	6'b000011 : begin //data<-reg
		dst_address = instruction[25:18];
		rsrc1 =instruction[4:0];
	end
	6'b000100 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];

	end
	6'b000101 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
	end
	6'b000111 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
		rdst2 = instruction[25:21];
	end
	6'b001000 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
		rdst2 = instruction[25:21];
	end
	6'b000110 : begin
		rdst1 = instruction[25:21];
		rsrc1 = instruction[4:0];
	end
	6'b001001 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
	end
	6'b001010 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
	end
	6'b001011 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
	end
	6'b001100 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
	end
	6'b001101 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
	end
	6'b001110 : begin
		rdst1 = instruction[25:21];
		rsrc1 = instruction[4:0];
	end
	6'b001111 : begin
		rsrc1 = instruction[4:0]; 
		rsrc2 = instruction[9:5];
		rdst1 = instruction[20:16];
	end
 	endcase
end 
endmodule
