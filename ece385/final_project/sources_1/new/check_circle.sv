`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/28 21:04:50
// Design Name: 
// Module Name: check_circle
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


module check_circle( input logic[9:0] x,y,
                     input logic[9:0] centerx,centery,
                     output logic in
                    
    );
    logic [15:0] dis;
    always_comb begin
    in =0;
    if((x > 388) && (y<40))begin
        dis = (x-centerx) * (x-centerx) + (y-centery) * (y-centery);
        if(dis <= 9 )
            in =1;
        else in = 0;
    end
    else in =0;
    end
endmodule
