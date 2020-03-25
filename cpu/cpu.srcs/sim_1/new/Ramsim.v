`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/17 08:59:28
// Design Name: 
// Module Name: Ramsim
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


module Ramsim();

    reg clk,wea;
    reg [7:0] addra;
    reg [15:0] dina;
    wire [15:0] douta;
    RAM1 b (
          .a(addra),      // input wire [7 : 0] a
          .d(dina),   // input wire [15 : 0] d
          .clk(clk),  // input wire clk
          .we(wea),    // input wire we
          .spo(douta)  // output wire [15 : 0] spo
        );
        
        
    reg [7:0] a;
    wire [31:0] spo;
    ROM1 com (
      .a(a),      // input wire [7 : 0] a
      .spo(spo)  // output wire [31 : 0] spo
    );

    always #20 clk=~clk;
    initial begin
        clk<=0;      
        wea<=0;
        addra<=8'h00;
        a<=8'h02;
        #40
        addra<=8'h06;
        a<=8'h40;  
        #40
        addra<=8'h40;   
         
    end

endmodule
