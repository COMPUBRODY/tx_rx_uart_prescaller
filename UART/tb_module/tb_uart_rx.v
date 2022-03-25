`timescale 10ns / 100ps


/*



input [3:0] cnt16x; 					// x16 clock counter
input clk16x,clrn; 					    // baud rate * 16 clock
input rdn; 								// cpu read, active low
input rxd;                              // uart rxd

output [7:0] d_out;                     // data byte to cpu
output reg r_ready;                     // receiver is ready
output reg parity_error;                // parity check error
output reg frame_error;                 // data frame error
output reg [10:0] r_buffer;             // 11-bit frame
output reg [7:0] r_data;                // received data bits
output reg [3:0] no_bits_rcvd;          // # of bits received
output reg clk1x;                       // clock for sampling rxd
output reg sampling;                    // sampling an rxd bit


=============================
HOW TO READ A FRAME
===========================

==================================
TEST FRAME
==================================


==================================
NUMBER OF BITS COUNTER
==================================


==================================
TEST STATES
==================================


==================================
TEST FALLING EDGE
==================================


*/