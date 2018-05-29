module math(input logic [4:0] num000, num001, num011, num100,
			input logic [4:0] arithmetic,
			input logic enable,
			output logic [13:0] total
			);
			logic [6:0] num_1;
			logic [6:0] num_2;
			
			assign num_1 = num000*10 + num001;
			assign num_2 = num011*10 + num100;
			always_comb
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
endmodule		

			