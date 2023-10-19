`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/22 20:59:15
// Design Name: 
// Module Name: MUX
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


module MUX_BUS( input logic[3:0] sel,
                input logic [15:0] PC_bus,
                input logic [15:0] MAR_bus,
                input logic[15:0] MDR_bus,
                input logic [15:0] ALU_bus,
                output logic[15:0] BUS
                
                );
                
                always_comb
                begin
                case(sel)
                4'b0001 : BUS=PC_bus;
                4'b0010 : BUS=MAR_bus;
                4'b0100 : BUS=MDR_bus;
                4'b1000 : BUS=ALU_bus;
                default: BUS= 16'h0000;
                endcase
                end
                
endmodule

module MUX2#(parameter w=16)
            (    input logic  sel,
                input logic [w-1:0] A,
                input logic [w-1:0] B,
                output logic [w-1:0] C
            );
            always_comb
            begin
            case(sel)
            1'b0: C=A;
            1'b1: C=B;
            //default: C=16'h0000;
            endcase
            end
endmodule    

module MUX4(    input logic[1:0]  sel,
                input logic [15:0] A,
                input logic [15:0] B,
                input logic [15:0] C,
                input logic [15:0] D,
                output logic [15:0] E
            );
            always_comb
            begin
            case(sel)
            2'b00: E=A;
            2'b01: E=B;
            2'b10: E=C;
            2'b11: E=D;
            default: E=16'h0000;
            endcase
            end
endmodule                