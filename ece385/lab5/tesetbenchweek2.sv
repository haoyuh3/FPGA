`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/29 15:40:52
// Design Name: 
// Module Name: tesetbenchweek2
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


module tesetbenchweek2();
timeunit 10ns;
timeprecision 1ns;

logic [15:0] SW;
logic	Clk=0, Reset,Run, Continue=0;
logic [15:0] LED;
logic [7:0] hex_seg;
logic [3:0] hex_grid;
logic [7:0] hex_segB;
logic [3:0] hex_gridB;
logic [15:0] PC, MAR, MDR, IR,Hex_data;
//test



logic  [7:0] hex_seg_;
logic [3:0]hex_4[3:0]; 
slc3_testtop test(.*);

always begin
#1  PC = test.slc.d0.PC;
	MAR = test.slc.d0.MAR;
	MDR = test.slc.d0.MDR;
	IR = test.slc.d0.IR;	
//	LD_PC= test.slc.state_controller.LD_PC;
//	LD_IR= test.slc.d0.LD_IR;
//	LD_MDR= test.slc.d0.LD_MDR;
//	LD_LED=test.slc.d0.LD_LED;
//	ADDER=test.slc.memory_subsystem.ADDR;
//	 hex_seg_=test.slc.hex_seg;
//	SR1=test.slc.d0.myreg.SR1_out;
//	SR2=test.slc.d0.myreg.SR2_out;
//	SR1mux= test.slc.d0.myreg.SR1_m;
//	adder_out=test.slc.d0.adder_out;
//	PC_val=test.slc.d0.PC_val;
//	PCMUX=test.slc.d0.PCMUX;
hex_4=test.slc.hex_4;
//Hex_data=test.slc.memory_subsystem.hex_data;
	end
always #1 Clk = ~Clk;
initial begin
        Reset = 1;
		Continue = 0;
		Run = 0;
        #2 Reset = 0;
        
        //////////test1///////////
	#2 Run = 1;
	#2 Run = 0;
	   SW = 16'h0003;
	// change switch values to see if hex display is correct
	//#100 SW = 16'hFFFF;
     
  
   #100 SW=16'h5020;
   
	// reset program
	
	   Run = 1;


       ///////////test2//////////////
  
        
       
//		
  
//		Run = 1;
//	   SW = 16'h0006;
//	// see if the hex displays values after continue is hit
	
//   #100 Continue = 1;
//        SW=16'h5020;
        
//	// hit continue
//   #10 Continue = 0;
//	#100 Continue = 1;
//	#10 Continue=0;
	
//	#100 Continue=1;
//	SW=16'h623f;
//	#10 Continue=0;

 	
 	////////test3/////////////////////
 	

	
//		Run = 1;
//		SW = 16'h000B;
//	// see if the hex display increment by 1 each time continue is hit
//	#100 Continue = 0;
//	#10 Continue = 1;
//	#100 Continue = 0;
//	#10 Continue = 1;
//	#100 Continue = 0;
//	#10 Continue = 1;
	
	
//	// reset program
	
//	   Run = 1;

	/////////test4///////////////
	
	
//   #10 Continue = 1;
//		Run = 1;
//		SW = 16'h0014;
//	// XOR xEEEE and x1111, and the result should be xFFFF
//	// enter xEEEE
//	#100 SW = 16'hEEEE;
//	   Continue = 0;
//	#10 Continue = 1;
//	// enter x1111
//	#100 SW = 16'h1111;
//	   Continue = 0;
//	#10 Continue = 1;
//	// reset program
//	#200 Reset = 0;
//	   Run = 1; 


      ////////////////test5/////////////
      
     
//	#10 Continue = 1;
//		Run = 1;
//		SW = 16'h0031;
//	// x2020 multiplies x0005, and the result should be xA0A0
//	// enter x0005
//	#200 SW = 16'h0005;
//	   Continue = 0;
//	#10 Continue = 1;
//	// enter x2020
//	#150 SW = 16'h2020;
//	   Continue = 0;
//	#10 Continue = 1;
//	// reset program
//	#1000 Reset = 1;
//	   Run = 1;
		
		

        /////////////actonce///////////
        // "Act Once" Test
	
//	#10 Continue = 1;
//		SW = 16'h002A;
//		Run = 1;
//	// Hex should count up by 1 each time, starting from 0
//	#150 Continue = 0;
//	#10 Continue = 1;
//	#100 Continue = 0;
//	#10 Continue = 1;
//	#100 Continue = 0;
//	#10 Continue = 1;
//	// reset program
//	#100 Reset = 1;
//	   Run = 1;

            //////auto counting
//           #10 SW=16'h009C;
//               Run=1;


       
       

end
endmodule
