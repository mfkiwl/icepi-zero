module counter (
	input  wire        clock,
	input  logic       button,
	output logic [4:0] led = 0
);
	// Slow clock for debouncing
	logic [15:0] clkb = 0;
	wire clk = clkb[15];
	always_ff @(posedge clock) clkb <= clkb + 1'b1;

	// Design
	logic button_state;
	always_ff @(posedge clk) 
		button_state <= button;

	always_ff @(negedge button_state) begin
		led <= led + 1;
	end
endmodule

