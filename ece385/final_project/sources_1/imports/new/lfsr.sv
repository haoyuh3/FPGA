`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 03:52:41 PM
// Design Name: 
// Module Name: lfsr
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


module lfsr(
    input rst,
    input start,
    input [2:0] seed,
    input clk,
    output [2:0] spd
    );
    // 64-bit LFSR implementing XNOR (Xilinx FPGAs initializes to 0)
    logic[63:0] lfsr;
    always_ff @(posedge clk) begin
        if(start ^ ~rst)
            lfsr <= seed;
        else begin
            lfsr <= {lfsr[62:0],lfsr[63]~^lfsr[62]~^lfsr[60]~^lfsr[59]};
        end
    end
    assign spd = (lfsr%4)+1;
endmodule
