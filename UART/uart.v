module  uart (
        reset, dbus, a, rd_, wr_,
		  cs_, din, clkin,
        int, dout, clkout
    );

    // Input/output declarations
    //...
	 inout [7:0] dbus;
	 reg	[7:0]	dbus_reg;
	 wire [7:0]	dbus = dbus_reg;
	 input [2:0] a;
	 wire [2:0]	a;
	 input reset, rd_, wr_, cs_, din, clkin;
	 wire  reset, rd_, wr_, cs_, din, clkin;
	 output int, dout, clkout;
	 reg int, dout, clkout;

    // the addresses of the internal registers parameter
    //...
    parameter

            XMITDT_ADDR = 0,
            STATUS_ADDR = 1,
            DIVLSB_ADDR = 2,
            DIVMSB_ADDR = 3,
            RECVDT_ADDR = 4,
            CLRINT_ADDR = 7;


    // the internal state
    parameter   
        TRANSMITTING    =   0,
        RECEIVING       =   1,
        DONE_XMT        =   2,
        DONE_RCV        =   3;

    reg[7:0]    regfile[0:7];
    wire[15:0]  divisor =   
									{ regfile[DIVMSB_ADDR],  regfile[DIVLSB_ADDR]    };
    reg[15:0]   oclkreg,    iclkreg;
    reg xmt_clock,  rcv_clock;
    event do_transmit;


    integer lines;

    initial begin

       lines    =   0;
       oclkreg  =   0;
       iclkreg  =   0;
       $monitor("%m:r[0]=%h, r[1]=%h, r[2]=%h, r[3]=%h, r[4]=%h, time=%0d",  regfile[0], regfile[1], regfile[2], regfile[3], regfile[4], $time);

    end


    //  All the functional blocks of the module
    //  are described in the following subsection

  
	 /*		---------------
				RESET OPERATION
				---------------
				
	 */
    always @(negedge reset) begin   :   reset_block
        
        integer i;

        disable receive_block;
        disable transmit_block;
        oclkreg     =   0;
        iclkreg     =   0;
        int         =   0;
        dbus_reg    =   8'hzz;      //tri-state mode
        for (i = 0; i < 8; i = i+1) begin   // reset statement for registers

            regfile[i]  =   0;
            
        end
        
    end

    
	 /*		---------------
				CLOCK GENERATOR
				---------------
				
	 
    always  @(posedge   clkin)  begin

        oclkreg =   oclkreg + 1;
        iclkreg =   iclkreg + 1;
        //fork                                // procesos en paralelo
            if (oclkreg >= divisor) begin

                oclkreg     =   0;
                xmt_clock   =   1;
                clkout      =   1;
                #1
                clkout      =   0;
                xmt_clock   =   0;
                
            end
            if (iclkreg >= divisor) begin

                iclkreg     =   0;
                rcv_clock  =   1;
                #1
                rcv_clock  =   0;
                                
            end
        //join

    end
    */

	 /*		---------------
				READ OPERATION
				---------------
				
	 
    always  @(negedge   rd_)  if (~cs_) begin

        dbus_reg    =   regfile[a];
        //@(posedge   rd_)
        dbus_reg    =   8'hzz;
        if (a == CLRINT_ADDR) begin : read_block
            int =   0;
            //  Reset the DONE_XMT and DONE_RCV bits in
            //  the status register
            //...
        end
        
    end
*/
	 /*		---------------
				WRITE OPERATION
				---------------
				
	 
   */
	 
	 /*
		Aqui deberia de haber conexion con el boton de la tarjeta para realizar la indicacion de transmitir el dato
	
    always  @(negedge wr_)  if (~cs_) begin
        //@(posedge   wr_)
        regfile[a]  =   dbus;
        //if (a  ==  XMITDT_ADDR) -> do_transmit; 
        
    end
 */
    
	 
	 /*		------------------
				TRANSMIT OPERATION
				------------------
				
	 */
   // always  @do_transmit    begin   :   transmit_block
	/*
	always  @do_transmit    begin
        
        integer     i;
        reg[7:0]    data;
        reg[7:0]    status;

        //  Set the TRANSMITTING bit in the status register
        //...
        oclkreg     =   0;
        for (i = 0; i < 8; i = 1+1) begin

            //@(posedge   xmt_clock)      // detecta el reloj dentro del ciclo
            dout    =   data[i];

        end
        //  Reset the TRANSMITTING bit in the status register
        //  and set the DONE_XMT bit
        //...
        int = 1;

    end
	 */

	 /*		-------------------
				RECEIVE OPERATION
				-------------------
				
	 
    //always  @(negedge   din)    begin   :   receive_block
	 always  @(negedge   din)    begin

        integer i;
        reg[7:0]    data;
        reg[7:0]    status;

        //  wait for half clock
		  
        iclkreg     =   0;
        while (iclkreg != divisor/2 ) //@clkin; 

			  if (din != 0) disable   receive_block;

			  //  Start receiving
			  //  Set the RECEIVING bit in the status register
			  //...

			  iclkreg     =   0;
			  for (i = 0; i < 8; i = i+1) begin

					//@(posedge rcv_clock)
					data[i]     =   din;

			  end

        //  Reset the RECEIVING bit in the status register
        //  and set the DONE_RCV bit
        //...

        int = 1;   

    end
	 */


endmodule   //single UART
