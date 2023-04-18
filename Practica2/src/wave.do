onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group main /RISC_V_Single_Cycle_TB/clk_tb
add wave -noupdate -group main /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate -group control /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/OP_i
add wave -noupdate -group control /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/ALU_Op_o
add wave -noupdate -group control -expand -group ctrl /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Jump_Type_o
add wave -noupdate -group control -expand -group ctrl /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Mem_Read_o
add wave -noupdate -group control -expand -group ctrl /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Mem_Write_o
add wave -noupdate -group control -expand -group ctrl /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Reg_Write_o
add wave -noupdate -group control -expand -group ctrl /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/ALU_Src_Or_Imm_o
add wave -noupdate -group control -expand -group ctrl /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/ALU_Main_Val_o
add wave -noupdate -group control -expand -group ctrl /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/ALU_Op_o
add wave -noupdate -group control -expand -group ctrl /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Imm_type_o
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/MUX_PC_OR_ALU_TO_REG/Mux_Output_o
add wave -noupdate -divider flow
add wave -noupdate -expand -group pc -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/PROGRAM_COUNTER/PC_Value
add wave -noupdate -expand -group pc /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/sum_holder
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/operator_holder
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/condicion_i
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/Jump_Type_i
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/immedite_i
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/current_pc_i
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/branch_jump_addr_i
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/pc_plus_4_o
add wave -noupdate -group pcCtrl /RISC_V_Single_Cycle_TB/DUV/PC_CONTROL/next_pc_o
add wave -noupdate -expand -group branchCtrl /RISC_V_Single_Cycle_TB/DUV/BRANCH_CONTROL/zero_i
add wave -noupdate -expand -group branchCtrl /RISC_V_Single_Cycle_TB/DUV/BRANCH_CONTROL/carry_i
add wave -noupdate -expand -group branchCtrl /RISC_V_Single_Cycle_TB/DUV/BRANCH_CONTROL/func3
add wave -noupdate -expand -group branchCtrl /RISC_V_Single_Cycle_TB/DUV/BRANCH_CONTROL/condition_is_true_i
add wave -noupdate -divider alu
add wave -noupdate -group aluCtrl /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/funct7_i
add wave -noupdate -group aluCtrl -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/ALU_Op_i
add wave -noupdate -group aluCtrl -radix binary /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/funct3_i
add wave -noupdate -group aluCtrl -radix binary /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/ALU_Operation_o
add wave -noupdate -group aluCtrl -radix binary /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/selector
add wave -noupdate -group alu /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Operation_i
add wave -noupdate -group alu /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/A_i
add wave -noupdate -group alu -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/B_i
add wave -noupdate -group alu /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/Zero_o
add wave -noupdate -group alu /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Result_o
add wave -noupdate -group immediate /RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/op_i
add wave -noupdate -group immediate /RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Instruction_bus_i
add wave -noupdate -group immediate -radix hexadecimal -childformat {{{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[31]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[30]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[29]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[28]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[27]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[26]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[25]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[24]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[23]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[22]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[21]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[20]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[19]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[18]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[17]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[16]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[15]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[14]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[13]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[12]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[11]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[10]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[9]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[8]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[7]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[6]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[5]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[4]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[3]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[2]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[1]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[0]} -radix unsigned}} -subitemconfig {{/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[31]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[30]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[29]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[28]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[27]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[26]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[25]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[24]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[23]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[22]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[21]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[20]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[19]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[18]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[17]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[16]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[15]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[14]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[13]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[12]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[11]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[10]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[9]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[8]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[7]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[6]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[5]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[4]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[3]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[2]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[1]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o[0]} {-height 15 -radix unsigned}} /RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o
add wave -noupdate -group immediate -label immDec -radix decimal /RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o
add wave -noupdate -divider regs
add wave -noupdate -label sp /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_sp/DataOutput
add wave -noupdate -label ra /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_ra/DataOutput
add wave -noupdate -label gp /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_gp/DataOutput
add wave -noupdate -label tp /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_tp/DataOutput
add wave -noupdate -expand -group sRegs -label s0 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s0_fp/DataOutput
add wave -noupdate -expand -group sRegs -label s1 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s1/DataOutput
add wave -noupdate -expand -group sRegs -label s2 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s2/DataOutput
add wave -noupdate -expand -group sRegs -label s3 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s3/DataOutput
add wave -noupdate -expand -group sRegs -label s4 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s4/DataOutput
add wave -noupdate -expand -group sRegs -label s5 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s5/DataOutput
add wave -noupdate -expand -group sRegs -label s6 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s6/DataOutput
add wave -noupdate -expand -group sRegs -label s7 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s7/DataOutput
add wave -noupdate -expand -group sRegs -label s8 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s8/DataOutput
add wave -noupdate -expand -group sRegs -label s9 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s9/DataOutput
add wave -noupdate -expand -group sRegs -label s10 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s10/DataOutput
add wave -noupdate -expand -group sRegs -label s11 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s11/DataOutput
add wave -noupdate -expand -group tRegs -label t0 -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t0/DataOutput
add wave -noupdate -expand -group tRegs -label t1 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t1/DataOutput
add wave -noupdate -expand -group tRegs -label t2 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataOutput
add wave -noupdate -expand -group tRegs -label t3 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t3/DataOutput
add wave -noupdate -expand -group tRegs -label t4 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t4/DataOutput
add wave -noupdate -expand -group tRegs -label t5 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t5/DataOutput
add wave -noupdate -expand -group tRegs -label t6 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t6/DataOutput
add wave -noupdate -divider ram
add wave -noupdate -group RAMctr /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Read_Data_o
add wave -noupdate -group RAMctr /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Mem_Write_i
add wave -noupdate -group RAMctr /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Write_Data_i
add wave -noupdate -group RAMctr -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Address_i
add wave -noupdate -group RAMctr /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/real_address
add wave -noupdate -group RAMctr -radix decimal /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/real_address
add wave -noupdate -color Yellow {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[3]}
add wave -noupdate -color {Dark Orchid} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[2]}
add wave -noupdate -color {Dark Orchid} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[1]}
add wave -noupdate -color {Dark Orchid} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[0]}
add wave -noupdate -subitemconfig {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[14]} {-color Black -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[13]} {-color Black -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[12]} {-color Black -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[11]} {-color Black -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[10]} {-color Black -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[9]} {-color Black -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[8]} {-color Cyan -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[7]} {-color Cyan -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[6]} {-color Cyan -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[5]} {-color Yellow -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[4]} {-color Yellow -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[3]} {-color Yellow -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[2]} {-color {Dark Orchid} -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[1]} {-color {Dark Orchid} -height 15} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[0]} {-color {Dark Orchid} -height 15}} /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4 ns} 1} {{Cursor 3} {32 ns} 1} {{Cursor 4} {34 ns} 0}
quietly wave cursor active 3
configure wave -namecolwidth 196
configure wave -valuecolwidth 77
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {40 ns} {72 ns}
