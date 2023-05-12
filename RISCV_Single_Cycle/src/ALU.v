/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add

* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module ALU 
(
	input [3:0] ALU_Operation_i,
	input signed [31:0] A_i,
	input signed [31:0] B_i,
	output reg Zero_o,
	output carry_o,
	output [31:0] ALU_Result_o
);

	localparam ADD = 4'b0_000;
	localparam SUB = 4'b1_000;
	localparam SLL = 4'b0_001;
	localparam SRL = 4'b0_101;
	localparam OR = 4'b0_110;
	localparam AND = 4'b0_111;
	localparam XOR = 4'b0_100;
	
	reg [32:0] result_plus_carry_w;
	wire [31:0] comp2_B;
	
	assign comp2_B = ~B_i+1;
   
   always @ (A_i or B_i or comp2_B or ALU_Operation_i or result_plus_carry_w) begin
		case (ALU_Operation_i)
			ADD: result_plus_carry_w <= A_i + B_i;
			SUB: result_plus_carry_w <= A_i + comp2_B;
			OR:  result_plus_carry_w <= A_i | B_i;
			XOR: result_plus_carry_w <= A_i ^ B_i;
			SLL: result_plus_carry_w <= A_i << B_i[4:0];
			SRL: result_plus_carry_w <= A_i >> B_i[4:0];
			AND: result_plus_carry_w <= A_i & B_i;
			default:
				result_plus_carry_w <= 32'h0ff0ff00;
		endcase 
		Zero_o = (result_plus_carry_w[31:0] == 0) ? 1'b1 : 1'b0;
	end 
	assign carry_o = result_plus_carry_w[32];
	assign ALU_Result_o = result_plus_carry_w[31:0];
endmodule // ALU