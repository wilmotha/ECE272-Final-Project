
module Button_Decoder(input logic [15:0] buttons,
					  output logic [4:0] value);
				
	logic [15:0] button = ~buttons;


always_comb
		case(button)
			1:		value = 1;//1
			2:		value = 2;//2
			4:		value = 3;//3
			8:		value = 4;//4
			16:		value = 5;//5
			32:		value = 6;//6
			64:		value = 7;//7
			128:	value = 8;//8
			256:	value = 9;//9
			512:	value = 10;//0
			1024:	value = 11;//plus
			2048:	value = 12;//subtraction
			4096:	value = 13;//multiplication
			8192:	value = 14;//division
			16384:	value = 15;//enter/equals
			32768:	value = 16;//reset
			
			default: value = 0;
			
		endcase		
		
endmodule
