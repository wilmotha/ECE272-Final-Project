module Parser ( input logic [7:0] num,
				output logic [3:0] z0, z1, z2, z3);
	//always_comb begin
	assign z0 = num % 10;
	assign z1 = (num / 10) % 10;
	assign z2 = (num / 100) % 10;
	assign z3 = (num / 1000) % 10;
	
endmodule