`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 23:23:23
// Design Name: 
// Module Name: fulladder
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


module fulladder(
                input logic A,B,
                input logic Cin,
                output logic sum,
                output logic Cout
    );

                assign sum=A^B^Cin;
                assign Cout=(A&B)|(A&Cin)|(B&Cin);
endmodule           
module FA_4 (
            input logic [3:0]A,
            input logic [3:0]B,
            input logic Cin,
            output logic Cout,
            output logic [3:0]sum
);   
            logic cout1,cout2,cout3;
            fulladder fulladder1(A[0],B[0],Cin,sum[0],cout1);
            fulladder fulladder2(A[1],B[1],cout1,sum[1],cout2);
            fulladder fulladder3(A[2],B[2],cout2,sum[2],cout3);
            fulladder fulladder4(A[3],B[3],cout3,sum[3],Cout);
            
            
endmodule
