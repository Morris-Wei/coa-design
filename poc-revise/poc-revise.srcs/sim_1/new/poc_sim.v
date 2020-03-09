`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/08 11:05:28
// Design Name: 
// Module Name: poc_sim
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


module poc_sim(

    );
    reg addr,rw,clk,rdy;
    reg [7:0] din;
    wire [7:0] pd,sr,br,dout;
    wire irq,tr;
    
    poc test(irq,din,dout,pd,rw,clk,tr,rdy,addr,sr,br);
    
    initial begin
        clk<=0;
        #20
        rw<=1;addr<=1;din<=8'b01010101;
        #20
        rdy<=1;
        
        #20
        rw<=1;addr<=1;din<=8'b01110001;
        #20
        rdy<=1;
        
        #20
        rw<=0;addr<=1;
        
        #20
        rw<=0;addr<=0;

        
    end
    
    
    always #10
        clk=~clk;//period = 2ps
endmodule
