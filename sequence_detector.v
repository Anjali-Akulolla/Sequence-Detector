module sequence_detector(
input clk, reset, x,
output reg y
);

reg [1:0] state;

parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;

always @(posedge clk or posedge reset)
begin
if(reset)
state <= S0;
else
case(state)
S0: state <= x ? S1 : S0;
S1: state <= x ? S1 : S2;
S2: state <= x ? S3 : S0;
S3: state <= x ? S1 : S2;
endcase
end

always @(state,x)
begin
y = (state==S3 && x==1);
end

endmodule
