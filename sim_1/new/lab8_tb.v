`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 05:53:05 PM
// Design Name: 
// Module Name: lab8_tb
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


module lab8_tb();
    reg Clk100MHz, BTNU, BTNC;
    reg [3:0] Sw;
    wire CA,CB,CC,CD,CE,CF,CG;
    wire DP;
    wire [7:0]AN;
    wire RollDiceLed, PlayerWinsLed, PlayerLosesLed;
    
    lab8_top uut(
        .Clk100MHz(Clk100MHz), 
        .BTNC(BTNC), 
        .BTNU(BTNU), 
        .Sw(Sw), 
        .RollDiceLed(RollDiceLed), 
        .PlayerWinsLed(PlayerWinsLed), 
        .PlayerLosesLed(PlayerLosesLed),
        .CA(CA),
        .CB(CB),
        .CC(CC),
        .CD(CD),
        .CE(CE),
        .CF(CF),
        .CG(CG), 
        .DP(DP), 
        .AN(AN)
    );
    
    initial Clk100MHz = 0;
    always #5 Clk100MHz = ~Clk100MHz; //10ns period
    ///////////////////////////tasks///////////////////////
    task press_BTNU;
        begin
            $display("%d Start of task press_button", $time);
            BTNU = 0; 
            #1000;
            BTNU = 1;
            #1500;
            BTNU = 0;
            #1200;
            BTNU = 1;
            #1800;
            BTNU = 0;
            #1100;
            BTNU = 1;
            #15000;
            BTNU = 0;
            #1800;
            BTNU = 1;
            #1600;
            BTNU = 0;
            #1400;
            BTNU = 1;
            #1100;
            BTNU = 0;
            #15000;
            $display("%d End of task press_button", $time);
        end
    endtask             
    
    task IssueReset;
        begin
        BTNC = 1'b0;
        #100;
        BTNC = 1'b1;
        #100;
        BTNC = 1'b0;
        #100;
        end
    endtask 
   
    task Toss;
        input [3:0] DiceSum;
        begin
            $display("Toss %d", DiceSum);
            Sw = DiceSum;
            press_BTNU;
        end
    endtask 
    
    /////////////////////////////////endtasks//////////////
    
    initial begin
    
        IssueReset;
        Toss(7); //straight to win
        #1000
        IssueReset;
        Toss(12); //straight to loss
        #1000
        IssueReset;
        Toss(4);
        Toss(7); //continue then loss
        #1000
        IssueReset;
        Toss(5);
        Toss(5); //continue then win
        #1000
        $finish;
        
    end
endmodule
