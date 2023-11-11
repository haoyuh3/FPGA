`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/04 22:20:04
// Design Name: 
// Module Name: color_mappertest
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


module color_mappertest( input  logic [9:0]x,y, 
                         input  logic [9:0]centerx,centery,
                         input  logic CLK,
                         input  logic[1:0]joe_run_left,  // run have 3 frame
                         input  logic[1:0]joe_run_right, 
                         input  logic right_hand_warm,   // raise red warm
                         input  logic stand,             // stand still
                         input  logic left_hand_go,      // left hand
                         // child
                         input [9:0] centerx_child1,
                         input [9:0] centery_child1,
                         
                         
                       output logic [7:0] red, green, blue

    );
    logic ena;
    logic [23:0]joe_rgb,child_rgb;
    logic[17:0] addra_joe,addra_child;
    logic [7:0] joe_red,child_red;
    logic hit;
    logic [1:0]run_child;
    //enum logic [3:0] {background, joe, child, car} draw_object;
    logic show_joe,show_child;
    
    
    // ----------check what can be in this location
    is_joe check_joe_in(x,y,centerx,centery,show_joe);
    is_child child1(x,y,centerx_child1,centery_child1, show_child);
    // ----------------------------------------------                                                                        
    
    always_comb 
    begin
        if(show_child && (child_rgb != 24'hffffff) )
        begin
            red  = child_rgb[23:16];
            green= child_rgb[15:8];
            blue = child_rgb[7:0];
             
         end
    
        else if(show_joe && (joe_rgb != 24'hffffff))
        begin
            red = joe_rgb[23:16];
            green =joe_rgb[15:8];
            blue = joe_rgb[7:0];
             
         end
        else
        begin
            red =  8'hFF;
            green =8'hFF;
            blue = 8'hFF;
        end
    end
    
    
   
    joe_address joe_address1   (show_joe,x,y,centerx,centery,joe_run_left,joe_run_right,right_hand_warm,stand,left_hand_go,addra_joe);
    child_address child1address(show_child, x, y, centerx_child1, centery_child1,1'd0, hit, addra_child );
    
    blk_mem_gen_0 ram_joe   (.addra(addra_joe), .clka(CLK),.dina(),.douta(joe_red),.ena(show_joe),.wea(1'b0));
    blk_mem_gen_1 ram_child (.addra(addra_child), .clka(CLK),.dina(),.douta(child_red),.ena(show_child),.wea(1'b0));
    
    joe_color joe1_color(.joe_red(joe_red),.joe_rgb(joe_rgb));
    child_color child_color1(.child_red(child_red),.child_rgb(child_rgb));
    
 endmodule