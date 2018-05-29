module mux4 ( 	input logic [2:0] num_state,
				input logic [2:0] s,
				output logic [3:0] y);
				
	//Changed this to be wires inside the module, because we will acess the value
	//	of each digit from the memory
	logic [3:0] thous;
	logic [3:0] hundr;
	logic [4:0] tens;
	logic [4:0] ones;
	
	logic [2:0] adr;
	logic [2:0] adr_next;

always_comb
	if(num_state == 3'b000) 
		begin
			adr = 3'b000;
			
			thous = 11;							//Makes the Decoder.sv output all 1's to the seven seg (nothing is displayed)
			hundr = 11;							//Same as above 
			//tens = ram( 0, 1, 0, 3'b000, 0, tens);		//Access the frist address in the memory (look at the ram module to understand the random 0's and 1's)
			//ones = ram( 0, 1, 0, 3'b001, 0, ones);		//Access the second address in the memory
		end
	else if (num_state == 3'b011)
		begin
			adr = 3'b011;
			
			thous = 11;
			hundr = 11;
			//tens = ram( 0, 1, 0, 3'b011, 0, tens);
			//ones = ram( 0, 1, 0, 3'b100, 0, ones);
		end
	//else if (num_state == 3'b100)
		//ADD math modules
		
		
	ram memory(.clk_manual(0),
					.reset_n(1),
					.we(0), 
					.adr(adr), 
					.value( ), 
					.dout(tens), 
					.adr_next( ));
					
	ram memory_1(.clk_manual(0),
					.reset_n(1),
					.we(0), 
					.adr(adr), 
					.value( ), 
					.dout(ones), 
					.adr_next( ));
  
		
				
	//default multiplexer that ouputs to the Decoder.sv
always_comb
	begin
		case(s)
			0: y = ones;
			1: y = tens;
			3: y = hundr;
			4: y = thous;
			default: y = ones;
		endcase
	end
		
endmodule
