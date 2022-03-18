/*
'define SOURCE_CLK  50000000
'define BAUD_9600       9600
'define BAUD_57600      57600
'define BAUD_115200     115200
*/
module baudrate_generator(
	input clock,
	input [1:0] baudrate_sel,
	output uart_clock

);

wire enable_9600;
wire enable_57600;
wire enable_115200;

preescaller#(.CLK (50000000), .SCALE (9600))     p_scaler_9600(
                        .clock      (clock),
                        .enable     (enable_9600),
                        .slow_clock (uart_clock)
);

preescaller#(.CLK (50000000), .SCALE (57600))     p_scaler_57600(
                        .clock  (clock),
                        .enable  (enable_57600)
                        //.slow_clock (uart_clock)
);

preescaller#(.CLK (50000000), .SCALE (115200))     p_scaler_115200(
                        .clock  (clock),
                        .enable  (enable_115200)
                        //.slow_clock (uart_clock)
);

//always @(posedge clock) //@(baudrate_sel)
assign enable_9600      = (baudrate_sel ==  2'b01 ) ? 1'b1 : 1'b0;
assign enable_57600     = (baudrate_sel ==  2'b10 ) ? 1'b1 : 1'b0;
assign enable_115200    = (baudrate_sel ==  2'b11 ) ? 1'b1 : 1'b0;

endmodule
