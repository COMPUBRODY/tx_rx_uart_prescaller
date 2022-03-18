`timescale 1ns / 10ps

module tb_baudrate_generator();

    reg clock;
    reg [1:0] baudrate_sel;
    wire uart_clock;

    always #1 clock = ~clock;

    baudrate_generator     tb_baudrate_generator_DUT(
                .clock  (clock),
                .baudrate_sel (baudrate_sel),
                .uart_clock (uart_clock)

    );

    initial
        begin

            clock   =   0;
            baudrate_sel  = 1;
            #1000
            baudrate_sel  = 2;
            #1000
            baudrate_sel  = 3;
            #1000
            baudrate_sel  = 0;
            #1000
            $display    ("Simulation for Baudrate Generator Finished");
            $stop;
        end
        


endmodule