`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/08 11:02:56
// Design Name: 
// Module Name: poc
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


module poc(
    irq,din,dout,pd,rw,clk,tr,rdy,addr,sr,br
    );
    input rw,clk,rdy,addr;
    input [7:0] din;
    output irq,tr;
    output [7:0] dout,pd;
    output [7:0] br,sr;
    
    reg [7:0] sr=8'b10000001;
    reg [7:0] br,pd,dout;
    reg irq=1,tr=0;
    
    //ע��rw����1ʱ��ʾ���뵽poc��Ϊ0ʱ��ʾ��poc�����
    //  addr=1,br,addr=0,sr
    // sr[7]��ʾpoc���Ƿ�������
    
    always@(posedge(clk))begin
        if(clk==1)begin
            if(sr[7]==1)begin//׼�����˺�д������״̬�л�
                if(rw==1 && addr==1)
                    sr[7]<=0;
            end
            if(sr[7]==0)begin//δ׼����ʱ������ݽ���׼��״̬
                if(rdy==1)
                    sr[7]<=1;
            end
        end
    end
    
    always@(posedge(clk))begin
        if(sr[7]==1)begin
            if(rw==1 && addr==1)begin//��д��poc��brд������
                irq<=1;
                tr<=0;
                br<=din;
            end
            if(rw==1 && addr==0)begin//��д��poc��srд������
                irq<=1;
                tr<=0;
                sr<=din;
            end
            if(rw==0 && addr==1)begin
                if(sr[0]==1)
                    irq<=0;
                tr<=0;
                dout<=br;
            end
            
            if(rw==0 && addr==0)begin
                if(sr[0]==1)
                    irq<=0;
                tr<=0;
                dout<=sr;
            end

        end
        if(sr[7]==0)begin
            if(rdy==0)begin
                irq<=1;
                tr<=1;
            end
            if(rdy==1)begin
                irq<=1;
                tr<=0;
                pd<=br;
            end
        end
    end

endmodule
