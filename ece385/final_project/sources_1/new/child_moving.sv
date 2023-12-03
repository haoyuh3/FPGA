`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/17 10:22:07
// Design Name: 
// Module Name: child_moving
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


module  child_moving ( input logic Reset, frame_clk,
			   input logic [7:0] keycode,
			   input logic [9:0] start_X,
			   input logic[2:0] speed,
               output logic [9:0]  BallX, BallY,
               output logic update_hit
               );
    
    logic [9:0] Ball_X_Motion, Ball_Y_Motion;
	logic frame_CLK;
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    
   
    always_ff @ (posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
    begin: Move_Ball
        if (Reset)  // asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
			BallY <= 10'd404;
			BallX <= start_X;
			update_hit <= 0;
        end
           
        else 
        begin 
                 update_hit <= 0;
                 if (keycode == 8'h00) begin
                    Ball_X_Motion <= 10'h0;
                    Ball_Y_Motion <= 10'h0;
                 end
                 
                 if (keycode == 8'h1A) begin
				     Ball_X_Motion <= 10'h0;
                     Ball_Y_Motion <= -10'd1;
                  end  
                  
                  if (keycode == 8'h16) begin
				     Ball_X_Motion <= 10'h0;
                     Ball_Y_Motion <= speed;
                  end  
                  
                  if (keycode == 8'h07) begin
				     Ball_X_Motion <= 10'h1;
                     Ball_Y_Motion <= 10'd0;
                  end  

                  if (keycode == 8'h04) begin
				     Ball_X_Motion <= -10'h1;
				     BallY <= 10'd404;
                     Ball_Y_Motion <= 10'd0;
                  end
                  
                  				 
              
				 BallY <= (BallY + Ball_Y_Motion);  // Update ball position
				 BallX <= (BallX + Ball_X_Motion);
			     
			     if(~update_hit && (keycode != 8'h16))
                     BallY <= 10'd404; 
			     
			     if(BallX == 10'd1000)begin  //reach boundry
				     BallY <= 10'd404;
			         BallX <= start_X;
//			         Ball_X_Motion <= -10'h1;
//                   Ball_Y_Motion <= 10'd0;
				 end
				 
				 if(BallY >= 10'd600) begin // hit bottom?
				     BallY <= 10'd404;
			         BallX <= start_X;
//			         Ball_X_Motion <= -10'h1;
                     Ball_Y_Motion <= 10'd0;
                     update_hit <= 1'b1;
                 end
		end  
    end
    
endmodule

