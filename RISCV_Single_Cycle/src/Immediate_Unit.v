/******************************************************************
* Description
*	This module performs a sign extension operation that is need with
*	in instruction like andi and constructs the immediate constant.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module Immediate_Unit
(   
	input [2:0] op_i,
	input [24:0]  Instruction_bus_i,
   output reg [31:0] Immediate_o
);
	localparam R_TYPE = 3'h0;
	localparam I_TYPE = 3'h1;
	localparam S_TYPE = 3'h2;
	localparam B_TYPE = 3'h3;
	localparam U_TYPE = 3'h4;
	localparam J_TYPE = 3'h5;

	always@(op_i or Instruction_bus_i) begin
		case(op_i)
			I_TYPE: Immediate_o = {{20{Instruction_bus_i[24]}},Instruction_bus_i[24:13]};// I format
			S_TYPE: Immediate_o = {{20{Instruction_bus_i[24]}},Instruction_bus_i[24:18],Instruction_bus_i[4:0]};// I format
			B_TYPE: Immediate_o = {{19{Instruction_bus_i[24]}},{Instruction_bus_i[24]},{Instruction_bus_i[0]},{Instruction_bus_i[23:18]},{Instruction_bus_i[4:1]},1'b0};
			U_TYPE: Immediate_o = {Instruction_bus_i[24:5],{12{1'b0}}};
			J_TYPE: Immediate_o = {{13{Instruction_bus_i[24]}},{Instruction_bus_i[12:5]},{Instruction_bus_i[13]},{Instruction_bus_i[23:14]},{1'b0}};
			default:Immediate_o = 32'h0ff0ff00;// U format
		endcase
	end
endmodule // signExtend
