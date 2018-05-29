module mux4 ( 	input logic [4:0] tens_mem_1, ones_mem_1, tens_mem_2, ones_mem_2,
				input logic [2:0] num_state,
				input logic [4:0] arithmetic,
				output logic [3:0] thous,
				output logic [3:0] hundr,
				output logic [4:0] tens,
				output logic [4:0] ones );
			

	logic [13:0] total;
	logic enable_math;
	
always_comb
	if(num_state == 3'b000) 
		begin			
			thous = 11;							//Makes the Decoder.sv output all 1's to the seven seg (nothing is displayed)
			hundr = 11;							//Same as above 
			tens = tens_mem_1;
			ones = ones_mem_1;
			enable_math = 0;
			
		end
	else if (num_state == 3'b010)
		begin
			thous = 11;
			hundr = 11;
			tens = tens_mem_2;
			ones = ones_mem_2;
			enable_math = 0;
		end
	else if (num_state == 3'b011)
		begin
			enable_math = 1;
		end
			math doMath(
				.num000(tens_mem_1)
				.num001(ones_mem_1),
				.num011(tens_mem_2),
				.num100(ones_mem_2),
				.arithmetic(arithmetic),
				.enable(enable_math),
			
				.total(total)
				
				);
				
				Paser splitNum (
				.num(total),
				.enable(enable_math),
				.z0(thous),
				.z1(hundr),
				.z2(tens),
				.z3(ones) );
	
endmodule
