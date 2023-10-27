`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/23 11:14:38
// Design Name: 
// Module Name: testbench1
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


module testbench1();
timeunit 10ns;
timeprecision 1ns;

logic [15:0] SW;
logic	Clk=0, Reset,Run, Continue;
logic [15:0] LED;
logic [7:0] hex_seg;
logic [3:0] hex_grid;
logic [7:0] hex_segB;
logic [3:0] hex_gridB;
logic [15:0] PC, MAR, MDR, IR;
//test
logic LD_PC,LD_IR,LD_MDR;
logic [15:0] ADDER,MDR_In,Darasram,Data_from_SRAM,Data_to_CPU;
slc3_testtop test(.*);

always begin
#1  PC = test.slc.d0.PC;
	MAR = test.slc.d0.MAR;
	MDR = test.slc.d0.MDR;
	IR = test.slc.d0.IR;	
	LD_PC= test.slc.state_controller.LD_PC;
	LD_IR= test.slc.d0.LD_IR;
	LD_MDR= test.slc.d0.LD_MDR;
	ADDER=test.slc.memory_subsystem.ADDR;
	MDR_In=test.slc.memory_subsystem.Data_to_CPU;
	Darasram=test.slc.Data_from_SRAM;
	
	Data_to_CPU= test.slc.memory_subsystem.Data_to_CPU;
	 Data_from_SRAM=test.slc.memory_subsystem.Data_from_SRAM;
	 
	end
always #1 Clk = ~Clk;
initial begin
//       Reset = 1;
//		Continue = 1;
//		Run = 0;
//		SW= 16'h0003;
//	#1	Continue=0;
		
//	    #2 Reset = 0;
//	    #2 Run = 1;
	     
	     
//	    #10 Continue = 0;
//	    #5 Continue = 1;
//	   SW = 16'd0075;
//	   #5 Continue = 0;
	    
	    //#20 Reset=1;
	
	// run again to see if fetch automatically halts
//	    #10 Continue = 0;
//	    #5 Continue = 1;
//	    SW = 16'd0075;
//	    #5 Continue = 0;


Reset = 1;
		Continue = 0;
		Run = 0;
	   SW = 16'd0074;
	#2 Reset = 0;
	#2 Run = 1;
	
	// run again to see if fetch automatically halts
	#10 Continue = 0;
	#5 Continue = 1;
	   SW = 16'd0075;
	#5 Continue = 0;
	
	
	#5 Continue=1;
	
	#10 Continue=0;
	#5 Continue=1;
	#10 Continue=0;
	#5 Continue=1;
	#10 Continue=0;
	#5 Continue=1;
	
	#10 Continue=0;
	#5 Continue=1;
	#10 Continue=0;
	#5 Continue=1;
	end


endmodule
