module mux4 ( 	input logic clk_manual,
				input logic reset_n,
				output logic enable );
			
always_ff @ (posedge clk_manual, negedge reset_n)
	begin
		if(!reset_n)
			enable = 0;
		else
			enable = 1;	
	end
endmodule
