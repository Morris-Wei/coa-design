`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 16:39:53
// Design Name: 
// Module Name: MAR
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


module MAR(
    PC_in,MBR_in,clk,cs,MAR_out
    );
    input [7:0]PC_in,MBR_in;
    input clk;
    input [31:0] cs;
    output [7:0] MAR_out;
    
    reg [7:0] MAR_out=8'b00000000;
    
    always@(posedge(clk))begin
        if(cs[10]==1)begin
            MAR_out<=PC_in;
        end
        else if(cs[5]==1)begin
            MAR_out<=MBR_in;
        end
    end
endmodule
