

`define MODE_RX 0
`define MODE_TX 1

`define BAUDRATE_MODE 0
`define DATA_MODE 1

//BAUDRATE
`define ID_9600   0
`define ID_57600  1
`define ID_115200 2

`define SEL_9600   8'b00
`define SEL_57600  8'b01
`define SEL_115200 8'b10

`define MAX_BAUDRATE 115200

`define SAMPLING_FACTOR 7
`define HALF_PULSE 2

// BCD
`define BCD_DIM 6
`define BCD_MAX_IDX `BCD_DIM-1

`define BCD_SEGMENTS 7
`define OUTPUT_DIM `BCD_DIM*`BCD_SEGMENTS

`define BCD_DISPLAY_LEDS `OUTPUT_DIM-1