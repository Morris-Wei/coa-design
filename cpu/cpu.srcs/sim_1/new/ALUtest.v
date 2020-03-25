`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/19 17:00:21
// Design Name: 
// Module Name: ALUtest
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


module ALUtest();
    reg clk;
    reg [15:0] BR_in;
    reg [31:0] cs;
    wire accis0;
    wire [15:0] acc;
    wire [15:0] mpyhigh;
    wire [15:0] temp;//¡Ÿ ±–≈∫≈
    wire [31:0] x;
    
    ALU test(clk,BR_in,cs,accis0,acc,mpyhigh);
    //ALU
    parameter [31:0] noop = 32'h00000000;
    parameter [31:0] rst = 32'h00000100;
    parameter [31:0] plus = 32'h00000200;
    parameter [31:0] minus = 32'h00010000;
    parameter [31:0] shr = 32'h00020000;
    
    parameter [31:0] mpy = 32'h01000000;
    parameter [31:0] shl = 32'h02000000;
    parameter [31:0] sar = 32'h20000000;
    parameter [31:0] sal = 32'h40000000;
    parameter [31:0] and_c = 32'h10000000;
    parameter [31:0] or_c = 32'h08000000;
    parameter [31:0] not_c = 32'h04000000;

    always #20 clk=~clk;
    
    initial begin
        clk<=0;
        BR_in<=16'h7fff;
        cs<=plus;
        #40
        BR_in<=16'h7fff;
        #40
        cs<=noop;
    end
endmodule
