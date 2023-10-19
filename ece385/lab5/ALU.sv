`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/23 17:22:35
// Design Name: 
// Module Name: ALU
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


module ALU( input logic[15:0] A, 
            input logic[15:0]B,
            input logic[1:0] ALUK,
            output logic[15:0] Out

                                );
                                
          always_comb
          begin
                case(ALUK)
                2'b00: Out =A+B;
                2'b01: Out= A&B;
                2'b10: Out=~A;
                2'b11: Out=A;
                endcase
          end
          
endmodule
