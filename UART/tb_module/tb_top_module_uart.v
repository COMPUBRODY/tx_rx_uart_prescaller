`timescale 10ns / 100ps


module tb_top_module_uart ();

reg clock_50;
reg [3:0]   botons;
reg [9:0]   leds_flags;
reg [9:0]   swiches;
reg [35:0]  gpios;

wire [6:0] disp_0, disp_1, disp_2, disp_3, disp_4, disp_5;

always #1 clock_50 = ~clock_50;

top_UART_golden_top         tb_top_module_uart_DUT(
                                .CLOCK_50       (clock_50),
                                .HEX0           (disp_0),
                                .HEX1           (disp_1),
                                .HEX2           (disp_2),
                                .HEX3           (disp_3),
                                .HEX4           (disp_4),
                                .HEX5           (disp_5),
                                .KEY            (botons),
                                .LEDR           (leds_flags),
                                .SW             (swiches),
                                .GPIO_0         (gpios)

);


initial
        begin
            
            clock_50   	=   0;
            botons  		=   0;
            swiches 		=   0;

            /*=====================================
                        CASO DE PRUEBA TX
            =======================================*/
            #50
            //simular 1 envio en tx sin nada habilitado
            botons[0] = 1;
            #50
            // Habilitar el UART
            swiches[0] = 1;
            // para seleccionar 9600 bauds
            swiches[1] = 1;
            swiches[2] = 0;
            // habilitar tx
            swiches[4] = 1;
            //presionar boton para envio en tx todo habilitado
				#50
            botons[0] = 1;

             // que va a enviar si no hay nada en los registros...
            /*=====================================
                        CASO DE PRUEBA RX
            =======================================*/


            /*=======================================================
                CASO DE PRUEBA MOSTRAR BAUDRATE SELECCIONADO
            =======================================================*/



            $display    ("Simulation for TX Transmitter Finished");
            $stop;

        end


endmodule

