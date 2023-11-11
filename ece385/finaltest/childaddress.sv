`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/10 14:42:55
// Design Name: 
// Module Name: childaddress
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


module child_address(   input  logic show_child,
                        input  logic [9:0]x,y, 
                        input  logic [9:0]centerx,centery,
                        input  logic [1:0] run_child,
                        input  logic hit,
                        output  logic [17:0] addra

    );
    logic [9:0]spiritex,spiritey;
    always_comb
    begin: address_child
    // //x  29 3-55    193   y      30 0-60    
    spiritex = x - (centerx) + 29;
    spiritey = y - (centery) + 30;
    if(show_child) begin
           if((run_child==0)&&(~hit))//still
           begin
                addra = spiritex + spiritey * 177;
           end
           else if((run_child==1)&&(~hit))
           begin
                addra = spiritex + 63 + spiritey * 177;
           end
           else begin
                addra = spiritex + 117 + spiritey * 177;
           end
    end
    else begin
        addra = 0;
    end
    end
endmodule
