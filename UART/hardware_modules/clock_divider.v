`timescale 1ns / 10ps
//`define size_counter 5


module clock_divider(
	input fast_clock,
	input rst,
	output slow_clock

);

	
	parameter COUNTER_SIZE = 10;
	parameter COUNTER_MAX_COUNT = (2 ** COUNTER_SIZE) - 1;
	
	reg [COUNTER_SIZE-1:0] count;
	
	always @(posedge fast_clock or negedge rst)
	if(!rst)
		count <= 0;
	else
	begin
		if(count == COUNTER_MAX_COUNT)
			count <= 0;
		else
			count <= count +1'b1;
			count <= 0;
	end
	
	assign slow_clock = count[COUNTER_SIZE-1];
	
endmodule

