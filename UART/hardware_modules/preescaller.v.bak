`timescale 1ns / 10ps
module preescaller(
	input clock,
	output enable_flag

);

	parameter COUNTER_SIZE = 22;
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



/*


    //  Clock Generation
    always  @(posedge   clkin)  begin

        oclkreg =   oclkreg + 1;
        iclkreg =   iclkreg + 1;
        fork                                // procesos en paralelo
            if (ocklreg >= divisor) begin

                ocklreg     =   0;
                xmt_clock   =   1;
                clko        =   1;
                #1
                clko        =   0;
                xmt_clock   =   0;
                
            end
            if (iclkreg >= divisor) begin

                iclkreg     =   0;
                rcv_clock  =   1;
                #1
                rcv_clock  =   0;
                                
            end
        join

    end


el join tiene que ver con pedos de replicar cuantas veces el modulo, para paralelismo tengo entendido

*/