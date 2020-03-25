`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/23 15:27:03
// Design Name: 
// Module Name: top
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


module top(
    clk,low16,high16
    );
    input clk;
    output [15:0] low16, high16;
    
    reg [15:0] low16;
    reg [15:0] high16;
    
    wire [7:0] MBR_16;
    wire [31:0] cs;
    wire clk;
    wire [7:0] PC_out;
    wire [15:0] MR;
    wire [15:0] ACC_in;
    wire [15:0] BR_ALU;
    wire accis0;
    wire [15:0] acc;
    wire [15:0] mpyhigh;
    wire [31:0] x;
    wire [15:0] temp;
    wire [15:0] BR_out;
    wire flag;
    wire [7:0] IR_in;
    wire [7:0] address_out;
    wire [7:0] IR_out;
    wire [7:0] PC_in;
    wire [7:0] MAR_out;
    wire [15:0] MEMORY_in,MR_in;
    wire [15:0] MBR_out;
    
    //ram
    wire ena1;
    wire wea1;
    wire we2;
    wire [7:0] addr1,address,add;//add ram addr//address rom addr
    wire [15:0] din1,dout1;
    wire [31:0] din2,dout2;
    wire [16:0] memory_data;
    wire [7:0] PC_8;
    wire [15:0] ACC_16;
    wire [15:0] mpy_high16;
    wire [7:0] IR_8;
    wire flagg;
    wire [15:0] MR_16;
    
    PC com1(MBR_16[7:0],cs,clk,PC_8);
    MR com2(cs,clk,MR_16,mpy_high16);
    ALU com3(clk,BR_ALU,cs,flagg,ACC_16,mpy_high16);
    BR com4(MBR_16,cs,clk,BR_ALU);
    Control_unit com5(clk,flagg,cs,IR_8,address);
    IR com6(MBR_16[15:8],cs,clk,IR_8);
    MAR com7(PC_8,MBR_16[7:0],clk,cs,add);
    MBR com8(ACC_16,memory_data,clk,cs,MR_16,MBR_16);
    
RAM1 com9 (
      .a(add),      // input wire [7 : 0] a
      .d(MBR_16),      // input wire [15 : 0] d
      .clk(clk),  // input wire clk
      .we(cs[11]),    // input wire we
      .spo(memory_data)  // output wire [15 : 0] spo
    );
    
ROM1 com10 (
    .a(address),      // input wire [7 : 0] a
    .spo(cs)  // output wire [31 : 0] spo
    );
    always@(posedge(clk))begin
        low16<=ACC_16;
        high16<=mpy_high16;
    end

endmodule
