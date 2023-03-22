`timescale 1ns / 1ps


module BoothMultiplierM2(
    input reset,
    input clock,
    input start,
    input signed [3:0] A, //Multiplicand
    input signed [3:0] B, //Multiplier
    output signed [7:0] P,
    output ready
    );
    
    //wire [3:0] sum, difference;
    reg signed [7:0] P = 8'd0;
    reg ready;
    reg[1:0] counter;
    
    always @(posedge clock)
    begin
    if(reset) begin
    P = 8'd0;
    ready = 1'b0;
    counter = 2'b00;
    end
    else
    if(start)
   	 if(counter == 2'b0)
   		 if({B[counter + 1], B[counter], 1'b0} == 3'b000)begin
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 1], B[counter], 1'b0} == 3'b001)begin
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 1], B[counter], 1'b0} == 3'b010)begin
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 1], B[counter], 1'b0} == 3'b011)begin
   		 P = P + A;
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 1], B[counter], 1'b0} == 3'b100)begin
   		 P = P - A;
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 1], B[counter], 1'b0} == 3'b101)begin
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 1], B[counter], 1'b0} == 3'b110)begin
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 1], B[counter], 1'b0} == 3'b111)begin
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
		 else if(counter > 1'b0)
    		 if({B[counter + 2], B[counter + 1], B[counter]} == 3'b000)begin
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b001)begin
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b010)begin
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b011)begin
   		 P = P + A;
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b100)begin
   		 P = P - A;
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b101)begin
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b110)begin
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b111)begin
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b0;
   		 end
   		 else if(counter == 2'b11)
    		 if({B[counter + 2], B[counter + 1], B[counter]} == 3'b000)begin
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b1;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b001)begin
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b1;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b010)begin
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b1;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b011)begin
   		 P = P + A;
   		 P = P + A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b1;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b100)begin
   		 P = P - A;
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b1;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b101)begin
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b1;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b110)begin
   		 P = P - A;
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b1;
   		 end
   		 else if({B[counter + 2], B[counter + 1], B[counter]} == 3'b111)begin
   		 P = P << 1;
   		 counter = counter + 1;
   		 ready = 1'b1;
   		 end
   		 else;
    end
endmodule
