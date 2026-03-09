module tb;
reg clk, reset, x;
wire y;

sequence_detector uut(clk,reset,x,y);

always #5 clk = ~clk;

initial begin
$dumpfile("wave.vcd");
$dumpvars(0,tb);

clk=0; reset=1; x=0;
#10 reset=0;

#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;

#50 $finish;
end
endmodule
