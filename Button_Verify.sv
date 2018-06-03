module Button_Verify(input [2:0] num_state,
					 input logic reset_n,
					 input logic [4:0] value,
					 input logic [2:0] adr_current,
					 input logic [4:0] tens_mem_1, ones_mem_1, arith, tens_mem_2, ones_mem_2,
					 output logic clk_manual,
					 output logic [2:0] adr, state,
					 output logic [4:0] tens_1, ones_1, arithmetic, tens_2, ones_2);
					
				
logic dont_continue;
	 
always_comb
	begin
		if(!reset_n || value == 16)
			begin
				tens_1 = 0;
				ones_1 = 0;
				arithmetic = 0;
				tens_2 = 0;
				ones_2 = 0;
				adr = 0;
				clk_manual = 0;
				state = 3'b000;
			end
		else if (num_state == 3'b010 && value == 15 && adr_current == 4)	//if all values are in the memory, and enter was pressed advance to the result state.
			begin
				state = 3'b011; clk_manual = 1;
			end
		else if (num_state == 3'b000 || num_state == 3'b010)			//if we are in the first/second set of number state 
			begin
			if (value > 0 && value <= 10)
				begin
					case(adr_current)    						//if the address in the memory already has both numbers, go to the arithmatic state
						0: begin
								tens_1 = value; 
								adr = 1;

								dont_continue = 1;
						   end
						1: begin 
								if(dont_continue)
									dont_continue = 0;
								else
									begin
										ones_1 = value; 
										tens_1 = tens_mem_1; 
										state = 3'b001; 
										adr = 2;
									end
						   end
						3: begin 
								tens_2 = value; 
								arithmetic = arith; 
								ones_1 = ones_mem_1; 
								tens_1 = tens_mem_1; 
								adr = 4;
								
								dont_continue = 1;
						   end
						4: begin 
								if(dont_continue)
									dont_continue = 0;
								else
									begin
										ones_2 = value; 
										tens_2 = tens_mem_2; 
										arithmetic = arith; 
										ones_1 = ones_mem_1; 
										tens_1 = tens_mem_1;
									end
						   end	
						default: ;
					endcase
				end
			end
		else if (num_state == 3'b001)
			begin
			if (value > 10 && value < 15 &&  adr_current == 2)					//if we have the right input, and we are looking at the correct address
				begin
					state = 3'b010;
					arithmetic = value;
					ones_1 = ones_mem_1; 
					tens_1 = tens_mem_1;
					adr = 3;
				end
			end
		else
			begin
				ones_2 = ones_mem_2; 
				tens_2 = tens_mem_2; 
				arithmetic = arith; 
				ones_1 = ones_mem_1; 
				tens_1 = tens_mem_1;
			end
				
	end
endmodule