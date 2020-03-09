`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/08 15:44:00
// Design Name: 
// Module Name: printer_sim
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


module printer_sim();
    reg clk,tr;
    reg [7:0] pd; 
    wire rdy,state;
    wire [7:0] memory;
    printer test(clk,rdy,tr,pd,memory,state);
    
    initial begin
        clk=0;
        #30
        tr<=1;pd<=8'b01111001;
        #30
        tr<=0;
    end
    always #10
        clk=~clk;
endmodule
