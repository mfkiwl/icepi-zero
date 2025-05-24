#!/bin/bash
rm uart.bit uart.config uart.json

yosys -p 'synth_ecp5 -top uart -json uart.json' uart.sv
nextpnr-ecp5 --25k --package CABGA256 --lpf icepi-zero.lpf --json uart.json --textcfg uart.config
ecppack uart.config uart.bit
openFPGALoader -cft231X --pins=7:3:5:6 uart.bit
# flash
# openFPGALoader --write-flash -cft231X --pins=7:3:5:6 counter.bit


# ICE40
# icebox_vlog blinky.asc > blinky_chip.v
# iverilog -o blinky_tb blinky_chip.v blinky_tb.v
# vvp -N ./blinky_tb
