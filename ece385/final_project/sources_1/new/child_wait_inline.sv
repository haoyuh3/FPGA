`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/24 14:38:12
// Design Name: 
// Module Name: child_wait_inline
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


module child_wait_inline( input logic [9:0] child1_X,child2_X,child3_X, child4_X,
                          input logic [7:0] keycode1,keycode2, keycode3, keycode4,
                          output logic child1_stop, child2_stop, child3_stop, child4_stop

    );
    
    always_comb 
    begin: check_child1
        if((child1_X - child2_X <= 26) && (child1_X - child2_X > 0)&&(keycode2 == 0))begin
            child1_stop = 1;
        end
        else if((child1_X - child3_X <= 26) && (child1_X - child3_X > 0)&&(keycode3 == 0))begin
            child1_stop = 1;
        end
        else if((child1_X - child4_X <= 26) && (child1_X - child4_X > 0)&&(keycode4 == 0))begin
            child1_stop = 1;
        end
//        else if((child1_X - child2_X <= 26) && (child1_X - child2_X > 0)&&(keycode2 == 8'h04))begin
//            child1_stop = 0;
//        end
//        else if((child1_X - child3_X <= 26) && (child1_X - child3_X > 0)&&(keycode3 == 8'h04))begin
//            child1_stop = 0;
//        end
//        else if((child1_X - child4_X <= 26) && (child1_X - child4_X > 0)&&(keycode4 == 8'h04))begin
//            child1_stop = 0;
//        end
        else begin
            child1_stop =0;
        end
        
    end
    
    always_comb 
    begin: check_child2
        if((child2_X - child1_X <= 26) && (child2_X - child1_X > 0 )&& (keycode1 == 0))begin
            child2_stop = 1;
        end
        else if((child2_X - child3_X <= 26) && (child2_X - child3_X > 0 )&& (keycode3 == 0))begin
            child2_stop = 1;
        end
        else if((child2_X - child4_X <= 26) && (child2_X - child4_X > 0 )&& (keycode4 == 0))begin
            child2_stop = 1;
        end
//         else if((child2_X - child1_X <= 26) && (child2_X - child1_X > 0 )&& (keycode1 == 8'h04))begin
//            child2_stop = 0;
//        end
//        else if((child2_X - child3_X <= 26) && (child2_X - child3_X > 0 )&& (keycode3 == 8'h04))begin
//            child2_stop = 0;
//        end
//        else if((child2_X - child4_X <= 26) && (child2_X - child4_X > 0 )&& (keycode4 == 8'h04))begin
//            child2_stop = 0;
//        end
        else begin
            child2_stop =0;
        end
        
    end
    
    always_comb 
    begin: check_child3
        if((child3_X - child1_X <= 26) && (child3_X - child1_X > 0 )&& (keycode1 == 0))begin
            child3_stop = 1;
        end
        else if((child3_X - child2_X <= 26) && (child3_X - child2_X > 0 )&& (keycode2 == 0))begin
            child3_stop = 1;
        end
        else if((child3_X - child4_X <= 26) && (child3_X - child4_X > 0 )&& (keycode4 == 0))begin
            child3_stop = 1;
        end
//        else if((child3_X - child1_X <= 26) && (child3_X - child1_X > 0 )&& (keycode1 == 8'h04))begin
//            child3_stop = 0;
//        end
//        else if((child3_X - child2_X <= 26) && (child3_X - child2_X > 0 )&& (keycode2 == 8'h04))begin
//            child3_stop = 0;
//        end
//        else if((child3_X - child4_X <= 26) && (child3_X - child4_X > 0 )&& (keycode4 == 8'h04))begin
//            child3_stop = 0;
//        end
        else begin
            child3_stop =0;
        end
        
    end
    
    always_comb 
    begin: check_child4
        if((child4_X - child1_X <= 26) && (child4_X - child1_X > 0 )&& (keycode1 == 0))begin
            child4_stop = 1;
        end
        else if((child4_X - child2_X <= 26) && (child4_X - child2_X > 0 )&& (keycode2 == 0))begin
            child4_stop = 1;
        end
        else if((child4_X - child3_X <= 26) && (child4_X - child3_X > 0 )&& (keycode3 == 0))begin
            child4_stop = 1;
        end
//        else if((child4_X - child1_X <= 26) && (child4_X - child1_X > 0 )&& (keycode1 == 8'h04))begin
//            child4_stop = 0;
//        end
//        else if((child4_X - child2_X <= 26) && (child4_X - child2_X > 0 )&& (keycode2 == 8'h04))begin
//            child4_stop = 0;
//        end
//        else if((child4_X - child3_X <= 26) && (child4_X - child3_X > 0 )&& (keycode3 == 8'h04))begin
//            child4_stop = 0;
//        end
        else begin
            child4_stop =0;
        end
        
    end
    
    
    
    
endmodule
