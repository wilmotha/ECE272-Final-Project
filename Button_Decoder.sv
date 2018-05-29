
module Button_Decoder(input logic [15:0] buttons,
					  output logic [4:0] value);
					  
always_comb
		case(~buttons)
			1:		value = 1;
			2:		value = 2;
			4:		value = 3;
			8:		value = 4;
			16:		value = 5;
			32:		value = 6;
			64:		value = 7;
			128:	value = 8;
			256:	value = 9;
			512:	value = 10;
			1024:	value = 11;
			2048:	value = 12;
			4096:	value = 13;
			8192:	value = 14;
			16384:	value = 15;
			32768:	value = 16;
			
			default: value = 0;
			
		endcase		
		
endmodule
