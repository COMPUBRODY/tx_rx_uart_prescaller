module uart_rx (
                    clk_uart,
						  clrn,
                    //rdn,
                    //d_out,
                    //r_ready,
                    rxd,
                    //parity_error,
                    //frame_error,
                    //cnt16x,
                    r_data,
                    //no_bits_rcvd,
                    //r_buffer,
                    //clk1x,
                    sampling,
                    

); // uart receiver


//input [3:0] cnt16x; 					// x16 clock counter
//input clk16x;
input clk_uart; // clock for baudrate
input clrn; 					    // baud rate * 16 clock
//input rdn; 								// cpu read, active low
input rxd;                              // uart rxd

//output [7:0] d_out;                     // data byte to cpu     -------------> ojo aqui salida a memoria
//output reg r_ready;                     // receiver is ready
//output reg parity_error;                // parity check error
//output reg frame_error;                 // data frame error
//output reg [10:0] r_buffer;             // 11-bit frame         -------------> ojo aqui salida a memoria
output reg [7:0] r_data;                // received data bits   -------------> ojo aqui salida a memoria
//output reg [3:0] no_bits_rcvd;          // # of bits received   -------------> para cambios en estados
//output reg clk1x;                       // clock for sampling rxd
output reg sampling;                    // sampling an rxd bit

reg [3:0] sampling_place;               // center of an rxd bit
reg rxd_new;                            // registered rxd
reg rxd_old;                            // registered rxd_new


// latch 2 rxd bits for detecting a falling edge
    always @ (posedge clk_uart or negedge clrn) begin
        if (!clrn) begin
            rxd_old <= 1;               // stop bits
            rxd_new <= 1;               // stop bits
        end 
        else begin
            rxd_old <= rxd_new;         // shift registers
            rxd_new <= rxd;             // shift registers
        end
    end

// detect start bit and generate sampling signal
    always @ (posedge clk_uart or negedge clrn) begin
        if (!clrn) begin
            sampling <= 0;                  // stop sampling
        end 
        else begin
            if (rxd_old && !rxd_new) begin              // had a negative edge
                if (!sampling)                          // if not sampling yet
                    //sampling_place <= cnt16x + 4'd8;    // +8: center place
                    sampling <= 1;                      // sampling please
            end 
            //else begin
            //    if (no_bits_rcvd == 4'd11)           // got one frame
				//		sampling <= 0;              // stop sampling
            //end
        end
    end


// number of bits received
    always @ (posedge clk_uart or negedge sampling) begin
        if (!sampling) begin
         //   no_bits_rcvd <= 4'd0;    // clear counter
        end 
        //else begin
            //no_bits_rcvd <= no_bits_rcvd + 4'd1;    // counter++
            //r_buffer[no_bits_rcvd] <= rxd;    // save rxd to r_buffer
        //end
    end

    // one frame, rdn clears r_ready
    always @ (posedge clk_uart or negedge clrn ) begin
        if (!clrn) begin        // on a reset
            //r_ready <= 0;        // clear ready
            //parity_error <= 0;        // clear parity error
            //frame_error        <= 0;
            //r_buffer        <= 0;
            r_data        <= 0;
        end 
        /*else begin
            if (!rdn) begin
                r_ready <= 0;
                parity_error <= 0;
                frame_error <= 0;
            end 
            else begin
                if (no_bits_rcvd == 4'd11) begin            //d'11 porque serian 4'b1011  solo se pueden recibir de 5 a 8 bits, los otros 3 1 de paridad y otro de stop, 1 de error??? 
                    r_data <= r_buffer[8:1];
                    r_ready <= 1;
                    if ( ^r_buffer[9:1]) begin  //excluye todo bit del buffer 9:1 que no sea igual al anterior
                        parity_error <= 1;          
                    end
                    if (!r_buffer[10]) begin    //si se llega a un bit mayor a 10 se manda un error
                        frame_error <= 1;
                    end
                end
            end
        end*/
end
    //assign d_out = !rdn ? r_data : 8'hz;
//assert_always #(severity_level, property_type, msg, coverage_level)
    //instance_name(clk,reset,test_exp)
   // assert_always #(1,0, "Err:NON", 0)
     //   AA1 (clk, 1'b1, (cnt >= 0) && (cnt<= 9));
        
endmodule


