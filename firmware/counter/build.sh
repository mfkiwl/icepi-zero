#!/bin/bash
rm counter.bit counter.config counter.json

yosys -p 'synth_ecp5 -top counter -json counter.json' counter.sv
nextpnr-ecp5 --25k --package CABGA256 --lpf icepi-zero.lpf --json counter.json --textcfg counter.config
ecppack counter.config counter.bit
openFPGALoader -cft231X --pins=7:3:5:6 counter.bit
# flash
# openFPGALoader --write-flash -cft231X --pins=7:3:5:6 counter.bit


# ICE40
# icebox_vlog blinky.asc > blinky_chip.v
# iverilog -o blinky_tb blinky_chip.v blinky_tb.v
# vvp -N ./blinky_tb
