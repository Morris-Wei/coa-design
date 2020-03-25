`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 16:02:08
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(
    clk,flag,cs,IR_in,address_out
    );
    input clk;
    input flag;
    input [31:0] cs;
    input [7:0] IR_in;
    output [7:0] address_out;
    
    reg [7:0] address_out;
    reg [7:0] address = 8'h00;
    
    always@(posedge(clk))begin
        if(cs[0]==1)begin//increase car
            address = address + 1; 
        end
        else if(cs[2]==1)begin//reset car
            address = 8'b00000000;
        end
        else if(cs[1]==1)begin//control addressing
            case(IR_in)
                8'b00000001:address=8'b00100000;//store
                8'b00000010:address=8'b00010000;//load
                8'b00010001:address=8'b00100101;//store1
                8'b00000011:address=8'b00110000;//add
                8'b00000100:address=8'b01000000;//sub
                8'b00000101:begin
                    if(flag==0)
                        address=8'b11110010;
                    else
                        address=8'b11110000;
                end
                8'b00000110:address=8'b11100000;//JMP
                8'b00000111:address=8'b01010000;//HALT
                8'b00001000:address=8'b10110000;//MPY
                8'b00001010:address=8'b01100000;//AND
                8'b00001011:address=8'b01110000;//OR
                8'b00001101:address=8'b10010000;//SHR
                8'b00001110:address=8'b10100000;//SHL
                8'b00001111:address=8'b11000000;//SAR
                8'b00010000:address=8'b11010000;//SAR
                8'b00001100:address=8'b10000000;//NOT
                
                default: ;
            endcase
            
            
        end
        address_out<=address;
    end
endmodule
