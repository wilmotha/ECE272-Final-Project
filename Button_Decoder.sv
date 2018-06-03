
module Button_Decoder(input logic [15:0] buttons,
					  output logic [4:0] value);
				
	//logic [15:0] button = ~buttons;


always_comb
	begin
		case(buttons)
			16'b1111_1111_1111_1110:	value = 1;//1
			16'b1111_1111_1111_1101:	value = 2;//2
			16'b1111_1111_1111_1011:	value = 3;//3
			16'b1111_1111_1111_0111:	value = 4;//4
			16'b1111_1111_1110_1111:	value = 5;//5
			16'b1111_1111_1101_1111:	value = 6;//6
			16'b1111_1111_1011_1111:	value = 7;//7
			16'b1111_1111_0111_1111:	value = 8;//8
			16'b1111_1110_1111_1111:	value = 9;//9
			16'b1111_1101_1111_1111:	value = 10;//0
			16'b1111_1011_1111_1111:	value = 11;//plus
			16'b1111_0111_1111_1111:	value = 12;//subtraction
			16'b1110_1111_1111_1111:	value = 13;//multiplication
			16'b1101_1111_1111_1111:	value = 14;//division
			16'b1011_1111_1111_1111:	value = 15;//enter/equals
			16'b0111_1111_1111_1111:	value = 16;//reset
			
			default: value = 0;
			
		endcase		
		
	end
endmodule
