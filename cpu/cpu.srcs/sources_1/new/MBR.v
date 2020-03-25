`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 16:47:04
// Design Name: 
// Module Name: MBR
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


module MBR(
    ACC_in,MEMORY_in,clk,cs,MR_in,MBR_out
    );
    input [15:0] ACC_in;
    input [15:0] MEMORY_in,MR_in;
    input [31:0] cs;
    input clk;
    output [15:0] MBR_out;
    reg [15:0] MBR_out;
    
    always@(posedge(clk))begin
        if(cs[3]==1)
            MBR_out<=MEMORY_in;
            
        else if(cs[12]==1)
            MBR_out<=ACC_in;
            
        else if(cs[19]==1)
            MBR_out<=MR_in;
    end
    
endmodule
