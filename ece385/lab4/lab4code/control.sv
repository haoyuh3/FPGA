`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 20:06:06
// Design Name: 
// Module Name: control
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


module control( input logic Clk, Reset_Load_Clear, Run , 
                input logic M,// B[0]
                
                output logic Shift_EN, ADD_EN, SUB_EN,
                output logic Clear_XA,// clear A and X
                //output logic Clear_ldN // clear B and AX
                output logic LD_B
                
    );
    
                //Run should be inverse in toplevel
                enum logic [4:0] {A,A1,A2,A3, B, C, D, E, F, G, H, I, B1, C1, D1, E1, F1, G1, H1, I1, J}   curr_state, next_state; 
                
                
                //B C D E F G H I is used to add not shift  E1 F1 G1 H1 I1 is to shift
                
        always_ff @ (posedge Clk or posedge Reset_Load_Clear ) 
		begin
            if (Reset_Load_Clear) begin
                curr_state <= A1;
                //counter <= 16'h0000;
            end 
            else begin
                curr_state <= next_state;
                //counter <= next_counter; //This is the 'two-always' methodology, note that we can change
                                         //next counter via combinational logic.
            end
		end
		
		always_comb
		begin
		next_state = curr_state; 
		
		unique case (curr_state)
		
		A1: next_state=A2;
		A2:   next_state=A;
		A: if(Run)
		          next_state=A3;
		A3:       next_state=B;
		
		          
		B:        next_state=B1;
		B1:       next_state=C;
		C:        next_state=C1;
		C1:       next_state=D;
		D:        next_state=D1;
		D1:       next_state=E;
		E:        next_state=E1;
		E1:       next_state=F;
		F:        next_state=F1;
		F1:       next_state=G;
		G:        next_state=G1;
		G1:       next_state=H;
		H:        next_state=H1;
		H1:       next_state=I;
        	I:        next_state=I1;
        	I1:       next_state=J; 	
        	J:  if(~Run)
                    	  next_state=A;	
        
		
		endcase
		end
		
		always_comb
		begin
		      //default case shift only shift bits
		      Clear_XA=1'b0;
		      ADD_EN=1'b0;
		      SUB_EN=1'b0;
		      Shift_EN=1'b1;
		      LD_B=1'b0;
		     
		      
		      case(curr_state)
		      A:
		      begin
		           Clear_XA= 1'b0;
		           ADD_EN = 1'b0;
		           SUB_EN=1'b0;
		           Shift_EN=1'b0;
		           LD_B=1'b0;
		           
		           
		      end
		      A1: // LD value to regB
		      begin
		           Clear_XA= 1'b1;
		           ADD_EN = 1'b0;
		           SUB_EN=1'b0;
		           Shift_EN=1'b0;
		           LD_B=1'b1;
		      end
		      A2: 
		      begin
		           Clear_XA= 1'b1;
		           ADD_EN = 1'b0;
		           SUB_EN=1'b0;
		           Shift_EN=1'b0;
		           LD_B=1'b0;
		      end
		      A3:
		      begin
		           Clear_XA= 1'b1;
		           ADD_EN = 1'b0;
		           SUB_EN=1'b0;
		           Shift_EN=1'b0;
		           LD_B=1'b0;
		           
		           
		      end
		      B:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = M;
		            SUB_EN=1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
		      C:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = M;
		            SUB_EN=1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
		      D:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = M;
		            SUB_EN=1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
		      E:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = M;
		            SUB_EN=1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
		      F:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = M;
		            SUB_EN=1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
		      G:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = M;
		            SUB_EN=1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
		      H:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = M;
		            SUB_EN=1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
		      I:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = 1'b0;
		            SUB_EN=(M)? 1'b1:1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
		      J:
		      begin
		            Clear_XA= 1'b0;
		            ADD_EN = 1'b0;
		            SUB_EN=1'b0;
		            Shift_EN=1'b0;
		            LD_B=1'b0;
		            //Clear_ldN=1'b1;
		      end
//		      J1:
//		      begin
//		            Clear_XA= 1'b1;
//		            ADD_EN = 1'b0;
//		            SUB_EN=1'b0;
//		            Shift_EN=1'b0;
//		            LD_B=1'b0;
//		      end
		           
		      
		      endcase
		      

		
		
		
		end
		
		
		
endmodule
