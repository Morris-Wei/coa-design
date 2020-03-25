`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 15:56:01
// Design Name: 
// Module Name: BR
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


module BR(
    MBR_in,cs,clk,BR_out
    );
    input [15:0] MBR_in;
    input [31:0] cs;
    input clk;
    output [15:0] BR_out;
    
    reg [15:0] BR_out;
    
    always@(posedge(clk))begin
        if(cs[7]==1)begin
            BR_out<=MBR_in;
        end
    end
    
endmodule
