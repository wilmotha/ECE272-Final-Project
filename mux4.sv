module mux4 ( 	input logic [4:0] tens_mem_1, ones_mem_1, tens_mem_2, ones_mem_2,
				input logic [2:0] num_state,
				input logic [4:0] arithmetic,
				output logic enable );
			

	logic [13:0] total;
	
always_comb
	if(num_state == 3'b000) 			
			enable = 0;	
	else if (num_state == 3'b010)
			enable = 0;
	else if (num_state == 3'b011)
			enable = 1;	
endmodule
