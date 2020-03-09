`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/09 14:18:50
// Design Name: 
// Module Name: testPrinterPOC
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


module testPrinterPOC();
    wire rdy,tr;
    wire [7:0] pd;
    wire state;
    reg clk;
    wire [7:0] memory;//printer variable
    
    reg rw,addr;
    reg [7:0] din;
    wire irq;
    wire [7:0] dout;
    wire [7:0] br,sr;
    
    poc testA(irq,din,dout,pd,rw,clk,tr,rdy,addr,sr,br);
    printer testB(clk,rdy,tr,pd,memory,state);
    
    
    initial begin
            clk<=0;
            #20
            rw<=0;addr<=0;
            #20
            if(dout[0]==1)begin//中断模式
            
                if(irq==0)begin
                    #20
                    rw<=1;addr<=1;din<=8'b01010101;
                    
                    #65
                    rw<=1;addr<=1;din<=8'b01110001;
                    
                    #65
                    rw<=1;addr<=1;din<=8'b11110001;
                end
            end
            if(dout[0]==0)begin//查询模式
            
                if(dout[7]==1)begin
                    rw<=1;addr<=1;din<=8'b01111001;
                end

            end
            
        end
        
        
        always #10
            clk=~clk;//period = 2ps

    
    
    
    
    
endmodule
