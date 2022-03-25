onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top_module_uart/clock_50
add wave -noupdate /tb_top_module_uart/botons
add wave -noupdate /tb_top_module_uart/swiches
add wave -noupdate -expand /tb_top_module_uart/gpios
add wave -noupdate /tb_top_module_uart/leds_flags
add wave -noupdate /tb_top_module_uart/disp_0
add wave -noupdate /tb_top_module_uart/disp_1
add wave -noupdate /tb_top_module_uart/disp_2
add wave -noupdate /tb_top_module_uart/disp_3
add wave -noupdate /tb_top_module_uart/disp_4
add wave -noupdate /tb_top_module_uart/disp_5
add wave -noupdate -divider {UART CONTROL}
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/reset_uart
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/enable_uart
add wave -noupdate -divider TX
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/enable_tx
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/tx_send
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/txd
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/tx_led
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/tx_indicator
add wave -noupdate /tb_top_module_uart/tb_top_module_uart_DUT/u1/d_in
add wave -noupdate -divider RX
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/enable_rx
add wave -noupdate /tb_top_module_uart/tb_top_module_uart_DUT/u1/rxd
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/rx_led
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u1/rx_indicator
add wave -noupdate /tb_top_module_uart/tb_top_module_uart_DUT/u1/r_data
add wave -noupdate -divider {BAUD GENERATOR}
add wave -noupdate /tb_top_module_uart/tb_top_module_uart_DUT/u5/baudrate_sel
add wave -noupdate -radix hexadecimal -childformat {{{/tb_top_module_uart/tb_top_module_uart_DUT/u5/enable_bauds[2]} -radix hexadecimal} {{/tb_top_module_uart/tb_top_module_uart_DUT/u5/enable_bauds[1]} -radix hexadecimal} {{/tb_top_module_uart/tb_top_module_uart_DUT/u5/enable_bauds[0]} -radix hexadecimal}} -subitemconfig {{/tb_top_module_uart/tb_top_module_uart_DUT/u5/enable_bauds[2]} {-radix hexadecimal} {/tb_top_module_uart/tb_top_module_uart_DUT/u5/enable_bauds[1]} {-radix hexadecimal} {/tb_top_module_uart/tb_top_module_uart_DUT/u5/enable_bauds[0]} {-radix hexadecimal}} /tb_top_module_uart/tb_top_module_uart_DUT/u5/enable_bauds
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u5/output_9600
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u5/output_57600
add wave -noupdate -radix hexadecimal /tb_top_module_uart/tb_top_module_uart_DUT/u5/output_115200
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {6373964 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {11025 ns}
