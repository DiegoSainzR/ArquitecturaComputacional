module Multiplexer_4_to_1
#(
	parameter NBits = 32
)
(
	input [1:0] Selector_i,
	input [NBits-1:0] Mux_Data_0_i,
	input [NBits-1:0] Mux_Data_1_i,
	input [NBits-1:0] Mux_Data_2_i,
	input [NBits-1:0] Mux_Data_3_i,
	
	output reg [NBits-1:0] Mux_Output_o

);

	always@(Selector_i ,Mux_Data_1_i ,Mux_Data_0_i) begin
		case(Selector_i)
			2'h0: Mux_Output_o <= Mux_Data_0_i;
			2'h1: Mux_Output_o <= Mux_Data_1_i;
			2'h2: Mux_Output_o <= Mux_Data_2_i;
			2'h3: Mux_Output_o <= Mux_Data_3_i;
		endcase
	end

endmodule