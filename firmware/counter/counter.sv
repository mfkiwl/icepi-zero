module counter (
	input  wire        clock,
	input  logic       button,
	output logic [0:0] led
);
	// 1525.8 hz clock
	logic [14:0] clkb = 0;
	wire clk = clkb[14];

	logic state = 0;

	assign led[0] = ~button[0];

	always @(posedge clock) clkb <= clkb + 1'b1;
endmodule
