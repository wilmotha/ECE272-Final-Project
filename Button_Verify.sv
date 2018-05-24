module Button_Verify(input [2:0] state,
					 input  logic value[4:0],
					 input logic [2:0] adr_current,
					 output logic [2:0] adr_next,
					 output logic clk_manual);
					 
always_comb
	if (state == 3'b011 && value == 16 && adr_current == 4)	//if all values are in the memory, and enter was pressed advance to the result state.
		clk_manual = TRUE;
	else if (state == 3'b000 || state == 3'b011)			//if we are in the first/second set of number state
		begin 
		if (value >= 0 && value <= 10)
			begin
				if(adr_current == 1)    						//if the address in the memory already has both numbers, go to the arithmatic state
					begin
						clk_manual = TRUE;
						value = ram( 1, 1, 1, adr_current, value, value);	
					end
				else 
					value = ram( 1, 1, 1, adr_current, value, value);	
			
				adr_next = adr_current + 1; 			//else increment the address so we take in the second number value
			end
		end	
	else if (state == 3'b001)
		if (value > 10 && adr_current == 2)					//if we have the right input, and we are looking at the correct address
			begin
				clk_manual = TRUE;
				value = ram( 1, 1, 1, adr_curernt, value, value);	
				adr_next = adr_current + 1;
			end
endmodule