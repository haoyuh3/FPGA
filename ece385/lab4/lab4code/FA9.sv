`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 19:52:38
// Design Name: 
// Module Name: FA9
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


module FA9(
            input logic[7:0] A,BB,
            input logic Cin,
            output logic[8:0] S,
            output logic Cout

    );
    logic c1,c2,c3;
    logic[8:0] B;
    assign B = ({BB[7],BB}^{8{Cin}});
    FA_4 FA1(A[3:0],B[3:0],Cin,c1,S[3:0]);
    FA_4 FA2(A[7:4],B[7:4],c1,c2,S[7:4]);
    fulladder FA3(A[7],B[7],c2,S[8],Cout);
    
    
    
    
endmodule
