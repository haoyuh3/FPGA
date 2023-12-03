`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 11:36:26
// Design Name: 
// Module Name: testadder
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


module testadder();
timeunit 10ns;
timeprecision 1ns;

logic vsync, reset_ah,overflow,childx;
logic[3:0] update_score1;
logic [3:0] update_score2;
logic [3:0] score1, score2;
add_unit myunit(.*);
always #1 vsync = ~vsync;

initial begin
    vsync = 0;
    reset_ah = 1;
    childx = 1;
    
    #2 reset_ah = 0;
    
    #10 childx = 0;
    #11 childx = 1;
       
  
end
endmodule
