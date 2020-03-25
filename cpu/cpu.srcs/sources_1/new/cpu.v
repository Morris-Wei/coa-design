`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 16:35:10
// Design Name: 
// Module Name: cpu
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


module cpu(
    clk
    );
    input clk;
    
    wire [7:0] MBR_in;
    wire [31:0] cs;
    wire clk;
    wire [7:0] PC_out;
    wire [15:0] MR;
    wire [15:0] ACC_in;
    wire [15:0] BR_in;
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
    wire [7:0] addr1,addr2;
    wire [15:0] din1,dout1;
    wire [31:0] din2,dout2;
    wire [15:0] memory_data,MBR_16,BR_ALU;
    wire [15:0] add;//ram 
    
    PC com1(MBR_16,cs,clk,PC_out);
    MR com2(cs,clk,MR,ACC_in);
    ALU com3(clk,BR_ALU,cs,accis0,acc,mpyhigh,x,temp);
    BR com4(MBR_16,cs,clk,BR_ALU);
    Control_unit com5(clk,flag,cs,IR_in,address_out);
    IR com6(MBR_16,cs,clk,IR_out);
    MAR com7(PC_in,MBR_16,clk,cs,MAR_out);
    MBR com8(ACC_in,MEMORY_in,clk,cs,MR_in,MBR_out);
    
    RAM1 com9 (
      .a(add),      // input wire [7 : 0] a
      .d(MBR_16),      // input wire [15 : 0] d
      .clk(clk),  // input wire clk
      .we(cs[11]),    // input wire we
      .spo(memory_data)  // output wire [15 : 0] spo
    );




//    ROM1 com10(
//      .a(addr2),      // input wire [7 : 0] a
//      .d(din2),      // input wire [31 : 0] d
//      .clk(clk),  // input wire clk
//      .we(we2),    // input wire we
//      .spo(dout2)  // output wire [31 : 0] spo
//    );


    
    


endmodule
