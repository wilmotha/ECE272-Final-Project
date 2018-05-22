module parser (input logic [7:0] b,
					output logic [3:0] thous,
					output logic [3:0] hunds,
					output logic [3:0] tens,
					output logic [3:0] ones);
					
		always_comb
			begin
				ones = (b % 10);
				tens = (b / 10) % 10;
				hunds = (b /100) % 100;
				thous = (b /1000) % 1000;
			end

endmodule