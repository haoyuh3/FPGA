module ripple_adder
(
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
    logic c1,c2,c3;
    FA_4 FA1(A[3:0],B[3:0],cin,c1,S[3:0]);
    FA_4 FA2(A[7:4],B[7:4],c1,c2,S[7:4]);
    FA_4 FA3(A[11:8],B[11:8],c2,c3,S[11:8]);
    FA_4 FA4(A[15:12],B[15:12],c3,cout,S[15:12]);
endmodule