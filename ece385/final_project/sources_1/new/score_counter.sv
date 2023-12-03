`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 20:51:25
// Design Name: 
// Module Name: score_counter
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


module score_counter( input logic vsync, reset_ah,
                      input logic[9:0]child_X, child2_X, child3_X, child4_X,
                      output logic[3:0] score1, score2

    );
    logic count;
    //logic vsync_two;
         always_ff @(posedge vsync or posedge reset_ah)begin
                    if(reset_ah)begin
                        count <= 0;
                    end
                    else if((child_X == 0)||(child2_X == 0)||(child3_X == 0)||(child4_X == 0))begin
                        count <= 1;
                    end
                    else begin
                        count <= 0;
                    end
              end
          
          always_ff @(posedge vsync or posedge reset_ah)begin
            if(reset_ah)begin
                score2 <= 4'b0000;
                score1 <= 4'b0000;
            end
            
            else if(count && score2 != 4'b1001)begin
                score2 <= score2 + 4'b0001;
                
            end
            else if(count && score2 == 4'b1001) begin
                    score2 <= 0;
                    score1 <= score1 + 1;
            end
            else if((score1==4'b1001)&& (score2==4'b1001))begin
                 score2 <= 4'b1001;
                 score1 <= 4'b1001;
            end   
            
          end
          
          
//         always_ff @(posedge vsync) begin
//         vsync_two <= ~vsync_two;
//         end
       
endmodule
