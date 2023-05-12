/******************************************************************
* Description
*	This is the control unit for the ALU. It receves a signal called 
*	ALUOp from the control unit and signals called funct7 and funct3  from
*	the instruction bus.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module ALU_Control
(
	input funct7_i, 
	input [2:0] ALU_Op_i,
	input [2:0] funct3_i,
	output [3:0] ALU_Operation_o

);
	localparam R_TYPE_ADD = 7'b0_000_000;
	localparam I_TYPE_ADDI = 7'bx_001_000;
	localparam ADD = 4'b0_000;
	
	localparam R_TYPE_SUB = 7'b1_000_000;
	localparam SUB = 4'b1_000;
	
	localparam R_TYPE_SLL = 7'b0_000_001;
	localparam I_TYPE_SLLI = 7'bx_001_001;
	localparam SLL = 4'b0_001;
	
	localparam R_TYPE_XOR = 7'b0_000_100;
	localparam I_TYPE_XORI = 7'bx_001_100;
	localparam XOR = 4'b0_100;
	
	localparam R_TYPE_SRL = 7'b0_000_101;
	localparam I_TYPE_SRLI = 7'bx_001_101;
	localparam SRL = 4'b0_101;
	
	localparam R_TYPE_OR = 7'b0_000_110;
	localparam I_TYPE_ORI = 7'bx_001_110;
	localparam OR = 4'b0_110;
	
	localparam R_TYPE_AND = 7'b0_000_111;
	localparam I_TYPE_ANDI = 7'bx_001_111;
	localparam AND = 4'b0_111;
	
	localparam U_TYPE_LUI = 7'bx_100_xxx;
	localparam LUI = 4'b0_000;
	
	localparam B_TYPE_BEQ = 7'bx_101_xxx;
	localparam BEQ = 4'b1_000;
	
	localparam SL_TYPE_SWLW = 7'bx_110_xxx;
	localparam SWLW = 4'b0_000;
	
	reg [3:0] alu_control_values;
	wire [6:0] selector;
	
	assign selector = {funct7_i, ALU_Op_i, funct3_i};
	
	always@(selector)begin
		casex(selector)
			R_TYPE_ADD: alu_control_values = ADD;
			R_TYPE_SUB: alu_control_values = SUB;
			R_TYPE_OR:  alu_control_values = OR;
			R_TYPE_SRL: alu_control_values = SRL;
			R_TYPE_SLL: alu_control_values = SLL;
			R_TYPE_AND: alu_control_values = AND;
			R_TYPE_XOR: alu_control_values = XOR;
			
			I_TYPE_ADDI: alu_control_values = ADD;
			I_TYPE_ORI:  alu_control_values = OR;
			I_TYPE_SRLI: alu_control_values = SRL;
			I_TYPE_SLLI: alu_control_values = SLL;
			I_TYPE_ANDI: alu_control_values = AND;
			I_TYPE_XORI: alu_control_values = XOR;
			
			U_TYPE_LUI: alu_control_values = LUI;
			
			B_TYPE_BEQ: alu_control_values = BEQ;
			
			SL_TYPE_SWLW:  alu_control_values = SWLW;
			
			default: alu_control_values = 4'b1_111;
		endcase
	end
	
	
	assign ALU_Operation_o = alu_control_values;



endmodule
