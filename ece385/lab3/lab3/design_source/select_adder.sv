`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/08 22:42:10
// Design Name: 
// Module Name: select_adder
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


module select_adder(
                    input logic[15:0]A,
                    input logic[15:0]B,
                    input logic cin,
                    output logic [15:0] S,
	                output logic        cout
                    

    );
                    logic [11:0] pre_sum0;
                    logic [11:0] pre_sum1;
                    logic c4,c80,c81,c120,c121,c160,c161;
                    logic c8,c12;
    
                    always_comb
                    begin
                    c8=(c4)? c81:c80;
                    c12=(c8)? c121:c120;
                    cout=(c12)? c161:c160;
                    
                    if(c4)
                            S[7:4]=pre_sum1[3:0];
                    else
                            S[7:4]=pre_sum0[3:0];
                            
                    if(c8)
                            S[11:8]=pre_sum1[7:4];
                    else
                            S[11:8]=pre_sum0[7:4];
                       
                       
                    if(c12)
                            S[15:12]=pre_sum1[11:8];
                    else
                            S[15:12]=pre_sum0[11:8];
                    
                    end
    
                    FA_4 FA1(A[3:0],B[3:0],cin,c4,S[3:0]);
                    
            
                    FA_4 FA20(A[7:4],B[7:4],1'b0,c80,pre_sum0[3:0]);
                    FA_4 FA21(A[7:4],B[7:4],1'b1,c81,pre_sum1[3:0]);
                    
                    
                    FA_4 FA30(A[11:8],B[11:8],1'b0,c120,pre_sum0[7:4]);
                    FA_4 FA31(A[11:8],B[11:8],1'b1,c121,pre_sum1[7:4]);
                    
                    
                    FA_4 FA40(A[15:12],B[15:12],1'b0,c160,pre_sum0[11:8]);
                    FA_4 FA41(A[15:12],B[15:12],1'b1,c161,pre_sum1[11:8]);
                    
endmodule
