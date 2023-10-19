`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:48:12
// Design Name: 
// Module Name: REG_file
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


module REG_file( 
                 input logic Clk,
                 input logic Reset,
                 input logic[2:0] DR,
                 input logic[2:0] SR1_m,
                 input logic[2:0] SR2_m,
                 input logic[15:0] bus_data,
                 input logic LD_REG,
                 output logic[15:0] SR1_out,
                 output logic[15:0] SR2_out
                                             );
                                             
                 logic [15:0] reg_unit [8]; 
                 
                 assign SR1_out=reg_unit[SR1_m];
                 assign SR2_out=reg_unit[SR2_m];
                 
                // we need to rest every reg 
                
                always_ff@(posedge Clk)
                begin
                       
                      if(Reset)
                      
                            for(integer i=0; i<8; i=i+1)
                            begin
                                reg_unit[i]<=16'h0000;
                                end
                      
                      else if(LD_REG)
                      
                                reg_unit[DR]<=bus_data;
                                
                          
                            
                 end
                 
 

                 
                 
                 
                 


                
                
                
    
    
endmodule
