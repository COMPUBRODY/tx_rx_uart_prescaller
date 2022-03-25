// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//								Thu Feb 11 11:26:45 2022
//
//								Modified by	Fernando Madera
// ============================================================================


`define ENABLE_CLOCK
`define ENABLE_HEX
`define ENABLE_KEY
`define ENABLE_LEDR
`define ENABLE_SW
`define ENABLE_GPIO

/*
module DE1_SOC_golden_top(
*/
module top_UART_golden_top(

      /* Enables CLOCK */
	`ifdef ENABLE_CLOCK
      input              CLOCK_50,
	`endif

      /* Enables HEX - 3.3V */
	`ifdef ENABLE_HEX
      output      [6:0]  HEX0,
      output      [6:0]  HEX1,
      output      [6:0]  HEX2,
      output      [6:0]  HEX3,
      output      [6:0]  HEX4,
      output      [6:0]  HEX5,
	`endif

      /* Enables KEY - 3.3V */
	`ifdef ENABLE_KEY
      input       [3:0]  KEY,
	`endif

      /* Enables LEDR - 3.3V */
	`ifdef ENABLE_LEDR
      output      [9:0]  LEDR,
	`endif

      /* Enables SW - 3.3V */
	`ifdef ENABLE_SW
      input       [9:0]  SW,
	`endif
	
      /* Enables GPIO - 3.3V */
	`ifdef ENABLE_GPIO
      inout     [35:0]         GPIO_0
	`endif
);


//=======================================================
//  REG/WIRE declarations
//=======================================================

//		WIRES
wire 	flag_1;
wire	slow_clk;
wire	uart_Clk;

wire	[23:0]	bytes_disp;  
wire	tx_send;
wire	[7:0]		tx_data;
wire	[7:0]		rx_data;
wire    enable_uart;

//		REGISTERS
//reg [:] ;


//=======================================================
//  Structural coding
//=======================================================



/*=====================================

-MODULOS UTILIZADOS
		
		a) Debouncer										Aplicar a hardware, no comprobado, creo!
		b) Displays contoller							TODO OK
		c)	Preescaller (Parametrizable)   	Ingresar por parametro la freq necesaria?
		d) UART_Tx_Rx (New)										IMPLEMENTACION CON TX Y RX
		e) generador de Baudrate						Necesario conectados al preescaller
		f) controlador de registros					necesario para mandar o recibir cadenas
		

=====================================*/


 /*=====================================
		UART FULL DUPLEX MODULE 
=====================================*/
full_duplex_uart u1(
							.clock			(CLOCK_50),
							.enable_uart	(enable_uart), 
							.reset_uart		(SW[0]),
							//RX I/O
							.rx_indicator	(LEDR[0]),
							.r_data			(rx_data),
							.enable_rx		(SW[3]),
							.rxd			(GPIO_0[31]),
							//TX I/O
							.d_in			(tx_data),
							.enable_tx		(SW[4]),
							.tx_send		(tx_send),
							.txd			(GPIO_0[33]),
							.tx_indicator	(LEDR[1])

);

// Errors
// RX indicador	LEDR_1
//	Tx Indicador	LEDR_2

/*=====================================
		DISPLAY CONTROLLERS__ok
=====================================*/


displays_controller u2 (
				.clock		(CLOCK_50),
				.num		(bytes_disp),
				.seg0		(HEX0) ,
				.seg1		(HEX1) ,
				.seg2		(HEX2) ,
				.seg3		(HEX3) ,
				.seg4		(HEX4) ,
				.seg5		(HEX5) 
				
	);

//Modo RX
//Modo Tx
//Modo Baudrate


/*=====================================
		DEBOUNCER___ok
=====================================*/

debouncer	u4(
				 .clk		(CLOCK_50),
				 .PB		(KEY[0]),  
				 .PB_state	(tx_send) 

);

//Manda Tx			LEDR_0 Indicador 

/*=====================================
		BAUDRATE GENERATOR___ok
=====================================*/
// FALTA HACER UN MULTIPLEXAJE PARA SELECCIONAR CUALQUIER BAUDRATE SIN PROBLEMAS
baudrate_generator u5(
								.clock			(CLOCK_50),
								.baudrate_sel	(SW[2:1]),
								.uart_enable	(enable_uart)
);

//9600		LEDR_3 Indicador
//55200		LEDR_4 Indicador
//115600		LEDR_5 Indicador

/*=====================================
		REGISTERS CONTROLLER
=====================================*/
// FALTA HACER SINCRONO EL CONTROLADOR DE DISPLAYS
register_controller u6(
			.clock			(CLOCK_50),
			.rx_in			(rx_data),
			.tx_out			(tx_data),
			.Byte_0			(bytes_disp [3:0]),
			.Byte_1			(bytes_disp [7:4]),
			.Byte_2			(bytes_disp [11:8]),
			.Byte_3			(bytes_disp [15:12]),
			.Byte_4			(bytes_disp [19:16]),
			.Byte_5			(bytes_disp [23:20]),
			.see_bauds		(KEY[1]),
			.baudrate_sel	(SW[2:1])	
);

//How many Bytes?
//for send strings?

endmodule
