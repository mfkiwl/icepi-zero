module counter (
	input  wire        clock,
	input  wire  [0:0] button,
	output logic [4:0] led
);
	// 1525.8 Hz clock
	logic [14:0] clkb = 0;
	wire clk = clkb[14];

	logic state = 0;

	assign led[0] = button[0];

	always @(posedge clock) clkb <= clkb + 1'b1;

	always_ff @(posedge button[0]) begin
		if (state != button[0]) begin
			led <= led + 1;
			state <= button[0];
		end
	end
endmodule
