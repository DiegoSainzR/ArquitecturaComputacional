/******************************************************************
* Description
*	This is control unit for the RISC-V Microprocessor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction bus.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module Control
(
	input [6:0]OP_i,
	
	output [1:0] Jump_Type_o,
	output Mem_Read_o,
	output Mem_Write_o,
	output Reg_Write_o,
	output ALU_Src_Or_Imm_o,
	output ALU_Main_Val_o,
	output [2:0]ALU_Op_o,
	output [2:0]Imm_type_o
);

localparam R_TYPE = 7'h33;
localparam I_TYPE = 7'h13;
localparam U_TYPE = 7'h37;
localparam B_TYPE = 7'h63;
localparam J_TYPE = 7'h6f;
localparam I_JAL  = 7'h67;

localparam S_TYPE = 7'h23;
localparam I_LOAD = 7'h03;

reg [14:0] control_values;

always@(OP_i) begin
	case(OP_i)//                      cba_98_76_5_43_210
		R_TYPE: control_values <= 13'b 000_00_10_0_00_000;
		I_TYPE: control_values <= 13'b 001_00_10_0_01_001;
		U_TYPE: control_values <= 13'b 100_00_10_0_11_100;
		
		B_TYPE: control_values <= 13'b 011_01_00_0_00_101;
		J_TYPE: control_values <= 13'b 101_10_10_0_00_000;
		I_JAL:  control_values <= 13'b 001_11_10_0_00_000;
		
		S_TYPE: control_values <= 13'b 010_00_00_1_01_110;
		I_LOAD: control_values <= 13'b 001_00_11_0_01_110;
		
		default: control_values<= 13'b 111_00_00_0_00_000;
		endcase
end	

assign Imm_type_o = control_values[12:10];

assign Jump_Type_o = control_values[9:8];

assign Reg_Write_o = control_values[7];

assign Mem_Read_o = control_values[6];

assign Mem_Write_o = control_values[5];

assign ALU_Main_Val_o = control_values[4];

assign ALU_Src_Or_Imm_o = control_values[3];

assign ALU_Op_o = control_values[2:0];	

endmodule


