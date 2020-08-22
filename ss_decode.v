`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:30 08/16/2020 
// Design Name: 
// Module Name:    ss_decode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ss_decode(
    input 			clk,
    input [3:0]	BCD,
	 output [7:0]	sseg_o
    );

	reg [7:0]	sseg = 8'b11111111;

	always @(posedge clk)
		begin
			case(BCD)
				4'b0000: sseg <= 8'b11000000;//00000011;
				4'b0001: sseg <= 8'b11111001;//10011111;
				4'b0010: sseg <= 8'b10100100;//00100101;
				4'b0011: sseg <= 8'b10110000;//00001101;
				4'b0100: sseg <= 8'b10011001;//10011001;
				4'b0101: sseg <= 8'b10010010;//01001001;
				4'b0110: sseg <= 8'b10000010;//01000001;
				4'b0111: sseg <= 8'b11111000;//00011111;
				4'b1000: sseg <= 8'b10000000;//00000001;
				4'b1001: sseg <= 8'b10010000;//00001001;
				default sseg <= 8'b11111111;
				endcase
		end

assign sseg_o = sseg;
endmodule
