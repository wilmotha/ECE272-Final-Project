module Button_Verify(input [2:0] num_state,
					 input logic [4:0] value,
					 input logic [2:0] adr_current,
					 output logic clk_manual,
					 output logic we);
					 
always_comb
	begin
		if (num_state == 3'b010 && value == 16 && adr_current == 4)	//if all values are in the memory, and enter was pressed advance to the result state.
			clk_manual = 1'b1;
		else if (num_state == 3'b000 || num_state == 3'b010)			//if we are in the first/second set of number state
			begin 
			if (value > 0 && value <= 10)
				begin
					if(adr_current == 1)    					//if the address in the memory already has both numbers, go to the arithmatic state
						clk_manual = 1'b1;	
				
					we = 1'b1;
				end
			end	
		else if (num_state == 3'b001)
			if (value > 10 && adr_current == 2)					//if we have the right input, and we are looking at the correct address
				begin
					clk_manual = 1'b1;
					we = 1'b1;	
				end
				
		clk_manual = 1'b0;
		we = 1'b0;
	end
endmodule