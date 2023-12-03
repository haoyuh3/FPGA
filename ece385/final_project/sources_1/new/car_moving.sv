`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/17 14:03:12
// Design Name: 
// Module Name: car_moving
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


module  car_moving ( input logic Reset, frame_clk, start,
               input logic[9:0] startx,
               input logic[9:0] starty,
               input logic[2:0] seed,
			   input logic [7:0] keycode,
               output logic [9:0]  BallX, BallY,
               output logic [2:0] spd);
    
    logic [9:0] Ball_X_Motion, Ball_Y_Motion;
    logic [2:0] lfsr_spd, speed;
    logic nxt_spd;
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=50;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis
  
    // initialize LFSR
    lfsr spdgen(.rst(Reset),
                .start(start),
                .seed(seed),
                .clk(frame_clk),
                .spd(lfsr_spd));
   
    always_ff @ (posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
    begin: Move_Ball
        if (Reset)  // asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
			BallY <= starty;
			BallX <= startx;
			nxt_spd <= 1'b1;
        end
           
        else 
        begin 
                if(nxt_spd) begin
                    speed <= lfsr_spd;
                    nxt_spd <= 1'b0;
                end
                // practically unused, car is always moving when start_game is asserted
                 if (keycode == 8'h00) begin
                    Ball_X_Motion <= 10'h0;
                    Ball_Y_Motion <= 10'h0;
                 end
                 
//                 if (keycode == 8'h1A) begin
//				     Ball_X_Motion <= 10'h0;
//                     Ball_Y_Motion <= -10'd1;
//                  end  
                  
                  if (keycode == 8'h16) begin
				     Ball_X_Motion <= 10'h0;
                     Ball_Y_Motion <= speed; // changed to speed from LFSR
                  end  
                  
//                  if (keycode == 8'h07) begin
//				     Ball_X_Motion <= 10'h1;
//                     Ball_Y_Motion <= 10'd0;
//                  end  

//                  if (keycode == 8'h04) begin
//				     Ball_X_Motion <= -10'h1;
//                     Ball_Y_Motion <= 10'd0;
//                  end  

//				 if ( (BallY + BallS) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
//					  Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.
					  
//				 else if ( (BallY - BallS) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
//					  Ball_Y_Motion <= Ball_Y_Step;
					  
//				  else if ( (BallX + BallS) >= Ball_X_Max )  // Ball is at the Right edge, BOUNCE!
//					  Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.
					  
//				 else if ( (BallX - BallS) <= Ball_X_Min )  // Ball is at the Left edge, BOUNCE!
//					  Ball_X_Motion <= Ball_X_Step;
					  
//				 else 
//					  Ball_Y_Motion <= Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
//					  //Ball_X_Motion <= Ball_X_Motion;
//				 modify to control ball motion with the keycode

              
				 BallY <= (BallY + Ball_Y_Motion);  // Update ball position
				 BallX <= (BallX + Ball_X_Motion);
				 if(BallY >= 700) begin
				    BallY <= starty;
				    nxt_spd <= 1'b1;
				 end
			     
		end  
    end
    
    assign spd = speed;
endmodule
