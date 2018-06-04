module LED_top_module( 
	/**************************/
	/* Set inputs and outputs */
	/* to the whole FPGA here */
	/**************************/
	input wire reset_n,
	input wire [15:0] button,
	
	output logic [6:0] sevenseg,
	output logic [2:0] state);
		/*******************************/
		/* Set internal variables here */
		/*******************************/
		logic clk;		//used for the oscillator's 2.08 MHz clock
		logic clk_slow;	//used for slowed down, 5 Hz clock
		logic clk_manual;
		logic clk_manual_verify;
	
		logic [2:0] num_state; 	//look at Operation_State_Machine to understand this
		logic [2:0] adr;		//Adress in the memory
	
		logic enable;
		logic [13:0] total;
		logic [4:0] value;
		logic [4:0] muxToDec;
		
		logic [4:0] tens_mem_1;
		logic [4:0] ones_mem_1;
		logic [4:0] tens_mem_2;
		logic [4:0] ones_mem_2;
		logic [4:0] arithmetic;
		
		logic [4:0] thous;
		logic [4:0] hundr;
		logic [4:0] tens;
		logic [4:0] ones;
	
		/***********************/
		/* Define modules here */
		/***********************/	
	
		Button_Decoder button_press(
			.buttons(button), 
			
			.value(value));
	
		Button_Verify verify( 
			.num_state(num_state),
			.reset_n(reset_n),
			.clk_manual_verify(clk_manual_verify),
			.value(value),
			.adr_current(adr),
			.tens_mem_1(tens_mem_1),
			.ones_mem_1(ones_mem_1),
			.arith(arithmetic),
			.tens_mem_2(tens_mem_2),
			.ones_mem_2(ones_mem_2),
			
			
			
			.tens_1(tens_mem_1),
			.ones_1(ones_mem_1),
			.arithmetic(arithmetic),
			.tens_2(tens_mem_2),
			.ones_2(ones_mem_2),
			.state(num_state),
			.adr(adr),
			.clk_manual(clk_manual));
	
			
	mux4 which( 
			.clk_manual(clk_manual),
			.reset_n(reset_n),
			
			.enable(enable)
			);
	
	/*ram memory( 
			.clk_manual(clk_manual),
			.reset_n(reset_n),
			.we(we),
			.adr(adr),
			.value(value),

			.tens_mem_1(tens_mem_1),
			.ones_mem_1(ones_mem_1),
			.arithmetic(arithmetic),
			.tens_mem_2(tens_mem_2),
			.ones_mem_2(ones_mem_2),
			.adr_next(adr));*/
			
	mux2 test(
			.thous(thous),
			.hundr(hundr),
			.tens(tens),
			.ones(ones),
			.s(state),
			
			.y(muxToDec));
			
	math doMath(
				.num000(tens_mem_1),
				.num001(ones_mem_1),
				.num011(tens_mem_2),
				.num100(ones_mem_2),
				.num_state(num_state),
				.arithmetic(arithmetic),
				.enable(enable),
			
				.total(total)
				
				);
				
			Parser splitNum(
				.num(total),
				.enable(enable),
				.z0(thous),
				.z1(hundr),
				.z2(tens),
				.z3(ones) ); 
	
	/*
		Operation_State_Machine operation( 
			.clk_manual(clk_manual),
			.reset_n(reset_n),
			
			/*.clk(clk_manual),
			.num_state(num_state)); */
		
	
		
		decoder fin( 
			.data(muxToDec),
		
			.segments(sevenseg));
												

		
		//This is an instance of a special, built in module that accesses our chip's oscillator
		OSCH #("2.08") osc_int (	//"2.08" specifies the operating frequency, 2.08 MHz.
									//Other clock frequencies can be found in the MachX02's documentation
			.STDBY(1'b0),			//Specifies active state
			.OSC(clk),				//Outputs clock signal to 'clk' net
			.SEDSTDBY());			//Leaves SEDSTDBY pin unconnected*/
		
		
		//This module is instantiated from another file, 'Clock_Counter.sv'
		//It will take an input clock, slow it down based on parameters set inside of the module, and
		//output the new clock. Reset functionality is also built-in
		clock_counter counter_1(
			.clk_i(clk),
			.reset_n(reset_n),
			.clock_1Hz(clk_manual_verify),
			.clk_o(clk_slow));
			
		//This module is instantiated from another file, 'State_Machine.sv'
		//It contains a Moore state machine that will take a clock and reset, and output a state
		state_machine FSM_1(
			.clk_i(clk_slow),
			.reset_n(reset_n),
			.state(state));
			
		/************************************************/
		/* Add modules for:								*/
		/* Parser 		Determines the 1000's, 100's,   */
		/*				10's and 1's place of the number*/
		/* Multiplexer	Determines which parser output  */
		/*				to pass to the decoder			*/
		/* Decoder		Convert 4-bit binary to 7-seg   */
		/*				output for numbers 0-9			*/
		/************************************************/
endmodule
