`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 19:57:41
// Design Name: 
// Module Name: testbenchadder
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


module testbenchadder();
timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

logic Clk=0;
logic Reset_Load_Clear;
logic Run;
logic[7:0] SW;
logic   [7:0]   hex_seg;
logic   [3:0]   hex_grid;
logic   [7:0] Aval, Bval;
logic X;
toplevel top(.*);

always #1 Clk = ~Clk;
initial begin
//        Run=0;
//        SW=8'h00;
//        Reset_Load_Clear=1;
//        Reset_Load_Clear=0;
//#2     
//        SW=8'b11000101;

//        Reset_Load_Clear=1;
// #2     Reset_Load_Clear=0;
 
// #2     SW=8'b00000111;
 
// #4     Run=1;
 
// #4     Run=0;
 
// #80    Run=1;

// Run=0;
//        SW=8'hff;
//        Reset_Load_Clear=1;
//        Reset_Load_Clear=0;
//#2     
//        SW=8'b00000001;

//        Reset_Load_Clear=1;
// #2     Reset_Load_Clear=0;
 
// #2     SW=8'hff;
 
// #4     Run=1;
 
// #4     Run=0;
 
// #80    Run=1;

Run=0;
        SW=8'hff;
        
        Reset_Load_Clear=0;
#2     
        SW=8'hff;

        Reset_Load_Clear=1;
 #2     Reset_Load_Clear=0;
 
 #2     SW=8'hff;
 
 #4     Run=1;
 
 #4     Run=0;
 
 


 

 

        
end



endmodule
