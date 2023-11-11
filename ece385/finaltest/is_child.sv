`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/10 00:51:27
// Design Name: 
// Module Name: is_child
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


module is_child( input  logic [9:0]x,y, 
               input  logic [9:0]centerx,centery,
               output logic show_child

    );
    always_comb          //x  29 3-55    193   y      30 0-60       
    begin
        if((((x-centerx<=26)&&(x-centerx>=0))||((centerx-x<=26)&&(centerx-x>=0))) && (((y-centery<=30)&&(y-centery>=0))||((centery-y<=30)&&(centery-y>=0)))) begin       //
            show_child = 1;
            
        end
        else begin
            show_child = 0;
            
        end
    end              
endmodule
