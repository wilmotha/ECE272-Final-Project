module math(input logic [4:0] num000, num001, num011, num100,
			input logic [2:0] num_state,
			input logic [4:0] arithmetic,
			input logic enable,
			output logic [13:0] total
			);
			logic [6:0] num_1;
			logic [6:0] num_2;
			
			assign num_1 = num000*10 + num001;
			assign num_2 = num011*10 + num100;
			
	always_comb
		begin
			if(enable == 1)
				begin
				if(arithmetic == 11)
					begin
						total = num_1 + num_2;
					end
				else if(arithmetic == 12)
					begin
						total = num_1 - num_2;
					end
				else if(arithmetic == 13)
					begin
						total = num_1 * num_2;
					end
				else if(arithmetic == 14)
					begin
						total = num_1 / num_2;
					end
				end
			else if (enable == 0)
				begin
					if(num_state == 3'b000 || num_state == 3'b001) 		
						total = num_1;
					else if (num_state == 3'b010)
						total = num_2;
					
					//total = num_1 * 100 + num_2;
				end
			else
				begin
				end
		end
			
			
endmodule		

			