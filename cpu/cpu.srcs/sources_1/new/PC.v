`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 16:57:39
// Design Name: 
// Module Name: PC
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


module PC(
    MBR_in,cs,clk,PC_out
    );
    input [7:0] MBR_in;
    input [31:0] cs;
    input clk;
    output [7:0] PC_out;
    
    reg [7:0] PC_out;
    
    reg [7:0] temp=8'b00000000;
    
    always@(posedge(clk))begin
        if(cs[15]==1)begin
            temp=8'b00000000;
        end
        else if(cs[14]==1)begin
            temp=MBR_in;
        end
        else if(cs[6]==1)begin
            temp=temp+1;
        end
        PC_out<=temp;
    end 
endmodule
