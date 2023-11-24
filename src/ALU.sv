module ALU(d1, d2, result, zero, control);
	input logic [31:0] d1;
	input logic [31:0] d2;
	output logic [31:0] result;
	output logic [0:0] zero;
	input logic [3:0] control;
	
	always_comb begin
		case(control)
			4'b0000: result = d1 + d2; //ADD
			4'b0001: result = d1 - d2; //SUB
			4'b0010: result = ($signed(d1) < $signed(d2)) ? 32'h00000001 : 32'h00000000; //SLT
			4'b0011: result = (d1 < d2) ? 32'h00000001 : 32'h00000000; //SLTU
			//4'b0100: 
			4'b0101: result = d1 << d2[4:0]; //SLL
			4'b0110: result = d1 >> d2[4:0]; //SRL
			4'b0111: result = d1 >>> d2[4:0]; //SRA
			4'b1000: result = d1 & d2; //AND
			4'b1001: result = d1 | d2; //OR
			4'b1010: result = d1 ^ d2; //XOR
			default: result = 32'bX;
		endcase
		if (result == 32'b0)
			zero = 1'b1;
		else
			zero = 1'b0;
	end
endmodule