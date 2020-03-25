`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/17 12:43:27
// Design Name: 
// Module Name: digtalDisplay
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


module digtalDisplay(
    clkd,cQin,cQhign,sg,bt
    );
    input clkd;
    input [15:0] cQin,cQhign;//cQin第四个数码管显示数字，CQhigh高四个数码管显示数字
    output [7:0] sg,bt;//bt位置码，sg显示码

    
    reg [2:0] cnt8=3'b000;
    reg [3:0] A;
    reg [7:0] B,sg,bt;
    reg [9:0] count=10'b0000000000;
    reg clk3=0;
    
    always@(clkd)begin
        if(clkd==1)begin
            count<=count+1;
            if(count==10'b1111111111)begin
                clk3<=~clk3;
                count<=10'b0000000000;
            end
        end
    end
    
    always@(cnt8)begin
        case(cnt8)
            3'b000:begin
                bt<=8'b11111110;
                A<=cQin[3:0];
            end
            
             3'b001:begin
               bt<=8'b11111101;
               A<=cQin[7:4];
            end
            
            3'b010:begin
                bt<=8'b11111011;
                A<=cQin[11:8];
            end
            3'b011:begin
                bt<=8'b11110111;
                A<=cQin[15:12];
            end
            
            3'b100:begin
               bt<=8'b11101111;
               A<=cQhign[3:0];
            end
            
            3'b101:begin
                bt<=8'b11011111;
                A<=cQhign[7:4];
            end
            
            3'b110:begin
                bt<=8'b10111111;
                A<=cQhign[11:8];
            end
            
            3'b111:begin
                bt<=8'b01111111;
                A<=cQhign[15:12];
            end
            default: ;
       endcase
    end
    
    always@(clk3)begin
        if(clk3==1)begin
            cnt8<=cnt8+1;
        end
    end
    
    always@(A)begin
        case(A)
            4'b0000:sg<=8'b11000000;
            4'b0001:sg<=8'b11111001;
            4'b0010:sg<=8'b10100100;
            4'b0011:sg<=8'b10110000;
            4'b0100:sg<=8'b11000000;
            4'b0101:sg<=8'b11111001;
            4'b0110:sg<=8'b10000010;
            4'b0111:sg<=8'b11111000;
            4'b1000:sg<=8'b10000000; 
            4'b1001:sg<=8'b10010000;
            4'b1010:sg<=8'b10001000; 
            4'b1011:sg<=8'b10000011;
            4'b1100:sg<=8'b11000110; 
            4'b1101:sg<=8'b10100001;
            4'b1110:sg<=8'b10000110; 
            4'b1111:sg<=8'b10001110;
            default: sg<=8'b11111111;
        endcase
    end
    
endmodule
