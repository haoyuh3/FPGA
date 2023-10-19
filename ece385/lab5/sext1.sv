`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 23:13:35
// Design Name: 
// Module Name: sext1
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


module sext1(   input logic [15:0] IR,
				output logic [15:0] sext11,
				output logic [15:0] sext9,
				output logic [15:0] sext6,
				output logic [15:0] sext5);
				
				always_comb
				begin
				    if(IR[10])
				                sext11={5'b11111,IR[10:0]};
				     else
				                sext11={5'b00000,IR[10:0]};
				                
				                
				     if(IR[8])
				                sext9={7'b1111111,IR[8:0]};
				     else
				                sext9={7'b0000000,IR[8:0]};
				                
				     if(IR[5])
				                sext6={10'b1111111111,IR[5:0]};
				     else
				                sext6={10'b0000000000,IR[5:0]};
				      
				      if(IR[4])
				                sext5={11'b11111111111,IR[4:0]};
				     else
				                sext5={11'b00000000000,IR[4:0]};
				end

   
endmodule
