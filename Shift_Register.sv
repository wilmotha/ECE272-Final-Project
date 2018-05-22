module shiftreg #(parameter N = 5)
				 (input logic 			clk,
				  input logic 			reset, load,
				  input logic 			sin,
				  input logic [N–1:0] 	value,
				  output logic [N–1:0] 	q,
				  output logic 			sout);
					
if(value != 0)					
	always_ff @(posedge clk, posedge reset)
		if (reset) 
			q <= 0;
		else if (load) 
			q <= d;
		else 
			q <= {q[N–2:0], sin};
			
	assign sout = q[N–1];
else
	
endmodule
