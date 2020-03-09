`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/08 15:24:08
// Design Name: 
// Module Name: printer
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


module printer(
    clk,rdy,tr,pd,memory,state
    );
    output rdy,state;
    input tr,clk;
    input [7:0] pd;
    output [7:0] memory;
    reg rdy=0;
    reg state=1;
    reg [7:0] memory;
    always@(posedge(clk))begin
        if(state==1 && tr==1)begin
            rdy<=1;
            #20
            memory<=pd;
            state<=0;
        end
        if(state==1 && tr==0)begin
            rdy<=0;
        end
        if(state==0)begin
            rdy<=0;
            #50 state<=1;//打印中，等待时间长
        end
    end
    
endmodule
