module Button_Decoder(input  logic buttons[15:0],
					  output logic value[4:0]);
	
	assign buttons = ~buttons
	
	always_comb
	case(buttons)
		1:		value = 1;
		2:		value = 2;
		4:		value = 3;
		8:		value = 4;
		16:		value = 5;
		32:		value = 6;
		64:		value = 7;
		128:	value = 8;
		256:	value = 9;
		512:	value = 10;//0
		1024:	value = 11;//add
		2048:	value = 12;//subtract
		4096:	value = 13;//multiplication
		8192:	value = 14;//division
		16384:	value = 15;//enter
		32768:	value = 16;//reset
		default: value = 0;
	endcase
endmodule