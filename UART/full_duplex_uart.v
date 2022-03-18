module full_duplex_uart(
							clock,
							clk_uart,
							clrn,// universal asynchronous receiver transmitter
                            rxd,
                            d_in,
							//RX I/O
                            sampling,
                            r_data,
							//TX I/O
							tx_send,
                            txd,
                            sending,
							
);


// SIGNALS OF CLOCKS

input clock;
input clrn; // baud rate * 16 clock
input clk_uart;

// SIGNALS OF TRANSMITER

input [7:0] d_in; // data byte from cpu
input tx_send; //this enables the sending message from external trigger
output txd; // uart txd

// SIGNALS OF RECEIVER

input rxd;
output [7:0] r_data; // received data bits
output sampling; // sampling an rxd bit
output sending; // sending a txd bit

// receiver
uart_rx recver (
						.clk_uart (clk_uart),
						.clrn			(clrn), 
						//rdn, 
						//d_out, 
						//r_ready, 
						.rxd			(rxd), 
						//parity_error,
						//frame_error, 
						.r_data		(r_data), 
						//no_bits_rcvd, 
						//r_buffer,
						//r_clk1x, 
						.sampling  (sampling)
);

// transmitter
uart_tx sender (
						.clk_uart	(clk_uart),
						 .clrn		(clrn), 
						 //wrn, 
						 .d_in		(d_in), 
						 //t_empty, 
						 .txd			(txd), 
						 //no_bits_sent, 
						 //t_buffer, 
						 
						 .sending	(sending), 
						 //t_data
						 .tx_send	(tx_send)
);


endmodule

