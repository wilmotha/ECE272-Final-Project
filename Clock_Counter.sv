module clock_counter(
  input logic clk_i,	// the clock driving the counter
  input logic reset_n,		// active low reset	
  
  output logic clk_o,
  output logic clock_1Hz
  ); 

  logic [20:0] count;

  always_ff@(posedge clk_i, negedge reset_n)
    if   (!reset_n)	count <= 0;
    else 	   	count <= count + 1;

  assign clk_o = count[10];
  assign clock_1Hz = count[17]; 

endmodule