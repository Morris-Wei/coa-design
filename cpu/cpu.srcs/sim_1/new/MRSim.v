`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/18 09:16:38
// Design Name: 
// Module Name: MRSim
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



module MRSim();
    reg clk;//
    wire [31:0] cs;//
    wire [15:0] mpy_high;
    wire [15:0] MBR_16;
    wire [15:0] MR_16;
    wire [15:0] BR_ALU;
    wire [7:0] IR_8;
    wire [7:0] add;
    wire [7:0] PC_8;
    wire [15:0] ACC_16;
    wire [15:0] spo;//
    wire flagg;
    wire [7:0] address;
    
    parameter [31:0] noop = 32'h00000000;
    parameter [31:0] spo_mbr16 = 32'h00000008;
    parameter [31:0] mbr16_add = 32'h00000020;
    parameter [31:0] mbr16_pc8 = 32'h00004000;
    parameter [31:0] pc8_add = 32'h00000400;
    
    parameter [31:0] mbr16_ir8 = 32'h00000010;
    parameter [31:0] mbr16_bralu = 32'h00000080;
    parameter [31:0] acc16_mbr16 = 32'h00001000;
    parameter [31:0] mr16_mbr16 = 32'h00080000;
    //ALU
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
    //ram
    parameter [31:0] ram_wr = 32'h00000800; 
    //contol unit
    parameter [31:0] rst_car = 32'h00000001;
    parameter [31:0] inc_car = 32'h08000004;
    parameter [31:0] con_car = 32'h00000002;
    //pc
    parameter [31:0] pc_rst = 32'h00008000;
    parameter [31:0] pc_inc = 32'h00000040;
    MR test(cs,clk,MR_16,mpy_high);
    BR test2(MBR_16,cs,clk,BR_ALU);
    IR test3(MBR_16[15:8],cs,clk,IR_8);
    MAR test4(PC_8,MBR_16[7:0],clk,cs,add);
    MBR test5(ACC_16,spo,clk,cs,MR_16,MBR_16);
    PC test6(MBR_16[7:0],cs,clk,PC_8);
    ALU test7(clk,BR_ALU,cs,flagg,ACC_16,mpy_high);
    Control_unit test8(clk,flagg,cs,IR_8,address);

    
    RAM1 test9(  .a(add),      // input wire [7 : 0] a
    .d(MBR_16),      // input wire [15 : 0] d
    .clk(clk),  // input wire clk
    .we(cs[11]),    // input wire we
    .spo(spo)  // output wire [15 : 0] spo
);
    ROM1 test10 (
    .a(address),      // input wire [7 : 0] a
    .spo(cs)  // output wire [31 : 0] spo
);


    always#20 clk=~clk;
    initial begin
        clk<=0;
    end
    
    
    
    
endmodule
