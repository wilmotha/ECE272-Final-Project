module clock_counter(
	input logic clk_i,		//often, "tags" are added to variables to denote what they do for the user
	input logic reset_n,	//here, 'i' is used for input and 'o' for the output, while 'n' specifies
												//an active low signal ("not")
	output logic clk_o);

		logic [16:0] count;	//register stores the counter value so that it can be modified
					//on a clock edge. Register size needs to store as large of a
					//number as the counter reaches. Here, 2^(16+1) = 131,072.

		always_ff @ (posedge clk_i, negedge reset_n)
			begin
				count <= count + 1;	//at every positive edge, the counter is increased by 1
				if(!reset_n) //If reset_n gets pulled to ground (active low), reset count to 0
					begin
						clk_o <= 0;
						count <= 0;
					end
				else
					if(count >= 100) //Flips the slow clock every 100000 clock cycles
						begin
							clk_o <= ~clk_o;	//Flip slow clock
							count <= 0;			//Reset the counter
						end
			end
endmodule
