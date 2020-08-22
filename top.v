`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:44 08/16/2020 
// Design Name: 
// Module Name:    top 
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
module top(
    input mclk,
	 output wire 	[7:0]	seg,
	 output wire	[3:0] an
    );

reg [15:0]	stat_bcd = 16'b0;

//Instantiation wires
wire			en;
wire [11:0] bin_d_in;
wire [15:0] bcd_d_out;
wire 			rdy;

example_count EC_0(
	 .clk(mclk),
	 .done(en),
	 .bin_cnt(bin_d_in)
    );

BCDConvert BCDConv_0(
    .clk(mclk),
    .en(en),
    .bin_d_in(bin_d_in),
    .bcd_d_out(bcd_d_out),
    .rdy(rdy)
    );
	 
multi_seg_drive MSD_0(
    .clk(mclk),
    .bcd_in(stat_bcd),
	 .sseg_a_o(an),
	 .sseg_c_o(seg)
    );

always @(posedge mclk)
	begin
	if(rdy)
		begin
		stat_bcd <= bcd_d_out;
		end
	end

endmodule
