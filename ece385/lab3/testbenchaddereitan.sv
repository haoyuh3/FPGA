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
        Run=0;
        Reset_Load_Clear=0;
#2      SW=8'hc5;
        Reset_Load_Clear=1;
#3      Reset_Load_Clear = 0;
#3        SW=8'h07;
#4      Run = 1;

#40     Run = 0;

#2      SW=8'h07;
        Reset_Load_Clear=1;
#5      Reset_Load_Clear = 0;
#3        SW=8'hc5;
#4      Run = 1;

#40     Run = 0;

#2      SW=8'hf9;
        Reset_Load_Clear=1;
#5      Reset_Load_Clear = 0;
#3        SW=8'hc5;
#4      Run = 1;

#40     Run = 0;

#2      SW=8'hc5;
        Reset_Load_Clear=1;
#5      Reset_Load_Clear = 0;
#3        SW=8'hf9;
#4      Run = 1;

#40     Run = 0;




end



endmodule
