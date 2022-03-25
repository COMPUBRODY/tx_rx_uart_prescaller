transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/hardware_modules {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/hardware_modules/preescaller.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/hardware_modules {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/hardware_modules/displays_controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/hardware_modules {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/hardware_modules/display_7seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/hardware_modules {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/hardware_modules/debouncer.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/top_UART_golden_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/uart_tx.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/uart_rx.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/full_duplex_uart.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/baudrate_generator.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/register_controller.v}

vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/tb_module {C:/Users/Madera/Documents/Quartus_Workspace/tx_rx_uart_prescaller-master/UART/tb_module/tb_baudrate_generator.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_baudrate_generator

add wave *

add wave -position end sim:/tb_baudrate_generator/tb_baudrate_generator_DUT/p_scaler_9600/*
add wave -position end sim:/tb_baudrate_generator/tb_baudrate_generator_DUT/p_scaler_57600/*
add wave -position end sim:/tb_baudrate_generator/tb_baudrate_generator_DUT/p_scaler_115200/*



view structure
view signals
run -all
