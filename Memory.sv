module ram	(input logic 			clk_manual,
			 input logic 			reset_n,
			 input logic 			we, 	//Write Enable
			 input logic [2:0] 		adr,	//Address
			 input logic [4:0] 		value,
			 output logic [4:0] 	tens_mem_1, ones_mem_1, arithmetic, tens_mem_2, ones_mem_2,
			 output logic [2:0] 	adr_next);
			 
	logic [4:0] mem [2**3-1:0];	//No clue what this is
	
	always_ff @(posedge clk_manual, negedge reset_n)
		if (!reset_n)
			mem <= {mem[6:0], 7'b0};
		else if (we) 
			begin
				mem [adr] <= value;
				adr_next <= adr_next + 1;
			end
		else
			adr_next <= adr;

assign tens_mem_1 = mem[3'b000];
assign ones_mem_1 = mem[3'b001];
assign arithmetic = mem[3'b010];
assign tens_ones_2= mem[3'b011];
assign ones_mem_2 = mem[3'b100];
	
endmodule