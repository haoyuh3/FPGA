`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 02:18:16 PM
// Design Name: 
// Module Name: joe_fsm
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


module joe_fsm(
    input logic clk, // tied to VSYNC signal- refreshes every 1/60th of a sec approx
    input logic reset,
    input logic [9:0] joe_X, joe_Y, car_X, car_Y,car2_X,car2_Y,
    input logic[31:0] keycode,
    output logic raise_right,
    output logic left_hand_go,
    output logic stand,
    output logic[1:0] run_left,
    output logic[1:0] run_right,
    output logic[7:0] move,
    output logic[1:0] hit_joe
    );
    logic[7:0] moveleft, moveright, go, stop, key0, key1, key2, key3;
    logic [1:0]check_hit;
    
    // assign keycodes for readability
    always_comb begin
        key0 = keycode[7:0];
        key1 = keycode[15:8];
        key2 = keycode[23:16];
        key3 = keycode[31:24];
    end
    // check if any of the keycodes are pressed
    always_comb begin
        // any pressed a
        if(key0 == 8'h04 | key1 == 8'h04 | key2 == 8'h04 | key3 == 8'h04)
            moveleft = 8'h04;
        else
            moveleft = 8'h0;
        // any pressed d
        if(key0 == 8'h07 | key1 == 8'h07 | key2 == 8'h07 | key3 == 8'h07)
            moveright = 8'h07;
        else
            moveright = 8'h0;
        // pressed j
        if(key0 == 8'h0d | key1 == 8'h0d | key2 == 8'h0d | key3 == 8'h0d)
            go = 8'h0d;
        else
            go = 8'h0;
        // pressed k
        if(key0 == 8'h0e | key1 == 8'h0e | key2 == 8'h0e | key3 == 8'h0e)
            stop = 8'h0e;
        else
            stop = 8'h0;
    end
    // keycodes
    logic[7:0] keycode_moveleft;
    logic[7:0] keycode_moveright;
    logic[7:0] keycode_go;
    logic[7:0] keycode_stop;
    // list out states
    enum logic[3:0] {
        idle,
        move_left_f1,
        move_left_f2,
        move_right_f1,
        move_right_f2,
        hit_left,
        hit_right
    } state, next_state;
    logic count, next;
    //logic next2;
    logic [4:0] counter;
    //logic count_hit;
//    logic [5:0] counter_hit;
   
    // state logic
    always_ff @(posedge clk) begin
        // resets, next_state
        if(reset) begin
            state <= idle;
            counter <= 0;
            //counter_hit <= 0;
        end else begin
            state <= next_state;
            if(count) begin
                if(counter == 20)
                    counter <= 0;
                else
                    counter <= counter + 1;
            end
//            else if(count_hit)begin
//                if(counter_hit == 30)
//                    counter_hit <= 0;
//                else
//                    counter_hit <= counter_hit + 1;
//                end
          
            else
                counter <= 0;
//                counter_hit <=0;
            end
    end
    // enumerating states
    always_comb begin
        next_state = state;
        // default outputs?
        stand = 1'b1;
        run_left = 2'b0;
        run_right = 2'b0;
        hit_joe = 2'b00;
        unique case(state)
        // idle state, joe will start here and is just standing
            idle: begin
                if(check_hit == 2'b01)
                    next_state = hit_right;
                else if(check_hit == 2'b10)
                    next_state = hit_left;
                else if(moveleft == 8'h04 & moveright == 8'h07)
                    // do nothing
                    next_state = idle;
                else if(moveleft == 8'h04)
                   next_state = move_left_f1;
                else if(moveright == 8'h07)
                    next_state = move_right_f1;
            end
        // two states for two frames, one for left anim other for right
            move_left_f1:
                if(check_hit == 2'b01)
                    next_state = hit_right;
                else if(check_hit == 2'b10)
                    next_state = hit_left;
                else if(moveleft == 8'h04 & moveright == 8'h07)
                    // both directional keys pressed at once, immediately kill movement
                    next_state = idle;
                else if(moveleft == 8'h04) begin
                    if(next)
                        next_state = move_left_f2;
                end else if(moveright == 8'h07) begin
                    next_state = move_right_f1;
                end else
                    next_state = idle;
            move_left_f2:
                if(check_hit == 2'b01)
                    next_state = hit_right;
                else if(check_hit == 2'b10)
                    next_state = hit_left;
                else if(moveleft == 8'h04 & moveright == 8'h07)
                    next_state = idle;
                else if(moveleft == 8'h04) begin
                    if(next)
                        next_state = move_left_f1;
                end else if(moveright == 8'h07) begin
                    next_state = move_right_f1;
                end else
                    next_state = idle;
            move_right_f1:
                if(check_hit == 2'b01)
                    next_state = hit_right;
                else if(check_hit == 2'b10)
                    next_state = hit_left;
                else if(moveleft == 8'h04 & moveright == 8'h07)
                    next_state = idle;
                else if(moveright == 8'h07) begin
                    if(next)
                        next_state = move_right_f2;
                end else if(moveleft == 8'h04) begin
                    next_state = move_left_f1;
                end else
                    next_state = idle;
            move_right_f2:
                if(check_hit == 2'b01)
                    next_state = hit_right;
                else if(check_hit == 2'b10)
                    next_state = hit_left;
                else if(moveleft == 8'h04 & moveright == 8'h07)
                    next_state = idle;
                else if(moveright == 8'h07) begin
                    if(next)
                        next_state = move_right_f1;
                end else if(moveleft == 8'h04) begin
                    next_state = move_left_f1;
                end else
                    next_state = idle;
                
             hit_right:
                if(next)   
                    next_state = idle;
                 else
                    next_state = hit_right; 
              hit_left:
                if(next)   
                    next_state = idle;
                 else
                    next_state = hit_left; 
              
        endcase
        // set output signals for each case
        unique case(state)
            idle: begin
                stand = 1'b1;
                run_left = 2'b0;
                run_right = 2'b0;
                count = 1'b0;
                move = 8'h0;
                hit_joe = 2'b00;
                //count_hit = 1'b0;
            end
            move_left_f1: begin
                stand = 1'b0;
                run_left = 2'b01;
                run_right = 2'b0;
                count = 1'b1;
                move = 8'h04;
                hit_joe = 2'b00;
                //count_hit = 1'b0;
            end
            move_left_f2: begin
                stand = 1'b0;
                run_left = 2'b10;
                run_right = 2'b0;
                count = 1'b1;
                move = 8'h04;
                hit_joe = 2'b00;
                //count_hit = 1'b0;
            end
            move_right_f1: begin
                stand = 1'b0;
                run_left = 2'b0;
                run_right = 2'b01;
                count = 1'b1;
                move = 8'h07;
                hit_joe = 2'b00;
                //count_hit = 1'b0;
            end
            move_right_f2: begin
                stand = 1'b0;
                run_left = 2'b0;
                run_right = 2'b10;
                count = 1'b1;
                move = 8'h07;
                hit_joe = 2'b00;
                //count_hit = 1'b0;
            end
            
            hit_right:begin
                stand = 1'b0;
                run_left = 2'b0;
                run_right = 2'b0;
                count = 1'b1;
                move = 8'h07;
                hit_joe = 2'b01;
                //count_hit = 1'b1;
            end
            
            hit_left:begin
                stand = 1'b0;
                run_left = 2'b0;
                run_right = 2'b0;
                count = 1'b1;
                move = 8'h04;
                hit_joe = 2'b10;
                //count_hit = 1'b1;
            end
            
        endcase
    end
    // logic for Joe's go/stop signals (asynchronously handled from the rest)
    always_comb begin
        // reset every 3rd of a second
        next = (counter == 20) ? 1'b1 : 1'b0;
        //next2 =(counter_hit == 30) ? 1'b1 : 1'b0;
        // simple cominational logic to control these signals
        left_hand_go = ((stop !=8'h0e)&&(go == 8'h0d)) ? 1'b1 : 1'b0;
        raise_right = ((stop == 8'h0e)&&(go != 8'h0d)) ? 1'b1 : 1'b0;
        
        if(((car_Y == joe_Y) && ((joe_X-car_X<=45)&&(joe_X-car_X>=0))) || ((car2_Y == joe_Y) && ((joe_X-car2_X<=45)&&(joe_X-car2_X>=0))))begin
            check_hit = 2'b01;
        end
        else if(((car_X-joe_X<=45)&&(car_X-joe_X>=0) && (car_Y == joe_Y))|| ((car2_X-joe_X<=45)&&(car2_X-joe_X>=0) && (car2_Y == joe_Y)))begin
            check_hit = 2'b10;
        end
        else begin
            check_hit = 2'b00;
        end
    end
endmodule
