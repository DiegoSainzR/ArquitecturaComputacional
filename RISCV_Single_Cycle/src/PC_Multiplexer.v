module PC_Multiplexer
#(
	parameter N = 32
)(
	input [0:0] condition_i,
	input [0:0] enable_i,
	input [N-1:0] pc_plus_4_i,
	input [N-1:0] branch_jump_addr_i,
	output [N-1:0] result_o
);
	
	assign result_o = pc_plus_4_i;
endmodule