/******************************************************************
* Description
*	This is the top-level of a RISC-V Microprocessor that can execute the next set of instructions:
*		add
*		addi
* This processor is written Verilog-HDL. It is synthesizabled into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be executed. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module RISC_V_Single_Cycle
#(
	parameter PROGRAM_MEMORY_DEPTH = 1024,	// Modificado de parameter PROGRAM_MEMORY_DEPTH = 64,
	parameter DATA_MEMORY_DEPTH = 256		// Modificado de parameter DATA_MEMORY_DEPTH = 128
)

(
	// Inputs
	input clk,
	input reset
	

);
//******************************************************************/
//******************************************************************/

//******************************************************************/
//******************************************************************/
/* Signals to connect modules*/

/**Control**/
wire alu_src_imm_w;	// Modificado de wire alu_src_w;
wire alu_src_zero_w;	// Agregado
wire reg_write_w;
//wire mem_to_reg_w;	// Falta
wire mem_write_w;
wire mem_read_w;
wire [2:0] alu_op_w;
wire [1:0] Jump_Type_w; // Agregado

/** Program Counter**/
wire [31:0] pc_plus_4_w;
wire [31:0] pc_w;


/**Register File**/
wire [31:0] read_data_1_w;
wire [31:0] read_data_2_w;

/**Inmmediate Unit**/
wire [31:0] immediate_data_w;

/**ALU**/
wire [31:0] alu_result_w;

/**Multiplexer MUX_DATA_OR_IMM_FOR_ALU**/
wire [31:0] read_data_2_or_imm_w;

/**Multiplexer MUX_ZERO_OR_DATA_FOR_ALU**/
wire [31:0] read_data_1_or_cero_w;	// Agregado

/**ALU Control**/
wire [3:0] alu_operation_w;

/**Instruction Bus**/	
wire [31:0] instruction_bus_w;

/**Wire from pc mux**/
wire [31:0] pc_next_val_with_branch_w;	// Agregado

/**wire from mux to reg write**/
wire [31:0] reg_write_holder_w;	// Agregado

/*imm type deco*/
wire [2:0] imm_type_w;	// Agregado

/*branch*/ 
wire zero_w;
wire carry_w;
wire condition_true;	// Agregado


/*memory wire*/
wire [31:0] memo_output_w;	// Agregado

//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
CONTROL_UNIT
(
	/****/
	.OP_i(instruction_bus_w[6:0]),
	/** outputus**/
	.ALU_Op_o(alu_op_w),
	.ALU_Src_Or_Imm_o(alu_src_imm_w),	// Agregado
	.ALU_Main_Val_o(alu_src_zero_w),		// Modificado de 
	.Reg_Write_o(reg_write_w),				// Agregado
	//.Mem_to_Reg_o(mem_to_reg_w),		// Modificado
	.Mem_Read_o(mem_read_w),
	.Mem_Write_o(mem_write_w),
	.Imm_type_o(imm_type_w),				// Agregado
	.Jump_Type_o(Jump_Type_w)				// Agregado
);



Program_Memory
#(
	.MEMORY_DEPTH(PROGRAM_MEMORY_DEPTH)
)
PROGRAM_MEMORY
(
	.Address_i(pc_w),
	.Instruction_o(instruction_bus_w)
);

// Instancia del PC Register
PC_Register		// Agregado
PROGRAM_COUNTER(
	.clk(clk),
	.reset(reset),
	.Next_PC(pc_next_val_with_branch_w),	// Modificado de .Next_PC(pc_plus_4_w),
	.PC_Value(pc_w)
);


//Adder_32_Bits	// Se sustituyo por pc_next_val_with_branch
//PC_PLUS_4
//(
//	.Data0(pc_w),
//	.Data1(4),
//	
//	.Result(pc_plus_4_w)
//);


// DE AQUI PARA ACA TODO ES AGREGADO
PC_control
PC_CONTROL(
	.condicion_i(condition_true),
	.Jump_Type_i(Jump_Type_w),
	.current_pc_i(pc_w),
	.branch_jump_addr_i(read_data_1_w),
	.immedite_i(immediate_data_w),
	.next_pc_o(pc_next_val_with_branch_w),
	.pc_plus_4_o(pc_plus_4_w)
);



Data_Memory#(
	.DATA_WIDTH(32),
	.MEMORY_DEPTH(DATA_MEMORY_DEPTH)
)
DATA_MEMORY_UNIT(
	.clk(clk),
	.Mem_Write_i(mem_write_w),
	.Mem_Read_i(mem_read_w),
	.Write_Data_i(read_data_2_w),
	.Address_i(alu_result_w),
	//outputs
	.Read_Data_o(memo_output_w)	// Agregado
);


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/



Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.Reg_Write_i(reg_write_w),
	.Write_Register_i(instruction_bus_w[11:7]),
	.Read_Register_1_i(instruction_bus_w[19:15]),
	.Read_Register_2_i(instruction_bus_w[24:20]),
	.Write_Data_i(reg_write_holder_w),
	.Read_Data_1_o(read_data_1_w),
	.Read_Data_2_o(read_data_2_w)
);




Immediate_Unit
IMM_UNIT
(  .op_i(imm_type_w),	// Modificado de .op_i(instruction_bus_w[6:0]),
   .Instruction_bus_i(instruction_bus_w[31:7]), // Modificado de .Instruction_bus_i(instruction_bus_w),
   .Immediate_o(immediate_data_w)
);



Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_DATA_OR_IMM_FOR_ALU
(
	.Selector_i(alu_src_imm_w),
	.Mux_Data_0_i(read_data_2_w),
	.Mux_Data_1_i(immediate_data_w),
	
	.Mux_Output_o(read_data_2_or_imm_w)
);



ALU_Control
ALU_CONTROL_UNIT
(
	.funct7_i(instruction_bus_w[30]),
	.ALU_Op_i(alu_op_w),
	.funct3_i(instruction_bus_w[14:12]),
	.ALU_Operation_o(alu_operation_w)

);



ALU
ALU_UNIT
(
	.ALU_Operation_i(alu_operation_w),
	.A_i(read_data_1_or_cero_w),		// Modificado de .A_i(read_data_1_w),
	.B_i(read_data_2_or_imm_w),
	.ALU_Result_o(alu_result_w),
	.Zero_o(zero_w),						// Agregado
	.carry_o(carry_w)						//	Agregado
);


// DE AQUI PARA ACA TODO ES AGREGADO

Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_DATA_OR_ZERO_FOR_ALU
(
	.Selector_i(alu_src_zero_w),
	.Mux_Data_0_i(read_data_1_w),
	.Mux_Data_1_i({32'h00000000}),
	.Mux_Output_o(read_data_1_or_cero_w)
);



Multiplexer_4_to_1
#(
	.NBits(32)
)
MUX_PC_OR_ALU_TO_REG
(
	.Selector_i({mem_read_w, Jump_Type_w[1]}),
	.Mux_Data_0_i(alu_result_w),
	.Mux_Data_1_i(pc_plus_4_w),
	.Mux_Data_2_i(memo_output_w),
	.Mux_Output_o(reg_write_holder_w)
);

Branch_Control
BRANCH_CONTROL(
	.zero_i(zero_w),
	.carry_i(carry_w),
	.func3(instruction_bus_w[14:12]),
	.condition_is_true_i(condition_true)
);

endmodule

