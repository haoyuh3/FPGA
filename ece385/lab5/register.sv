`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/22 22:18:39
// Design Name: 
// Module Name: register
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


module register#(parameter w=16)
                                    (input logic Clk,
                                    input logic Reset,
                                    input logic Load,
                                    input logic [w-1:0]In,
                                    output logic [w-1:0] Out
                                    );
    logic [w-1:0] R;
    always_ff @ (posedge Clk)
    begin
           Out<=R; 
	end
	always_comb begin
                R = Out;
    if (Reset) // Synchronous Reset
                R = 0;
    else if(Load)
			     R = In;
    end
                                             
endmodule
