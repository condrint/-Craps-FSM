`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 05:16:12 PM
// Design Name: 
// Module Name: fsm
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


 module fsm(Clk100MHz, reset_n,  DiceSum, present_state, DiceRolled,MyPoint, RollDiceLed, PlayerWinsLed, PlayerLosesLed);
    input Clk100MHz, reset_n, DiceRolled;
    input [3:0] DiceSum;
    output reg [3:0] present_state;
    output reg [3:0] MyPoint=0;
    output reg RollDiceLed=0, PlayerWinsLed=0, PlayerLosesLed=0;
    reg [3:0] next_state;
    parameter [2:0] START_ST=3'b000, DICEROLLED1_ST=3'b001, WON_ST =3'b010, 
                    LOSE_ST=3'b011, CONTINUE_ST=3'b100, DICEROLLED2_ST =3'b101, END_ST = 3'b110; 
    always @(DiceRolled, present_state) begin     
    
        case(present_state)
            START_ST: //////////////////////////////////////////////////////////
                        begin
                            if(DiceRolled) begin
                                next_state <= DICEROLLED1_ST;
                                MyPoint <= DiceSum;
                                            end
                            else
                                next_state <= START_ST; 
                        end
                            
            DICEROLLED1_ST:////////////////////////////////////////////////
                          begin RollDiceLed <= 1;
                              if(DiceSum == 7 | DiceSum == 11) 
                                next_state <= WON_ST;
                              else if( DiceSum == 2 | DiceSum ==3 | DiceSum == 12)
                                next_state <= LOSE_ST;
                              else begin
                                next_state <= CONTINUE_ST;
                                    end
                          end
            WON_ST: /////////////////////////////////////////////////////
                        begin next_state <= END_ST;
                            PlayerWinsLed <= 1;
                            PlayerLosesLed<= 0;
                            RollDiceLed <= 0;
                        end
                    
            LOSE_ST: //////////////////////////////////////////////
                        begin next_state <= END_ST;
                            PlayerWinsLed <= 0;
                            PlayerLosesLed <= 1;
                            RollDiceLed <=0;
                        end
                    
            CONTINUE_ST:///////////////////////////////////////////////// 
                        begin 
                            if(DiceRolled)
                                next_state <= DICEROLLED2_ST;
                            else
                                next_state <= CONTINUE_ST;
                        end       
            DICEROLLED2_ST: ////////////////////////////////////////////
                        begin
                            RollDiceLed <= 1;
                            if(DiceSum==7)
                                next_state <= LOSE_ST;
                            else if(DiceSum == MyPoint)
                                next_state <= WON_ST;
                            else begin 
                              next_state <= CONTINUE_ST;
                            end    
                        end
            END_ST: ////////////////////////////////////////////////
                        begin 
                            next_state <= END_ST;
                
                        end                     
         /////////////////////////////////////////////////////
            default: next_state <= START_ST;                                                                                                                                                                     
        
        endcase                    
    end
    
    always @(posedge Clk100MHz)
        if(!reset_n) begin
            present_state <= START_ST;
            //MyPoint <= 0;
            //RollDiceLed <= 0;
            //PlayerWinsLed <= 0;
            //PlayerLosesLed <= 0;
            end
        else
            present_state <= next_state;
                                                                                               
endmodule
