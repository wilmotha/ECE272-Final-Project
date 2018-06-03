module Operation_State_Machine(input logic clk_manual,
					input logic reset_n,
					/*output logic clk,*/
					output logic[2:0] num_state);

logic [2:0] state_n; //next state
		
	//each possible value of the state register is given a unique name for easier use later
	parameter S0 = 3'b000; //First Number
	parameter S1 = 3'b001; //Arithmatic Operator
	parameter S2 = 3'b011; //Second Number
	parameter S3 = 3'b100; //Result

// state register
always_ff @(posedge clk_manual, negedge reset_n)
	if (!reset_n) 
		begin
			num_state <= S0;
			//clk <= 0;
		end
	else 
		begin
			num_state <= state_n;
			//clk <= 0;
		end
// next state logic
always_comb
	case (num_state)
		S0: state_n = S1;
		S1: state_n = S2;
		S2: state_n = S3;
		S3:	state_n = S0;
				
		default: state_n = S0;
		
	endcase

endmodule