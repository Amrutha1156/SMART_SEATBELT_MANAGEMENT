
## ==========================================
## SMART SEATBELT SYSTEM
## EDGE ARTIX-7 XC7A35T
## VIVADO 2022.1
## ==========================================

## FPGA configuration voltage
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## 50 MHz onboard clock
set_property -dict {PACKAGE_PIN N11 IOSTANDARD LVCMOS33} [get_ports {clk}]
create_clock -period 20.000 -name sys_clk [get_ports {clk}]

## ==========================================
## INPUT SWITCHES
## ==========================================

## Physical SW3 - Ignition
set_property -dict {PACKAGE_PIN L5 IOSTANDARD LVCMOS33} [get_ports {SW0}]

## Physical SW4 - Occupancy
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports {SW1}]

## Physical SW5 - Buckle
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports {SW2}]

## Physical SW6 - Belt length bit 0
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports {SW3}]

## Physical SW7 - Belt length bit 1
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports {SW4}]

## ==========================================
## ONBOARD LEDS
## ==========================================

## D3 - Safe indicator
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {LED0}]

## D4 - Unsafe indicator
set_property -dict {PACKAGE_PIN H3 IOSTANDARD LVCMOS33} [get_ports {LED1}]

## ==========================================
## ONBOARD BUZZER
## ==========================================

set_property -dict {PACKAGE_PIN K12 IOSTANDARD LVCMOS33} [get_ports {Buzzer}]
