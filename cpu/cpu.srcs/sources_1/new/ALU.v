`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/18 10:09:50
// Design Name: 
// Module Name: ALU
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


module ALU(clk,BR_in,cs,accis0,acc,mpyhigh,x,temp);

    input clk;
    input [15:0] BR_in;
    input [31:0] cs;
    output accis0;
    output [15:0] acc;
    output [15:0] mpyhigh;
    output [31:0] x;
    output [15:0] temp;
    
    wire accis0;
    reg [15:0] acc=16'h0000;
    reg [15:0] mpyhigh=16'h0000;
    
    reg [15:0] temp=16'h0000;//临时信号
    reg [31:0] x=32'h00000000;
    //BR_in送入的是原码
    
    assign accis0 = (temp[15]==1?1:0);
    always@(posedge(clk))begin
        if(cs[8]==1)
            temp<=16'h0000;//重置
        else if(cs[9]==1)//相加
            temp<=temp + BR_in;
        else if(cs[16]==1)//相减
            temp<=temp - BR_in;   //---sub 
        else if(cs[17]==1)//
            temp<={1'b0,temp[15:1]};   //---sub 
        else if(cs[24]==1)begin//mpy,输入原码，输出补码
            if(temp[15]^BR_in[15]==1)begin
                if(temp[15]==1)
                    x={1'b0,temp[14:0]}*BR_in;
                else
                    x=temp*{1'b0,BR_in[14:0]}; 
                    x=-x;
                temp<=x[15:0];
                mpyhigh<=x[31:16];
            end
            else begin
               if(temp[15]==1)
                    x={1'b0,temp[14:0]}*{1'b0,BR_in[14:0]};
               else
                    x=temp*BR_in;
            end
            temp<=x[15:0];
            mpyhigh<=x[31:16];
        end
        
        else if(cs[25]==1)//SHL
            temp<={temp[14:0],1'b0};
        else if(cs[29]==1)//SAR
            temp<={temp[15],temp[15:1]};
        else if(cs[30]==1)//SAL
            temp<={temp[14:0],1'b0};
        else if(cs[28]==1)//And
            temp<=temp & BR_in;
        else if(cs[27]==1)//Or
            temp<=temp | BR_in;
        else if(cs[26]==1)//Not
            temp<=~temp;
            
    end
    always@(temp)
        acc<=temp;
endmodule
