module Data_Memory_Cell(
	input clk_i,
	input enable_i,
	input [1:0] type_i,
	input [1:0] addr_i,
	input [31:0] input_i,
	output reg [31:0] output_o
	
);
	always@(posedge clk_i)begin
		if (enable_i) begin
			if(type_i==2) begin
				if(addr_i==0)
					output_o <= input_i;
			end
			else if(type_i==1) begin
				if(addr_i==0)
					output_o[15:0] <= input_i[15:0];
				else if(addr_i==2)
					output_o[31:16] <= input_i[15:0];
			end
			else begin
				if(addr_i==0)
					output_o[7:0] <= input_i[7:0];
				else if(addr_i==1)
					output_o[15:8] <= input_i[7:0];
				else if(addr_i==2)
					output_o[23:16] <= input_i[7:0];
				else if(addr_i==3)
					output_o[31:24] <= input_i[7:0];
			end
		end
	end
endmodule