`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Zuofu Cheng
// 
// Create Date: 12/11/2022 10:48:49 AM
// Design Name: 
// Module Name: mb_usb_hdmi_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Top level for mb_lwusb test project, copy mb wrapper here from Verilog and modify
// to SV
// Dependencies: microblaze block design
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mb_usb_hdmi_top(
    input logic Clk,
    input logic reset_rtl_0,
    
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss,
    
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,
        
    //HEX displays
    output logic [7:0] hex_segA,
    output logic [3:0] hex_gridA,
    output logic [7:0] hex_segB,
    output logic [3:0] hex_gridB,
    
    // PWM
     output logic leftsound,
     output logic rightsound
    );
    
    logic [31:0] keycode0_gpio, keycode1_gpio;
    logic clk_25MHz, clk_125MHz;
    //logic vsync_two;
    logic locked;
    logic [9:0] drawX, drawY, joeX, joeY;
    
    logic hsync, vsync, vde;
    logic vsync1;
    logic [7:0] red, green, blue, key;
    logic reset_ah;
    logic[1:0]joe_run_left;  // run have 3 frame
    logic[1:0]joe_run_right; 
    logic right_hand_warm;   // raise red warm
    logic stand;             // stand still
    logic left_hand_go;
    
    //logic for child
    logic [9:0]child_X, child_Y,child2_X,child2_Y,child3_X,child3_Y,child4_X,child4_Y,car_X,car_Y;
    logic [9:0] car2_X, car2_Y;
    logic [1:0] run_child,run_child2,run_child3,run_child4;
    logic hit,hit2,hit3,hit4;
    logic [7:0] key_child,key_child2,key_child3,key_child4;
    
    logic update_hit1, update_hit2,update_hit3,update_hit4;   // in order to loop children
    logic child_stop1, child_stop2,child_stop3,child_stop4;
    
    logic [3:0] score1, score2;
    logic count;
    logic overflow;
    logic [1:0] hit_joe;   // 2'b10 left   //2'b01 right
    logic [4:0] hit_counter;
    logic end_game;
    logic start_game;
    logic sound_en;
    logic [7:0]car_move,car_move2;
    logic [7:0] child1_move, child2_move,child3_move,child4_move;
  
    
  
   
    
    //Keycode HEX drivers
    HexDriver HexA (
        .clk(Clk),
        .reset(reset_ah),
        .in({keycode0_gpio[31:28], keycode0_gpio[27:24], keycode0_gpio[23:20], hit_counter[3:0]}),
        .hex_seg(hex_segA),
        .hex_grid(hex_gridA)
    );
    
    HexDriver HexB (
        .clk(Clk),
        .reset(reset_ah),
        .in({keycode0_gpio[15:12], keycode0_gpio[11:8], keycode0_gpio[7:4], keycode0_gpio[3:0]}),
        .hex_seg(hex_segB),
        .hex_grid(hex_gridB)
    );

    
    mb_block mb_block_i(
        .clk_100MHz(Clk),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_sclk(usb_spi_sclk),
        .usb_spi_ss(usb_spi_ss)
        //.pwm_0(pwm)
    );
        
    //clock wizard configured with a 1x and 5x clock for HDMI
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .reset(reset_ah),
        .locked(locked),
        .clk_in1(Clk)
    );
    
    //VGA Sync signal generator
    vga_controller vga (
        .pixel_clk(clk_25MHz),
        .reset(reset_ah),
        .hs(hsync),
        .vs(vsync),
        .active_nblank(vde),
        .drawX(drawX),
        .drawY(drawY)
    );    

    //Real Digital VGA to HDMI converter
    hdmi_tx_0 vga_to_hdmi (
        //Clocking and Reset
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        //Reset is active LOW
        .rst(reset_ah),
        //Color and Sync Signals
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        
        //aux Data (unused)
        .aux0_din(4'b0),
        .aux1_din(4'b0),
        .aux2_din(4'b0),
        .ade(1'b0),
        
        //Differential outputs
        .TMDS_CLK_P(hdmi_tmds_clk_p),          
        .TMDS_CLK_N(hdmi_tmds_clk_n),          
        .TMDS_DATA_P(hdmi_tmds_data_p),         
        .TMDS_DATA_N(hdmi_tmds_data_n)          
    );
//    input logic Reset, frame_clk,
//    input logic [7:0] keycode,
//    output logic [9:0]  BallX, BallY, BallS
    ball move_joe(.Reset(reset_ah),
                  .frame_clk(vsync1),
                  .keycode(key),
                  .BallX(joeX),
                  .BallY(joeY),
                  .BallS()
                  );
                  
     // determine lane of each child (0: lane of car1, 1: lane of car2)
     logic[2:0] speed_c1, speed_c2;
     logic lane1, lane2, lane3, lane4;
     always_comb begin
        if(((child_X-car_X<=45) && (child_X-car_X>=0)) || ((car_X-child_X<=45)&&(car_X-child_X>=0)))
            lane1 = 1;
        else
            lane1 = 0;
        if(((child2_X-car_X<=45) && (child2_X-car_X>=0)) || ((car_X-child2_X<=45)&&(car_X-child2_X>=0)))
            lane2 = 1;
        else
            lane2 = 0;
        if(((child3_X-car_X<=45) && (child3_X-car_X>=0)) || ((car_X-child3_X<=45)&&(car_X-child3_X>=0)))
            lane3 = 1;
        else
            lane3 = 0;
        if(((child4_X-car_X<=45) && (child4_X-car_X>=0)) || ((car_X-child4_X<=45)&&(car_X-child4_X>=0)))
            lane4 = 1;
        else
            lane4 = 0;
     end
     
     car_moving move_car1(.Reset(reset_ah),
                          .start(start_game),
                          .frame_clk(vsync1),
                          .keycode(car_move),
                          .startx(10'd383),
                          .starty(10'd210),
                          .seed(3'b011),
                          .BallX(car_X),
                          .BallY(car_Y),
                          .spd(speed_c1)
                          );
                          
     car_moving move_car2(.Reset(reset_ah),
                          .start(start_game),
                          .frame_clk(vsync1),
                          .keycode(car_move2),
                          .startx(10'd263),
                          .starty(10'd210),
                          .seed(3'b100),
                          .BallX(car2_X),
                          .BallY(car2_Y),
                          .spd(speed_c2)
                          );
                         
    child_moving move_child1(.Reset(reset_ah),
                              .frame_clk(vsync1),
                              .keycode(child1_move),
                              .BallX(child_X),
                              .BallY(child_Y),
                              .start_X(10'd640),
                              .update_hit(update_hit1),
                              .speed(lane1 ? speed_c1 : speed_c2)
                              );
                              
    child_moving move_child2( .Reset(reset_ah),
                              .frame_clk(vsync1),
                              .keycode(child2_move),
                              .BallX(child2_X),
                              .BallY(child2_Y),
                              .start_X(10'd800),
                              .update_hit(update_hit2),
                              .speed(lane2 ? speed_c1 : speed_c2)
                              );
                              
    child_moving move_child3( .Reset(reset_ah),
                              .frame_clk(vsync1),
                              .keycode(child3_move),
                              .BallX(child3_X),
                              .BallY(child3_Y),
                              .start_X(10'd700),
                              .update_hit(update_hit3),
                              .speed(lane3 ? speed_c1 : speed_c2)
                              );
                           
    child_moving move_child4( .Reset(reset_ah),
                              .frame_clk(vsync1),
                              .keycode(child4_move),
                              .BallX(child4_X),
                              .BallY(child4_Y),
                              .start_X(10'd750),
                              .update_hit(update_hit4),
                              .speed(lane4 ? speed_c1 : speed_c2)
                              );

    color_mappertest mymap(.x(drawX), 
                           .y(drawY),
                           //----------
                           .centerx(joeX), 
                           .centery(joeY), // joe coords(x,y)
                           .CLK(Clk),
                           .joe_run_left(joe_run_left),
                           .joe_run_right(joe_run_right),
                           .right_hand_warm(right_hand_warm),
                           .stand(stand),
                           .left_hand_go(left_hand_go),
                           .hit_joe(hit_joe),     
                           //-----------
                           .centerx_child1(child_X), 
                           .centery_child1(child_Y), // child1 coords(x,y)
                           .run_child(run_child),
                           .hit(hit),
                           
                           .centerx_child2(child2_X), 
                           .centery_child2(child2_Y), // child2 coords(x,y)
                           .run_child2(run_child2),
                           .hit2(hit2),
                           //
                           .centerx_child3(child3_X), 
                           .centery_child3(child3_Y), // child3 coords(x,y)
                           .run_child3(run_child3),
                           .hit3(hit3),
                           //
                           
                           .centerx_child4(child4_X), 
                           .centery_child4(child4_Y), // child4 coords(x,y)
                           .run_child4(run_child4),
                           .hit4(hit4),
                           
                           //-----------
                           .centerx_car(car_X),//centerx_car,
                           .centery_car(car_Y),//centery_car,
                           
                           .centerx_car2(car2_X),//centerx_car,
                           .centery_car2(car2_Y),//centery_car,
                           //
                           
                           .score1(score1), 
                           .score2(score2),
                           
                           //
                           .red(red),
                           .green(green), 
                           .blue(blue),
                           .start_game(start_game),
                           .end_game(end_game),
                           .hit_counter(hit_counter)
                           );
                           

    joe_fsm joe(.clk(vsync1),
                .reset(reset_ah),
                .keycode(keycode0_gpio),
                .joe_X(joeX),
                .joe_Y(joeY),
                .car_X(car_X),
                .car_Y(car_Y),
                .car2_X(car2_X),
                .car2_Y(car2_Y),
                .raise_right(right_hand_warm),
                .left_hand_go(left_hand_go),
                .stand(stand),
                .hit_joe(hit_joe),
                .run_left(joe_run_left),
                .run_right(joe_run_right),
                .move(key));
                
    child_fsm child1(.clk(vsync1), // tied to VSYNC signal- refreshes every 1/60th of a sec approx
                     .reset(reset_ah),
                     .go(left_hand_go),
                     .stop(right_hand_warm),
                     .child_X(child_X),
                     .child_Y(child_Y),
                     .run_child(run_child),
                    //output hit 
                    .joe_X(joeX),
                    .joe_Y(joeY),
                    .car_X(car_X),
                    .car_Y(car_Y),
                    .car2_X(car2_X),
                    .car2_Y(car2_Y),
                    .hit_child(hit),
                    .update_hit(update_hit1),
                    .move(key_child),
                    .child_wait_inline(child_stop1),
                    .start_game(start_game)
                    );
                    
     child_fsm child2(.clk(vsync1), // tied to VSYNC signal- refreshes every 1/60th of a sec approx
                     .reset(reset_ah),
                     .go(left_hand_go),
                     .stop(right_hand_warm),
                     .child_X(child2_X),
                     .child_Y(child2_Y),
                     .run_child(run_child2),
                    //output hit 
                    .joe_X(joeX),
                    .joe_Y(joeY),
                    .car_X(car_X),
                    .car_Y(car_Y),
                    .car2_X(car2_X),
                    .car2_Y(car2_Y),
                    .hit_child(hit2),
                    .update_hit(update_hit2),
                    .move(key_child2),
                    .child_wait_inline(child_stop2),
                    .start_game(start_game)
                    );
                    
                    
                    
         child_fsm child3(.clk(vsync1), // tied to VSYNC signal- refreshes every 1/60th of a sec approx
                     .reset(reset_ah),
                     .go(left_hand_go),
                     .stop(right_hand_warm),
                     .child_X(child3_X),
                     .child_Y(child3_Y),
                     .run_child(run_child3),
                    //output hit 
                    .joe_X(joeX),
                    .joe_Y(joeY),
                    .car_X(car_X),
                    .car_Y(car_Y),
                    .car2_X(car2_X),
                    .car2_Y(car2_Y),
                    .hit_child(hit3),
                    .update_hit(update_hit3),
                    .move(key_child3),
                    .child_wait_inline(child_stop3),
                    .start_game(start_game)
                    );
                    
          child_fsm child4(.clk(vsync1), // tied to VSYNC signal- refreshes every 1/60th of a sec approx
                     .reset(reset_ah),
                     .go(left_hand_go),
                     .stop(right_hand_warm),
                     .child_X(child4_X),
                     .child_Y(child4_Y),
                     .run_child(run_child4),
                    //output hit 
                    .joe_X(joeX),
                    .joe_Y(joeY),
                    .car_X(car_X),
                    .car_Y(car_Y),
                    .car2_X(car2_X),
                    .car2_Y(car2_Y),
                    .hit_child(hit4),
                    .update_hit(update_hit4),
                    .move(key_child4),
                    .child_wait_inline(child_stop4),
                    .start_game(start_game)
                    );
                    
                    
         child_wait_inline three_child( .child1_X(child_X),.child2_X(child2_X),.child3_X(child3_X),.child4_X(child4_X),
                                      .keycode1(key_child), .keycode2(key_child2),.keycode3(key_child3),.keycode4(key_child4),
                                      .child1_stop(child_stop1), .child2_stop(child_stop2),.child3_stop(child_stop3),.child4_stop(child_stop4)  // if previous child stop it will also stop
                                      );
                                      

                       
                          
         score_counter(.vsync(vsync1), 
                       .reset_ah(reset_ah),
                       .child_X(child_X), .child2_X(child2_X), .child3_X(child3_X), .child4_X(child4_X),
                       .score1(score1), .score2(score2)
                       );
                
         always_ff @ (posedge Clk)
         begin
            reset_ah <=  reset_rtl_0;
         end
         
         
         // check hit number
         always_ff @(posedge vsync1 or posedge reset_ah)begin
            if(reset_ah)begin
                 
                 start_game <= 0;
                 car_move <= 8'h00;
                 car_move2 <= 8'h00;  
                 end_game <=0;    
            end
            else begin
                if(keycode0_gpio != 0)begin
                    start_game <= 1;
                end
                if(start_game)begin
                    car_move <= 8'h16;
                    car_move2 <= 8'h16;
                    child1_move <= key_child;
                    child2_move <= key_child2;
                    child3_move <= key_child3;
                    child4_move <= key_child4;    
                end  
                
                if(hit_counter >= 5)begin
                    hit_counter <= 0;
                    end_game <= 1;
               
                end
              
                else if(update_hit1 || update_hit2 || update_hit3 || update_hit4)begin
                    hit_counter <= hit_counter + update_hit1 + update_hit2 + update_hit3 + update_hit4 ;
                end
                else hit_counter <= hit_counter;
                
                  
            end
         end
         
         
        
         
         
         
         
         
         pwm_core_top audio(Clk, reset_ah, sound_en, leftsound, rightsound );
         
//         always_comb begin
//            if( (hit && (child_Y == 10'd404) ) ||  (hit2 && (child2_Y == 10'd404) ) || (hit3 && (child3_Y == 10'd404) ) ||(hit4 && (child4_Y == 10'd404) ) ) begin
//                sound_en = 1;
//            end
//            else begin
//                sound_en = 0;
//            end
            
//         end
         
         
         always_ff @(posedge Clk or posedge reset_ah)begin
            if(reset_ah)begin
                sound_en <= 0;
            end
            else if((hit && (child_Y >= 10'd400 && child_Y <= 10'd415)) || (hit2 && (child2_Y >= 10'd400 && child2_Y <= 10'd415)) || (hit3 && (child3_Y >= 10'd400 && child3_Y <= 10'd415)) || (hit4 && (child4_Y >= 10'd400 && child4_Y <= 10'd415)) ) begin
                sound_en <=1;
            end
            else begin
                sound_en <= 0;
            end
         end
         
         always_ff @ (posedge vsync)begin
            vsync1 <= ~vsync1;
         end
         
      
         

endmodule
