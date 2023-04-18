/******************************************************************
* Description
*	This is  a ROM memory that represents the program memory. 
* 	Internally, the memory is read without a signal clock. The initial 
*	values (program) of this memory are written from a file named text.dat.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module Program_Memory
#
(
	parameter MEMORY_DEPTH = 32,
	parameter DATA_WIDTH = 32
)
(
	input [(DATA_WIDTH-1):0] Address_i,
	
	output reg [(DATA_WIDTH-1):0] Instruction_o
);
wire [(DATA_WIDTH-1):0] address;
wire [(DATA_WIDTH-1):0] real_address;

assign address = Address_i-32'h00400000;
assign real_address = {address[31:2]};

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[MEMORY_DEPTH-1:0];

	initial
	begin
		$readmemh("C:/MODELSIM_PROJECTS/RISC_V_Single_Cycle/src/text.dat", rom);
	end

	always @ (real_address)
	begin
		Instruction_o = rom[real_address];
	end

endmodule
