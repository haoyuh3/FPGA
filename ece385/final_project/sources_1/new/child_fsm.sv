`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 00:10:34
// Design Name: 
// Module Name: child_fsm
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


module child_fsm(
                    input  logic clk, // tied to VSYNC signal- refreshes every 1/60th of a sec approx
                    input  logic reset,
                    input  logic[9:0] child_X,child_Y,
                    input logic go,
                    input logic stop,
                    
                    input [9:0] joe_X, joe_Y,
                    
                    input logic[9:0] car_X,
                    input logic[9:0] car_Y,
                    input logic[9:0] car2_X,
                    input logic[9:0] car2_Y,
                    
                    input logic update_hit,
                    input logic child_wait_inline,
                    input logic start_game,
                    output logic [1:0] run_child,
                    output logic hit_child,
                    output logic[7:0] move
                    );
   
    enum logic[3:0] {
                       halt,
                       idle,
                       run,
                       force_idle,
                       hit
                     } state, next_state;
    logic count, next;
    logic[4:0] counter;
    logic stop_at_line;
    logic check_hit;
    logic go_close_joe;
    logic stop_close_joe;
   
    // state logic
    always_ff @(posedge clk or posedge reset) begin
        // resets, next_state
        if(reset) begin
            state   <= idle;
            counter <= 0;
        end else begin
            state <= next_state;
            if(count) begin
                if(counter == 20)
                    counter <= 0;
                else
                    counter <= counter + 1;
            end else
                counter <= 0;
        end
    end
    always_comb begin
        next_state = state;
        run_child = 2'b00;
        count = 0;
        
        
        unique case(state)
            halt:begin
                if(go)begin
                    next_state = idle;
                end
            end
            idle:begin
                if(check_hit)begin
                    next_state = hit;
                end
                else if(stop_close_joe || stop_at_line || child_wait_inline ) begin
                    next_state = force_idle;
                end
                else if(next && start_game) begin
                    next_state = run;
                end
            end
            
            run: begin
                if(check_hit)begin
                    next_state = hit;
                end
                else if(stop_close_joe || stop_at_line || child_wait_inline ) begin
                    next_state = force_idle;
                end
                else if(next) begin
                    next_state = idle;
                end
                
            end
            
            force_idle: begin
                if(check_hit)begin
                    next_state = hit;
                end
                else if(go_close_joe)begin
                    next_state = run;
                end
                else begin
                    next_state = force_idle;
                end
            end   
            
            hit: begin
                    if(update_hit)begin
                        next_state = idle;
                    end  
                    else begin
                        next_state = hit;
                    end                 
            end
        endcase
    
        unique case(state)
        halt: begin
            run_child = 2'b00;
            count = 0;
            move = 8'h00;
            hit_child = 0;
        end
        
        idle: begin
            run_child = 2'b00;
            count = 1;
            move = 8'h04;
            hit_child = 0;
        end
        
        run: begin
            run_child = 2'b01;  
            count = 1;
            move = 8'h04; 
            hit_child = 0;  
        end
        
        force_idle: begin
            run_child = 2'b00;  
            count = 0; 
            move = 8'h0;
            hit_child = 0;
        end
        
        hit: begin 
            run_child = 2'b00;
            count =0;
            move = 8'h16;
            hit_child = 1;
        end
        endcase
    end
     
    always_comb begin
        // reset every 3rd of a second
        next = (counter == 20) ? 1'b1 : 1'b0; 
        stop_at_line = (child_X == 500) ?  1'b1 : 1'b0; 
        if(((car_Y == child_Y) && (((child_X-car_X<=45)&&(child_X-car_X>=0))||((car_X-child_X<=45)&&(car_X-child_X>=0)))) || ((car2_Y == child_Y) && (((child_X-car2_X<=45)&&(child_X-car2_X>=0))||((car2_X-child_X<=45)&&(car2_X-child_X>=0))))) begin
            check_hit = 1'b1;
        end
        else begin
            check_hit = 1'b0;
        end
        
        if((go) && (~child_wait_inline) && (((child_X-joe_X<=26)&&(child_X-joe_X>=0))||((joe_X-child_X<=26)&&(joe_X-child_X>=0))))begin
            go_close_joe = 1;
        end
        else begin
            go_close_joe = 0;
        end
        
        if((stop) && (((child_X-joe_X<=26)&&(child_X-joe_X>=0))||((joe_X-child_X<=26)&&(joe_X-child_X>=0))))begin
            stop_close_joe = 1;
        end
        else begin
            stop_close_joe = 0;
        end
        
          
    end

endmodule         