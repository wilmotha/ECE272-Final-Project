//default multiplexer that ouputs to the Decoder.sv
module mux2 ( 	input logic [3:0] thous,
				input logic [3:0] hundr,
				input logic [4:0] tens,
				input logic [4:0] ones,
				input logic [2:0] s,
				output logic [3:0] y);
				
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
