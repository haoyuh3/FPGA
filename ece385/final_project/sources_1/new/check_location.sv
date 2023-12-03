`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/08 23:00:40
// Design Name: 
// Module Name: check_location
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


module is_joe( input  logic [9:0]x,y, 
               input  logic [9:0]centerx,centery,
               input logic[1:0] hit_joe,
               output logic show_joe

    );
    always_comb          //x 3-87        y 0-92                 
    begin
        if((((x-centerx<=42)&&(x-centerx>=0))||((centerx-x<=42)&&(centerx-x>=0))) && (((y-centery<=46)&&(y-centery>=0))||((centery-y<=46)&&(centery-y>=0)))) begin       //
            if(hit_joe == 2'b00)begin
                show_joe = 1;
            end
            else begin
                show_joe = 0;
            end
            
            
        end
        else begin
            show_joe = 0;
            
        end
    end              
endmodule



module is_joe_fly( input  logic [9:0]x,y, 
               input  logic [9:0]centerx,centery,
               input logic[1:0] hit_joe,
               output logic show_joe_fly

    );
    always_comb          //x 0-82        y 0-88                 
    begin
        if((((x-centerx<=41)&&(x-centerx>=0))||((centerx-x<=41)&&(centerx-x>=0))) && (((y-centery<=44)&&(y-centery>=0))||((centery-y<=44)&&(centery-y>=0)))) begin       //
            if(hit_joe != 2'b00)begin
                show_joe_fly = 1;
            end
            else begin
                show_joe_fly = 0;
            end
            
        end
        else begin
            show_joe_fly = 0;
            
        end
    end              
endmodule
