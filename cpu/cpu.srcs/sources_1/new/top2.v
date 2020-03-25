`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/24 13:05:24
// Design Name: 
// Module Name: top2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top2(
    clk,seg,btt
    );
    input clk;
    output [7:0] seg,btt;
    
    reg [15:0] low,high;
    digtalDisplay com1(clk,low,high,seg,btt);
    top com2(clk,low,high);
endmodule
