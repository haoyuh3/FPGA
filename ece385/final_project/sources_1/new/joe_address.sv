`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/09 17:44:33
// Design Name: 
// Module Name: joe_address
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


module joe_address( input  logic show_joe,
                    input  logic [9:0]x,y, 
                    input  logic [9:0]centerx,centery,
                    input  logic[1:0]joe_run_left,  // run have 3 frame
                    input  logic[1:0]joe_run_right, 
                    input  logic right_hand_warm,   // raise red warm
                    input  logic stand,             // stand still
                    input  logic left_hand_go,      // left hand
                    output  logic [15:0] addra
                  

    );
    logic [9:0]spiritex,spiritey;
    logic [15:0] spiritey_512;
    always_comb
    begin: address_joe
    // centerx 45 3-87   centery 0-92
    spiritex = x - (centerx) + 45;
    spiritey = y - (centery) + 46;
    spiritey_512 = spiritey << 9;
    if(show_joe) begin
        //----------right hand----------------
        if((spiritey <= 62)&&(spiritex >= 63))begin  // right hand
            if(right_hand_warm)begin
                addra = spiritex + 160 + spiritey_512;
            end
            else if(~stand)begin
                addra = spiritex + spiritey_512;
            end
            else begin
                addra = spiritex + 267 + spiritey_512;
            end    
        end
        
        //-------------left hand------------------------
        else if((spiritey <= 62)&&(spiritex<=30))begin     // left hand
            if(left_hand_go)begin
                addra = spiritex + 379 + spiritey_512;
            end
            else if(~stand)begin
                addra = spiritex + spiritey_512;
            end
            else begin
                addra = spiritex + 269 + spiritey_512;
            end    
        end
        
        
        //------------------body-----------------------------
        else if(((spiritey <= 64)&&(spiritex>=31)&&(spiritex<=62)))begin
            if(stand || (joe_run_right!=0))begin
                addra = spiritex + spiritey_512;
            end
            else begin
                addra = spiritex + 103 + spiritey_512;
            end
        end
 
        // ---------------foot--------------------------------
        else if(spiritey >= 65)begin
            if(joe_run_right==1)begin
                addra = spiritex + spiritey_512;
            end
            else if(joe_run_right==2)begin
                addra = spiritex + 183 + spiritey_512;
            end
            else if(joe_run_left==1)begin
                addra = spiritex + 103 +  spiritey_512;
            end
            else if(joe_run_left==2)begin
                addra = spiritex + 429 + spiritey_512;
            end
            
            else begin
                addra = spiritex + 353 + spiritey_512;
            end
            
        end
        //--------------------------------other space--------------
        else
            begin
                addra = 0;
            end           
        end
   
   else  begin
        addra = 0;
   end
   end
endmodule


module joe_fly_address(input  logic show_joe,
                        input  logic [9:0]x,y, 
                        input  logic [9:0]centerx,centery,
                        input logic [1:0] hit_joe,
                        output logic [12:0] addra
                       );
                       
logic [9:0]spiritex,spiritey;
    
        always_comb
        begin: address_joe
            //x 0-82        y 0-88          
        spiritex = x - (centerx) + 41;
        spiritey = y - (centery) + 44;
        if(show_joe && (hit_joe!=2'b00))begin
            if(hit_joe == 2'b01) begin//right
                addra = spiritex + spiritey * 83;
            end
            else begin
                addra = 83 - spiritex + spiritey * 83;
            end
        end
        else begin
            addra = 0;
        end
        end
 
endmodule