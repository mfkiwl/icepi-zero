module blinky (
	output logic [4:0] led,
	input  wire        clock
);
	// Delay (50MHz >> 25 = 1.49011611938Hz = 0.67108864s/blink)
	logic [24:0] clkb = 0;
	wire clk = clkb[24];

	// Count the clocks
	always @(posedge clock) clkb <= clkb + 1'b1;

	// Add one to the led register
	always_ff @(posedge clk) begin
		led <= led + 1;
	end
endmodule
