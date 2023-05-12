module PC_control
#(
	parameter N = 32
)(
	input condicion_i,
	input [1:0]Jump_Type_i,
	input [N-1:0] current_pc_i,
	input [N-1:0] branch_jump_addr_i,
	input [N-1:0] immedite_i,
	output reg [N-1:0] next_pc_o,
	output [N-1:0] pc_plus_4_o
);
	reg [N-1:0] operator_holder;
	wire [N-1:0] sum_holder;
	wire [N-1:0] pc_plus_4_w; 
	
	
	reg pc_next_val_selector;
	
	always @* begin
		case(Jump_Type_i)
			2'b11: operator_holder <= branch_jump_addr_i;
			default: operator_holder <= current_pc_i;
		endcase
	end
	
	Adder_32_Bits
	PC_PLUS_4
	(
		.Data0(current_pc_i),
		.Data1(4),
		.Result(pc_plus_4_w)
	);
	
	Adder_32_Bits
	TARGET_PLUS_IMM
	(
		.Data0(operator_holder),
		.Data1(immedite_i),
		.Result(sum_holder)
	);
	
	always @*begin
		case(Jump_Type_i)	
			2'b00: next_pc_o <= pc_plus_4_w;
			2'b01: begin
				if(condicion_i==1'b1)
					next_pc_o <= sum_holder;
				else
					next_pc_o <= pc_plus_4_w;
			end
			default: next_pc_o <= sum_holder;
		endcase
	end
	
	assign pc_plus_4_o = pc_plus_4_w;
endmodule