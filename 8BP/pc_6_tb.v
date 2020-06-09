module jk_tb;
reg clock,reset;
wire [5:0]out;
pc_6 mod1(clock,reset,out);
always #1 clock = ~clock;
initial
begin
  #0reset =1;clock=0;
  #2reset =0;
  #200 $finish;

end
initial 
$monitor($time ,"clock = %b reset = %b  out = %d ",clock,reset,out);
endmodule