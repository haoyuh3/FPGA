`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/29 11:21:24
// Design Name: 
// Module Name: check_back
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


module check_back( input logic [9:0] left,upper,
                    input logic [9:0] x,y,
                    output logic in,
                    output logic[15:0] addra

    );
    always_comb
    begin
        if((x-left >=0) && (x-left <= 39) && (y-upper >= 0) && (y-upper <= 30))begin
            in = 1;
            addra = x - left + (y-upper) * 40;   
        end
        else begin
            in = 0;
            addra =0;
        end
    end
    
endmodule


module check_cloud( input logic [9:0] left,upper,
                    input logic [9:0] left1, upper1,
                    input logic [9:0] left2, upper2,
                    input logic [9:0] x,y,
                    output logic in,
                    output logic[10:0] addra

    );
    always_comb
    begin
        if((x-left >=0) && (x-left <= 49) && (y-upper >= 0) && (y-upper <= 39))begin
            in = 1;
            addra = x - left + (y-upper) * 50;   
        end
        else if((x-left1 >=0) && (x-left1 <= 49) && (y-upper1 >= 0) && (y-upper1 <= 39))begin
            in = 1;
            addra = x - left1 + (y-upper1) * 50;   
        end
        else if((x-left2 >=0) && (x-left2 <= 49) && (y-upper2 >= 0) && (y-upper2 <= 39))begin
            in = 1;
            addra = x - left2 + (y-upper2) * 50;   
        end
        else begin
            in = 0;
            addra =0;
        end
    end
    
endmodule


module check_game_start( input logic [9:0] left,upper,
                    input logic [9:0] x,y,
                    output logic in,
                    output logic[11:0] addra

    );
    always_comb
    begin
        if((x-left >=0) && (x-left <= 59) && (y-upper >= 0) && (y-upper <= 39))begin
            in = 1;
            addra = x - left + (y-upper) * 60;   
        end
        else begin
            in = 0;
            addra =0;
        end
    end
    
endmodule
