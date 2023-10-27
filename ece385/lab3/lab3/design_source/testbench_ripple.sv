`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/13 21:49:13
// Design Name: 
// Module Name: testbench_ripple
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


module testbench_ripple();
timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the adder will be 
// instantiated as a submodule in testbench.
logic[15:0] A;
logic[15:0] B;
logic cin;
logic[15:0] S_ripple;
logic cout;
ripple_adder top(A,B,cin,S_ripple,cout);

// Toggle the clock
// #1 means wait for a delay of 1 timeunit


// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
A=16'h0000;
B=16'h0000;
cin=0;
cout=0;
#2 A=16'h0001;
#2 B=16'h0001;
#2 A=16'hffff;
    B=16'h0001;
    



end

endmodule
