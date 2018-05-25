module ram	(input logic 			clk_manual,
			 input logic 			reset_n,
			 input logic 			we, 	//Write Enable
			 input logic [2:0] 		adr,	//Address
			 input logic [3:0] 		value,
			 output logic [3:0] 	dout,
			 output logic [2:0] 	adr_next);
			 
	logic [3:0] mem [2**2:0];	//No clue what this is
	
	always_ff @(posedge clk_manual, negedge reset_n)
		if (!reset_n)
			mem <= 0;
		else if (we) 
			begin
				mem [adr] <= value;
				adr_next <= adr_next + 1;
			end
		else
			adr_next <= adr;

	assign dout = mem[adr];
endmodule