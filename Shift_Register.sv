module ram #(parameter N = 3, M = 5)
			(input logic 			clk,
			 input logic 			reset,
			 input logic 			we,
			 input logic [N–1:0] 	adr,
			 input logic [M–1:0] 	value,
			 output logic [M–1:0] 	dout);
			 
	logic [M–1:0] mem [2**N–1:0];
	always_ff @(posedge clk, negedge reset)
		if (!reset)
			mem <= 0;
		else if (we) 
			mem [adr] <= value;

	assign dout = mem[adr];
endmodule