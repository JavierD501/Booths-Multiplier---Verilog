`timescale 1ns / 1ps


module tb_boothMultiplier(

	);
    
	reg clock, reset, start;
	reg[3:0] A, B;
	wire[7:0] P;
	wire ready;
    
	BoothMultiplier DUT(
	.clock(clock),
	.reset(reset),
	.start(start),
	.A(A),
	.B(B),
	.P(P),
	.ready(ready)
	);
    
	initial begin
	forever begin
	clock = 1'b0; #5;
	clock = 1'b1; #5;
 end end
    
	initial
	begin
	reset = 1'b1; #6;
	reset = 1'b0; #5;
	A = 4'd1; B = 4'd3; start = 1'b1; #30;
    
	reset = 1'b1; #6;
	reset = 1'b0; #5;
	A = 4'd1; B = -4'd3; start = 1'b1; #30;
    
	reset = 1'b1; #6;
	reset = 1'b0; #5;
	A = -4'd1; B = 4'd3; start = 1'b1; #30;
    
	reset = 1'b1; #6;
	reset = 1'b0; #5;
	A = -4'd1; B = -4'd3; start = 1'b1; #30;
	end
endmodule
