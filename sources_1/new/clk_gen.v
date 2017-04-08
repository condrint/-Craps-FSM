`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 04:56:04 PM
// Design Name: 
// Module Name: clk_gen
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

module clk_gen(Clk100MHz, Clk1KHzEn, Clk1HzEn, reset_n);
    
    input Clk100MHz, reset_n;
    output reg Clk1KHzEn;
    output reg Clk1HzEn;
    reg [16:0] count;
    reg [9:0] count2;
    localparam MAX_COUNT=99999; //synthesis
    localparam MAX_COUNT2=999;
    
    //localparam MAX_COUNT=99; //simulation
    
    always @(posedge Clk100MHz) begin
        if(!reset_n)  
            count <= 0;
        else if (count == MAX_COUNT)
            count <= 0;
        else
            count <= count + 1;
    end
   
    always @(posedge Clk100MHz)    
        if(!reset_n)
            Clk1KHzEn <= 0;
        else if(count == MAX_COUNT)
            Clk1KHzEn <= 1;
        else
            Clk1KHzEn <= 0;
    
    always @(posedge Clk100MHz) begin
        if(!reset_n)  
            count2 <= 0;
        else if (Clk1KHzEn == 1) begin
            if(count2 == MAX_COUNT2)
                count2 <= 0;
            else
                count2 <= count2 + 1;
        end        
    end
    
    always @(posedge Clk100MHz)
        if(!reset_n)
            Clk1HzEn <= 0;
        else if (count2 == MAX_COUNT2 && Clk1KHzEn==1)
            Clk1HzEn <= 1;
        else
            Clk1HzEn <= 0;
            
endmodule