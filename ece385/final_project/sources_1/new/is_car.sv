`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/17 12:40:54
// Design Name: 
// Module Name: is_car
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


module is_car( input  logic [9:0]x,y, 
               input  logic [9:0]centerx,centery,
               output logic show_car

    );
    always_comb          //x 1-91  center 46   y0-82  center 41     
    begin
        if((((x-centerx<=45)&&(x-centerx>=0))||((centerx-x<=45)&&(centerx-x>=0))) && (((y-centery<=41)&&(y-centery>=0))||((centery-y<=41)&&(centery-y>=0)))) begin       //
            show_car = 1;
            
        end
        else begin
            show_car = 0;
            
        end
    end              
endmodule
