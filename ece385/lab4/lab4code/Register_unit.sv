module register_unit (input  logic Clk, ResetA,ResetB, A_In, Ld_A, Ld_B, 
                            Shift_En,
                      input  logic [7:0]  sum,S, 
                      output logic B_out, 
                      output logic [7:0]  A,
                      output logic [7:0]  B);

    logic A_out;
    // reg load sum    regb load switch      reg A shift in X   regB shift in  A_out
    reg_8  reg_A (.Clk(Clk),.Reset(ResetA), .Shift_In(A_In),.D(sum), .Load(Ld_A),. Shift_En(Shift_En),
	               .Shift_Out(A_out), .Data_Out(A));
    reg_8  reg_B (.Clk(Clk),.Reset(ResetB), .Shift_In(A_out),.D(S), .Load(Ld_B), . Shift_En(Shift_En),
	               .Shift_Out(B_out), .Data_Out(B));

endmodule
//read
