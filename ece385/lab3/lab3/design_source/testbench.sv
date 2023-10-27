// To test your adder one in a time. 
// Leave the adder you want to test uncomment in the top level


module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the adder will be 
// instantiated as a submodule in testbench.
logic[15:0] A;
logic[15:0] B;
logic cin;
logic[15:0] S;
logic cout;
select_adder top(.*);

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