#!/bin/bash
yosys -p 'synth_ecp5 -top blinky -json blinky.json' blinky.sv
nextpnr-ecp5 --25k --package CABGA256 --lpf icepi-zero.lpf --json blinky.json --textcfg blinky.config
ecppack blinky.config blinky.bit
openFPGALoader -cft231X --pins=7:3:5:6 blinky.bit
# flash
# openFPGALoader --write-flash -cft231X --pins=7:3:5:6 blinky.bit


# ICE40
# icebox_vlog blinky.asc > blinky_chip.v
# iverilog -o blinky_tb blinky_chip.v blinky_tb.v
# vvp -N ./blinky_tb
