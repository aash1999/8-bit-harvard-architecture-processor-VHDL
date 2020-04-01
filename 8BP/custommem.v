module custommem(rdst1,rdst2,rsrc1,rsrc2,imm_value,imm_value2,r1,r2,select,src_address,dst_address);
input [4:0] rdst1,rdst2,rsrc1,rsrc2,src_address,dst_address;
input [1:0] select;
input [7:0] imm_value,imm_value2;
output reg [7:0] r1,r2;
reg [7:0] ram_m [0:31];
reg [7:0] data [0:31];
always @(*)
begin
if(select == 2'b00)
begin
ram_m[rdst1] = imm_value;
ram_m[rdst2] = imm_value2;
r1 = ram_m[rsrc1];
r2 = ram_m[rsrc2];
end
else if(select == 2'b10)begin //data->reg 
	ram_m[rdst1]= data[src_address];
	r1 = data[src_address];
end
else if(select == 2'b11)begin // reg->data
	data[dst_address] = ram_m[rsrc1];
	r1 = ram_m[rsrc1];
end
else begin //reg->reg
	ram_m[rdst1] = ram_m[rsrc1];
	r1 = ram_m[rsrc1];
end
end
endmodule
//rdst1,rdst2,rsrc1,rsrc2,imm_value,imm_value2,r1,r2,select,src_address,dst_address