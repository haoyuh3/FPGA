`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 10:47:53
// Design Name: 
// Module Name: score_board
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


module score_board( input logic [9:0] left, upper,
                    input logic [9:0]x,y,
                    input logic CLK,
                    input logic[3:0] score1, score2,
                    output logic show_black

    );                                             
    // 2 numbers  each 8 pixels --16 pixel single line ---16 pixel       0-15 
    logic show_score;
    logic[9:0] offset_x, offset_y;
    logic[9:0] num;
    logic [2:0] modulo;
    logic [2:0] offset2;
    logic [3:0]display_num;
    logic [7:0] addra,data;
    always_comb
    begin: check_score
        if((x-left>=0) && (x-left < 16) && (y-upper >= 0) && (y-upper < 16))begin
            show_score = 1;
            offset_x = x - left;
            offset_y = y - upper;
        end
        else  begin
            show_score = 0;
            offset_x   = 0;
            offset_y   = 0;
        end
        num = offset_x >> 3;
        modulo = offset_x & (3'b111);
        offset2 = 7 - modulo;
        if(num == 0)begin
            display_num = score1;
        end
        else begin
            display_num = score2;
        end
        
        addra = display_num * 16 + offset_y;
        
        
        
    
    end
    blk_mem_gen_4 num_ram(.addra(addra),.clka(CLK),.ena(show_score),.douta(data));
    
    
    
    always_comb begin
        if(show_score && (data[offset2]==1))begin
            show_black = 1;
        end
        else begin
            show_black = 0;
        end
        
        
    end
    
    
    
endmodule
