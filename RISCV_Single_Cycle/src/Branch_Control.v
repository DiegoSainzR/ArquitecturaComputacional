module Branch_Control
#(
	parameter N = 32
)(
	input [0:0] zero_i,
	input [0:0] carry_i,
	input [2:0] func3,
	output reg [0:0] condition_is_true_i
);

	localparam beq = 3'h0;
	localparam bne = 3'h1;
	localparam blt = 3'h4;
	localparam bge = 3'h5;
	localparam bltu = 3'h6;
	localparam bgeu = 3'h7;
	
	wire [4:0] selection_w;
	assign selection = {zero_i, carry_i, func3};
	
	always @* begin
		case(func3) 
			beq:begin
				if(zero_i)
					condition_is_true_i <= 1'b1;
				else
					condition_is_true_i <= 1'b0;
			end
			bne:begin
				if(zero_i)
					condition_is_true_i <= 1'b0;
				else
					condition_is_true_i <= 1'b1;
			end
			blt:begin
				if(zero_i)
					condition_is_true_i <= 1'b0;
				else
					condition_is_true_i <= 1'b1;
			end
			blt:begin
				if(zero_i)
					condition_is_true_i <= 1'b0;
				else begin
					if(carry_i)
						condition_is_true_i <= 1'b0;
					else
						condition_is_true_i <= 1'b1;
				end
			end
			
			bge:begin
				if(zero_i)
					condition_is_true_i <= 1'b1;
				else begin
					if(carry_i)
						condition_is_true_i <= 1'b1;
					else
						condition_is_true_i <= 1'b0;
				end
			end
			default:condition_is_true_i <= 1'b0;
		endcase
	end
endmodule