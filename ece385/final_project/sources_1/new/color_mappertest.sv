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
                         
                         input logic[1:0] hit_joe,
                         // child1

                         input [9:0] centerx_child1,
                         input [9:0] centery_child1,
                         input logic [1:0]run_child,
                         input logic hit,
                         
                         //child2green
                         input [9:0] centerx_child2,
                         input [9:0] centery_child2,
                         input logic [1:0]run_child2,
                         input logic hit2,
                         //
                         //child3
                         input [9:0] centerx_child3,
                         input [9:0] centery_child3,
                         input logic [1:0]run_child3,
                         input logic hit3,
                         
                         //
                         input [9:0] centerx_child4,
                         input [9:0] centery_child4,
                         input logic [1:0]run_child4,
                         input logic hit4,
                         
                         //
                         
                         input logic[9:0] centerx_car,
                         input logic[9:0] centery_car,
                         
                         input logic[9:0] centerx_car2,
                         input logic[9:0] centery_car2,
                         
                         input logic[3:0] score1, score2,
                         
                         output logic [7:0] red, green, blue,
                         input logic start_game,
                         input logic end_game,
                         input logic [4:0] hit_counter

    );
    //logic ena;
    logic [23:0]joe_rgb,joe_fly_rgb,child_rgb,child2_rgb,child3_rgb,child4_rgb,car_rgb,start_rgb,background_rgb;
    logic[15:0] addra_joe,addra_back;//change;
    logic[12:0] addra_joe_fly; //change
    logic[13:0] addra_child,addra_child2, addra_child3,addra_child4;
    logic [17:0] addra_background;
    logic [11:0] addra_game_start;
    logic [10:0] addra_cloud;
    logic cloud_red, in_cloud,game_start_red,in_game_start;
    logic[15:0] addra_car;
    logic [7:0] joe_red,joe_fly_red,child_red,child2_red, child3_red,child4_red,car_red,start_red,background_red;
    logic show_joe,show_joe_fly,show_child,show_car,show_car2, show_car_exist;
    logic show_child2,show_child3,show_child4;
    logic in_background;
    logic show_blacknum;
    
    logic [9:0] car_x_coor, car_y_coor;
    
    logic in1,in2,in3,in4,in5,in_back;
    
    always_comb begin
        if(show_car)begin
            car_x_coor = centerx_car;
            car_y_coor = centery_car;     
        end
        else if(show_car2)begin
            car_x_coor = centerx_car2;
            car_y_coor = centery_car2;
        end
        else begin
            car_x_coor = 0;
            car_y_coor = 0;
        end
    end
    
    
    
    // ----------check what can be in this location
    is_joe   check_joe_in(x,y,centerx,centery,hit_joe,show_joe);
    is_joe_fly fly_joe   (x,y,centerx,centery,hit_joe,show_joe_fly);
    is_child child1(x,y,centerx_child1,centery_child1, show_child);
    
    is_child child_green(x,y,centerx_child2,centery_child2, show_child2);
    is_child child3_yellow(x,y,centerx_child3,centery_child3, show_child3);
    is_child child4_green(x,y,centerx_child4,centery_child4, show_child4);
    
    is_car   car1(x,y,centerx_car,centery_car, show_car);
    is_car   car2(x,y,centerx_car2,centery_car2, show_car2);
    
    check_circle circle1(x,y,10'd407,10'd28,in1);
    check_circle circle2(x,y,10'd459,10'd28,in2);
    check_circle circle3(x,y,10'd511,10'd28,in3);
    check_circle circle4(x,y,10'd563,10'd28,in4);
    check_circle circle5(x,y,10'd615,10'd28,in5);
    
    
    // ----------------------------------------------                                                                        
    
    always_comb 
    begin
        if(~start_game)begin
            if(in_game_start)begin
                if(game_start_red == 1)begin
                    red  = 8'hFF;
                    green= 8'hFF;
                    blue = 8'hFF;
                end
                else begin
                    red   = 8'h00;
                    green = 8'h00;
                    blue  = 8'h00;
                end
            end
            else begin
                red   = 8'h00;
                green = 8'h00;
                blue  = 8'h00;
            end
            
        end
        else if(end_game)begin
            if(in_back)begin
                if(start_red == 1)begin
                    red  = 8'hFF;
                    green= 8'hFF;
                    blue = 8'hFF;
                end
                else begin
                    red   = 8'h00;
                    green = 8'h00;
                    blue  = 8'h00;
                end
            end
            else begin
                    red   = 8'h00;
                    green = 8'h00;
                    blue  = 8'h00;
            end
        end
        else if(show_blacknum)begin
            red  = 0;
            green= 0;
            blue = 0;
        end
        else if(show_child2 && (child2_rgb != 24'hffffff) )
        begin
            red  = child2_rgb[23:16];
            green= child2_rgb[15:8];
            blue = child2_rgb[7:0];
             
         end
        else if(show_child4 && (child4_rgb != 24'hffffff) )
        begin
            red  = child4_rgb[23:16];
            green= child4_rgb[15:8];
            blue = child4_rgb[7:0];
             
         end
        else if(show_child3 && (child3_rgb != 24'hffffff) )
        begin
            red  = child3_rgb[23:16];
            green= child3_rgb[15:8];
            blue = child3_rgb[7:0];
             
         end
        else if(show_child && (child_rgb != 24'hffffff) )
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
        else if(show_joe_fly && (joe_fly_rgb != 24'hffffff))
        begin
            red = joe_fly_rgb[23:16];
            green =joe_fly_rgb[15:8];
            blue = joe_fly_rgb[7:0];
             
        end
        
        else if((show_car||show_car2) && (car_rgb != 24'hffffff) )
        begin
            red  = car_rgb[23:16];
            green= car_rgb[15:8];
            blue = car_rgb[7:0];
             
        end
        
        else
        begin
             red   = 8'hFF;
             green = 8'hFF;
             blue  = 8'hFF;
            if((hit_counter == 1) && (in1))begin
                red   = 8'hFF;
                green = 8'h00;
                blue  = 8'h00;
            end
            else if((hit_counter == 2) && (in1 || in2))begin
                red   = 8'hFF;
                green = 8'h00;
                blue  = 8'h00;
            end
            else if((hit_counter == 3) && (in1 || in2 || in3))begin
                red   = 8'hFF;
                green = 8'h00;
                blue  = 8'h00;
            end
            else if((hit_counter == 4) && (in1 || in2 || in3 || in4))begin
                red   = 8'hFF;
                green = 8'h00;
                blue  = 8'h00;
            end
            else if((hit_counter == 5) && (in1 || in2 || in3 || in4 || in5))begin
                red   = 8'hFF;
                green = 8'h00;
                blue  = 8'h00;
            end
            else if(in_cloud)begin
                if(cloud_red == 1)begin
                    red   = 8'hFF;
                    green = 8'hFF;
                    blue  = 8'hFF; 
                end
                else begin
                    red   = 8'd144;
                    green = 8'd182;
                    blue  = 8'd219; 
                end 
                
            end
            else if(in_background)   begin
                red  = background_rgb[23:16];
                green= background_rgb[15:8];
                blue = background_rgb[7:0];
                red   = 8'hFF;
                green = 8'hFF;
                blue  = 8'hFF; 
            end  
            else begin
//             red   = 8'hFF;
//             green = 8'hFF;
//             blue  = 8'hFF; 
                red   = 8'd144;
                green = 8'd182;
                blue  = 8'd219;
            end
        end
    end
    
    score_board socre_counter( .left(10'd20), .upper(10'd12),
                               .x(x),.y(y),
                               .score1(score1), .score2(score2),
                               .show_black(show_blacknum),
                               .CLK(CLK)
                               );                                         
   
    check_cloud back_cloud(10'd20, 10'd100,10'd320,10'd50,10'd480,10'd20, x, y, in_cloud, addra_cloud);
    check_game_start gamestart(10'd290,10'd240,x,y,in_game_start,addra_game_start);
    check_back background1 (10'd300,10'd240, x,y,in_back, addra_back);
    joe_address joe_address1  (show_joe,x,y,centerx,centery,joe_run_left,joe_run_right,right_hand_warm,stand,left_hand_go,addra_joe);
    joe_fly_address flyjoe_addra(show_joe_fly,x,y,centerx,centery,hit_joe,addra_joe_fly);
    child_address child1_address(show_child, x, y, centerx_child1, centery_child1,run_child, hit, addra_child );
    car_address   car1_address(show_car || show_car2, x, y, car_x_coor, car_y_coor,addra_car);
    child_address child2_address(show_child2, x, y, centerx_child2, centery_child2,run_child2, hit2, addra_child2 );
    child_address child3_address(show_child3, x, y, centerx_child3, centery_child3,run_child3, hit3, addra_child3 );
    child_address child4_address(show_child4, x, y, centerx_child4, centery_child4,run_child4, hit4, addra_child4 );
    
    blk_mem_gen_0 ram_joe   (.addra(addra_joe), .clka(CLK),.douta(joe_red),.ena(show_joe));
    blk_mem_gen_6  ram_game_start(.addra(addra_back), .clka(CLK),.douta(start_red),.ena(in_back));
    
    blk_mem_gen_5  ram_fly_joe(.addra(addra_joe_fly), .clka(CLK),.douta(joe_fly_red),.ena(show_joe_fly));
    
    blk_mem_gen_1 ram_child (.addra(addra_child), .clka(CLK),.douta(child_red),.ena(show_child),
                             .addrb(addra_child3), .clkb(CLK),.doutb(child3_red),.enb(show_child3)
                             );
    blk_mem_gen_2 ram_car    (.addra(addra_car), .clka(CLK),.douta(car_red),.ena(show_car || show_car2));
    blk_mem_gen_3 ram_child2 (.addra(addra_child2), .clka(CLK),.douta(child2_red),.ena(show_child2),
                              .addrb(addra_child4), .clkb(CLK),.doutb(child4_red),.enb(show_child4)
                              );
    
//    start_color start1_color ( .start_red(start_red),
//                                .start_rgb(start_rgb)
//                                );
    joe_color joe1_color(    .joe_red(joe_red),
                             .joe_rgb(joe_rgb));
                             
    joe_color joe_fly_color( .joe_red(joe_fly_red),
                             .joe_rgb(joe_fly_rgb));
                             
    child_color child_color1(.child_red(child_red),
                             .child_rgb(child_rgb));
    car_color car_color1(    .car_red(car_red),
                             .car_rgb(car_rgb));
    child2_color child_color2(.child_red(child2_red),
                             .child_rgb(child2_rgb));
    child_color child_color3(.child_red(child3_red),
                             .child_rgb(child3_rgb));
    child2_color child_color4(.child_red(child4_red),
                             .child_rgb(child4_rgb));
                             
    backgroundcolor_map color_background(.background_red(background_red), .background_rgb(background_rgb));
   
                              
                             
    blk_mem_gen_7 ram_background   (.addra(addra_background), .clka(CLK),.douta(background_red),.ena(in_background));
    blk_mem_gen_8 ram_cloud   (.addra(addra_cloud), .clka(CLK),.douta(cloud_red),.ena(in_cloud));
    blk_mem_gen_9 ram_gamestart   (.addra(addra_game_start), .clka(CLK),.douta(game_start_red),.ena(in_game_start));
                            
    always_comb begin
        if(y>=213)begin
            in_background = 1;
            addra_background = x  + (y - 213) * 640;
        end
        else begin
            in_background = 0;
            addra_background = 0;
        end
    end                        
                 
    
 endmodule