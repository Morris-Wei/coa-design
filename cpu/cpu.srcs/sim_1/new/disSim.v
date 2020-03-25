`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/17 20:49:29
// Design Name: 
// Module Name: disSim
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


module disSim();
    reg clkd;
    reg [15:0] cQin,cQhign;
    wire [7:0] sg,bt;
    wire [3:0] count;
    wire clk3;
    digtalDisplay test(clkd,cQin,cQhign,sg,bt);
    
    always#20 clkd=~clkd;
    initial begin
        clkd<=0;
        cQin<=16'b1001110000100001;
        cQhign<=16'b1001110000100001;
    end
endmodule
