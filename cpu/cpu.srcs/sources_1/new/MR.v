`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/18 08:15:58
// Design Name: 
// Module Name: MR
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


module MR(cs,clk,MR,ACC_in);
    input clk;
    input [31:0] cs;
    input [15:0] ACC_in;
    output [15:0] MR;
    
    reg [15:0] MR;
    
    always@(posedge(clk))begin
        if(cs[18]==1)begin
            MR<=ACC_in;
        end
    end
endmodule
