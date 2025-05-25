module top (
	input  wire        clk,
	input  logic       button,
	output logic [4:0] led
);
	// Slow clock for debouncing 762Hz
	logic [11:0] clkb;

	initial begin
		clkb <= 0;
	end

	always_ff @(posedge clk) begin 
		clkb <= clkb + 1'b1;
	end

	wire clki = clkb[11];

	// Real code
	logic last_state;
	logic bounce;
	logic [3:0] timer;
	
	initial begin
		led <= 0;
		last_state <= 0;
		bounce <= 0;
		timer <= 0;
	end

	always_ff @(posedge clki) begin
		// Decrease the counter;
		if (timer != 0) begin
			timer <= (timer == 0 ? 0 : timer - 1);
		end else if (button != last_state) begin 
			// Button value isn't last state, start timer
			bounce <= button;
			timer <= 4'b1111;
		end

		// Timer ended
		if (timer == 1 && button == bounce) begin
			last_state <= button;

			if (!button) begin
				led <= led + 1;
			end
		end
	end
endmodule
