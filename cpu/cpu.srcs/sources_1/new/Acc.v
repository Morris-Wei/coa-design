`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 14:15:27
// Design Name: 
// Module Name: Acc
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


module Acc(
    cs,clk,MR,ACC_in
    );
    input [31:0] cs;
    input clk;
    output [15:0] MR;
    input [15:0] ACC_in;
    
    reg [15:0] MR;
    always@(posedge(clk))begin
        if(cs[18]==1)begin
            MR<=ACC_in;
        end
    end
    
endmodule
