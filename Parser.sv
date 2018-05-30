module Parser ( input logic [13:0] num,
				input logic enable,
				output logic [4:0] z0, z1, z2, z3);
				
	
	always_comb 
		begin
			if(enable)
				z0 = num % 10;
				z1 = (num / 10) % 10;
				z2 = (num / 100) % 10;
				z3 = (num / 1000) % 10;
		end
endmodule