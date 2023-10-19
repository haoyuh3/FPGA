`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 22:46:28
// Design Name: 
// Module Name: toplevel
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


module toplevel(input logic Clk,
                input logic Reset_Load_Clear,
                input logic Run,
                input logic[7:0] SW,
                output logic   [7:0]   hex_seg,
                output logic   [3:0]   hex_grid,
                output logic   [7:0] Aval, Bval,
                output logic X
                        
       			   

    );
    
    logic LD_B;
    logic Run_h;
    logic Reset_h;
    logic [7:0]SW_in; // switch value
    logic [7:0]S_adder;
    logic [7:0] A,B; //reg value
    logic Clr_Ld, Clr_XA,ADD,SUB,shift_en, cout;
    logic M;
    logic [8:0] sum;
    assign Aval=A;
    assign Bval=B;
    assign S_adder=(ADD|SUB)? SW_in:8'h00;
    
    //update x---------------------
    always_ff @ (posedge Clk)
    begin
        if(Clr_XA)
                X<=0;
         else
              if(ADD|SUB)
                        X<=sum[8];
               else
                        X<=X;
                        
    end
    
    
    
    
    //--------------------------
    
    // clear reg
    //every run should begin from clear clear X and A
    // when reset press ld_b   ld sw to B  and clear XA
    
    
    register_unit	reg_unit (
								.Clk(Clk),
                                .ResetA(Reset_h|Clr_XA), // control by reset and automatically reset
								.ResetB(1'b0),
								.A_In(X),
                                .Ld_A(ADD|SUB), 
                                .Ld_B(LD_B),
                                .Shift_En(shift_en),
                                .sum(sum[7:0]),
                                .S(SW_in),
                                .B_out(M),
                                .A(A),
                                .B(B) 
                              );
     FA9            FAadder(
                                .A(A),
                                .BB(S_adder),
                                .Cin(SUB),
                                .S(sum),
                                .Cout(cout)
                               );
     control       control1( .Clk(Clk), 
                            .Reset_Load_Clear(Reset_h), 
                            .Run(Run_h), 
                            .M(M),// B[0]
                            .Shift_EN(shift_en), 
                            .ADD_EN(ADD), 
                            .SUB_EN(SUB),
                            .Clear_XA(Clr_XA), // clear A and X
                            .LD_B(LD_B)
                            
                
    );
      
   
   
   
   sync button_[1:0] (Clk,{Reset_Load_Clear, Run},{Reset_h, Run_h});
   sync sw_sync[7:0] (Clk, SW, SW_in);
    
    
    
    
    
    
    
    
    
    
    
    HexDriver Hex (
			.clk(Clk),
			.reset(Reset_Load_Clear),
			.in({Aval[7:4], Aval[3:0],Bval[7:4], Bval[3:0]}),
			.hex_seg(hex_seg),
			.hex_grid(hex_grid)
		);
endmodule
