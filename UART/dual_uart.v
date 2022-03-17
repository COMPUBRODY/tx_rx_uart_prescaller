module dual_uart	( 
							dbus, a, reset, rd_, wr_, 
							cs_0, cs_1, din0, din1, clkin,
							int0, int1, dout0, dout1, clko0, clko1
);

inout [7:0] dbus;
input [2:0]	a;
input	reset, rd_, wr_;
input	cs_0, cs_1, din0, din1, clkin;


output int0, int1, dout0, dout1, clko0, clko1;

//the first instance of a single UART module
uart	u0(
	reset, dbus, a, rd_, wr_, cs_0, din0, clkin,
	int0, dout0, clko0
);

// the second instance of a single UART module
uart	u1(
	reset, dbus, a, rd_, wr_, cs_1, din1, clkin,
	int1, dout1, clko1
);

endmodule



