/*
input [7:0] d_in;  // data byte from cpu
input [3:0] cnt16x; // x16 clock counter
input clk16x,clrn; // baud rate * 16 clock
input wrn; // cpu write, active low
output reg txd; // uart txd
output reg t_empty; // transmitter empty
output reg [3:0] no_bits_sent; // number of bits sent
output reg [7:0] t_data; // reg d_in
output reg [7:0] t_buffer; // reg for sending
output clk1x; // clock for sending txd
output reg sending; // sending a txd bit
reg load_t_buffer; // load t_buffer

=============================
TEST CASES
===========================

===========================
SENDING A FRAME
===========================

===========================
LOAD DATA
===========================

===========================
GENERATE SENDING SIGNAL
===========================



*/