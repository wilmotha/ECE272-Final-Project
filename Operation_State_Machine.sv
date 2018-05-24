module Operation_State_Machine(input logic clk_manual,
					input logic reset_n,
					input logic reset,
					output logic[2:0] num_state);

logic [2:0] state_n; //next state
		
	//each possible value of the state register is given a unique name for easier use later
	parameter S0 = 3'b000; //First Number
	parameter S1 = 3'b001; //Arithmatic Operator
	parameter S2 = 3'b011; //Second Number
	parameter S3 = 3'b100; //Result

// state register
always_ff @(posedge clk, negedge reset_n)
	if (!reset_n) 
		num_state <= S0;
	else 
		num_state <= state_n;
// next state logic
always_comb
	case (state)
		S0: state_n = S1;
		S1: state_n = S2;
		S2: state_n = S3;
		S3:	state_n = S0;
				
		default: state_n = S0;
		
	endcase
	
// output logic
assign num_state = state;

endmodule