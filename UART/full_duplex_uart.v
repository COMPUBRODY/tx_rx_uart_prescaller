module full_duplex_uart(
                            //clk16x,
							clock,
							clrn,// universal asynchronous receiver transmitter
                            //rdn,
                            //d_out,
                            //r_ready,
                            rxd,
                            //parity_error,
                            //frame_error,
                            //wrn,
                            d_in,
							//RX I/O
                            //cnt16x,
                            //no_bits_rcvd,
                            //r_buffer,
                            //r_clk1x,
                            sampling,
                            r_data,
                            //no_bits_sent,
							//reciving_rx,
							//TX I/O
							tx_send,
							//t_empty,
                            txd,
                            //t_buffer,
                            //t_clk1x,
                            sending,
                            //t_data,
							clk_uart
);


// SIGNALS OF CLOCKS

input clock;
input clrn; // baud rate * 16 clock
input clk_uart;
//input clk16x;


// SIGNALS OF TRANSMITER

input [7:0] d_in; // data byte from cpu
input tx_send; //this enables the sending message from external trigger
//input wrn; // cpu write, active low
output txd; // uart txd
//output t_empty; // transmitter empty

// SIGNALS OF RECEIVER

input rxd;
//input rdn; // cpu read, active low
output [7:0] r_data; // received data bits
output sampling; // sampling an rxd bit
output sending; // sending a txd bit
//output [10:0] r_buffer; // 11-bit frame
//output [7:0] t_buffer; // register for sending
//output [7:0] t_data; // register d_in
//output [3:0] no_bits_rcvd; // # of bits received
//output [3:0] no_bits_sent; // number of bits sent
//output [7:0] d_out; // data byte to cpu
//output r_ready; // receiver is ready
//output parity_error; // parity check error
//output frame_error; // data frame error


//output r_clk1x; // clock for sampling rxd
//output t_clk1x; // clock for sending txd
//output [3:0] cnt16x; // x16 clock counter
//reg [3:0] cnt16x; // x16 clock counter

	

/*
    // a 4-bit counter
    always @ (posedge clk16x or negedge clrn) begin
        if (!clrn) begin            // on reset
            cnt16x <= 4'd0;         // clear counter
        end 
        else begin
            cnt16x <= cnt16x + 4'd1; // counter++
        end
    end
*/

// receiver
uart_rx recver (
						 //clk16x, 
						 clrn, 
						 rdn, 
						 d_out, 
						 r_ready, 
						 rxd, 
						 parity_error,
						 frame_error, 
						 //cnt16x, 
						 r_data, 
						 no_bits_rcvd, 
						 r_buffer,
						 r_clk1x, 
						 sampling
);

// transmitter
uart_tx sender (
						 //clk16x, 
						 clrn, 
						 wrn, 
						 d_in, 
						 t_empty, 
						 txd, 
						 //cnt16x,
						 no_bits_sent, 
						 t_buffer, 
						 //t_clk1x, 
						 clk_uart,
						 sending, 
						 t_data
);


endmodule

