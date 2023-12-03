`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/17 12:55:36
// Design Name: 
// Module Name: car_address
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


module car_address( input logic show_car,
                    input logic [9:0] x,y,
                    input logic [9:0] centerx_car,centery_car,
                    output logic [15:0] addra_car

    );
    logic [9:0]spiritex,spiritey;
    always_comb
    begin: address_car
    //x 1-91  center 46   y0-82  center 41   
    spiritex = x - (centerx_car) + 46;
    spiritey = y - (centery_car) + 41;
    if(show_car)begin
        addra_car = spiritex + spiritey * 92;
    end
    else begin
        addra_car = 0;
    end
    
    end
endmodule
