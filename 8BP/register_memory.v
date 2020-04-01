module register_memory(in_address,out_address,in_data,out_data);
input [4:0] in_address,out_address;
input [7:0] in_data;
output reg [7:0] out_data;
reg [7:0] ram_m [0:31];
always @(*)
begin
ram_m[in_address] = in_data;
out_data = ram_m[out_address];
end
endmodule