VERILOG_SOURCES := $(wildcard *.v) $(wildcard *.sv)
OUTPUT := bitstream

all: debug

clean:
	rm -f $(OUTPUT).bit $(OUTPUT).config $(OUTPUT).json

build: clean 
	yosys -p 'synth_ecp5 -top top -json $(OUTPUT).json' $(VERILOG_SOURCES)
	nextpnr-ecp5 --25k --package CABGA256 --lpf icepi-zero.lpf --json $(OUTPUT).json --textcfg $(OUTPUT).config
	ecppack $(OUTPUT).config $(OUTPUT).bit

debug: build
	openFPGALoader -cft231X --pins=7:3:5:6 $(OUTPUT).bit

install: build
	openFPGALoader -cft231X --pins=7:3:5:6 $(OUTPUT).bit --write-flash

.PHONY: build clean install
