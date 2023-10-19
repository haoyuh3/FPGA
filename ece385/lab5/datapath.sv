`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/22 20:58:49
// Design Name: 
// Module Name: datapath
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


module datapath(     input logic Clk,
					 input logic Reset,
					 input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
					 input logic GatePC, GateMDR, GateALU, GateMARMUX,
					 input logic SR2MUX, ADDR1MUX, MARMUX,
					 input logic [1:0] PCMUX, ADDR2MUX, ALUK,
					 input logic MIO_EN, DRMUX, SR1MUX,
					 input logic [15:0]MDR_In,
					 output logic BEN,
					 output logic [15:0]IR,
					 output logic [15:0]MDR,
					 output logic [15:0]MAR,
					 output logic [15:0]LED,
					 output logic [15:0]PC
                 

    );
    logic [15:0] BUS, PC_val,MDR_val;
    logic [15:0] adder_out,ALU_out,Add1,Add2,sext5,sext6,sext9,sext11;
    logic [15:0] PC_add1;
    logic [2:0] NZP_com,NZP;
    logic BEN_com;
    logic [15:0] SR1_out, SR2_out,SR2_muxout;
    logic[2:0] SR1_muxout;
    logic [2:0] DR_REG;
    //------------register----------------
   
    
    register MAR_R(Clk, Reset, LD_MAR, BUS , MAR); //MAR get value from BUS
    
    register MDR_R(Clk, Reset, LD_MDR, MDR_val , MDR);
    register PC_R( Clk, Reset, LD_PC, PC_val , PC); // PC get value from PC MUX output go to MAR
    
    register IR_R(Clk, Reset, LD_IR, BUS, IR); //IR get value from BUS
    
    
    
	register  Reg_LED (Clk, Reset, LD_LED, IR[15:0],LED);//LED
	
	register #(3)  Reg_NZP (Clk,Reset,LD_CC,NZP_com,NZP);

	register #(1)  Reg_BEN (Clk, Reset,LD_BEN,BEN_com,BEN);
     
  
     //---------MUX--------------------------
    
    //MUX bus
    MUX_BUS bus({GateALU,GateMDR,GateMARMUX,GatePC},PC,adder_out,MDR,ALU_out,BUS);
    
    // MUX PC
    MUX4 Mux_PC(PCMUX,PC_add1,BUS,adder_out,16'h0000,PC_val);
    
    //MUX MDR
    MUX2 Mux_MDR( MIO_EN, BUS, MDR_In, MDR_val);
    
    MUX4 MUX_adder2(ADDR2MUX, 16'h0000,sext6,sext9,sext11,Add2);
    
    MUX2 MUX_adder1(ADDR1MUX, PC, SR1_out, Add1);
    
    //DR mux
    MUX2 #(3) DR_MUX(DRMUX,IR[11:9],3'b111,DR_REG);
    //SR1_mux
     MUX2 #(3) SR1_MUX(SR1MUX,IR[11:9],IR[8:6],SR1_muxout);
    //SR2_mux
    MUX2 SR2_MUX(SR2MUX, SR2_out, sext5, SR2_muxout);
    
    //---------------------------sext---------------
    
    sext1 SEXT( IR, sext11, sext9, sext6, sext5);
    
    
    
    //------------------ALU---------------------------
    
    
    ALU alu( SR1_out, SR2_muxout, ALUK, ALU_out);
    
    //----------------Reg FILE------------------------
    
    //reg file unit
    
    
    
    REG_file myreg(Clk, Reset,DR_REG, SR1_muxout, IR[2:0],BUS,LD_REG,SR1_out,SR2_out);
    
    
    
    
    
    
    //----------update PC------------------
    //----------addresss
    
   
    
    always_comb
    begin
            adder_out = Add2+Add1;
            PC_add1=PC+1;
            //NZP
            if(BUS==16'h0000)
                            NZP_com=3'b010;
            else if(BUS[15]==1)
                            NZP_com=3'b100;
            else
                            NZP_com=3'b001;
            BEN_com = (IR[11]&NZP[2])+(IR[10]&NZP[1])+(IR[9]&NZP[0]);
    
    end
    
    
    
endmodule
