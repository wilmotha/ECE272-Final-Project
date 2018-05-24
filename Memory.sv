module ram #(parameter N = 3, M = 5)
			(input logic 			clk_manual,
			 input logic 			reset_n,
			 input logic 			we, 	//Write Enable
			 input logic [N–1:0] 	adr,	//Address
			 input logic [M–1:0] 	value,
			 output logic [M–1:0] 	dout);
			 
	logic [M–1:0] mem [2**N–1:0];	//No clue what this is
	
	always_ff @(posedge clk, negedge reset_n)
		if (!reset)
			mem <= 0;
		else if (we) 
			mem [adr] <= value;

	assign dout = mem[adr];
endmodule