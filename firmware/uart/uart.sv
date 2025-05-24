module uart(
	input clock,

	input usb_rx,
	output usb_tx,

	output led,
	input sd_det
);
	assign usb_tx = clock;
	assign led = sd_det;
endmodule
