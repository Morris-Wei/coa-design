`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 16:36:42
// Design Name: 
// Module Name: IR
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


module IR(
    MBR_in,cs,clk,IR_out
    );
    input [7:0] MBR_in;
    input [31:0] cs;
    input clk;
    output [7:0] IR_out;
    
    reg [7:0] IR_out;
    
    always@(posedge(clk))begin
        if(cs[4]==1)
            IR_out<=MBR_in;
    end
endmodule
