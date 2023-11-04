`timescale 1 ns / 1 ps

module hdmi_text_controller_v1_0_AXI #
(
    // Users to add parameters here

    // User parameters ends
    // Do not modify the parameters beyond this line

    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH	= 32,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH	= 14  // VRAM + 8 register 
    
    
)
(
    // Users to add ports here

    // User ports ends
    // Do not modify the ports beyond this line

    // Global Clock Signal
    input logic  S_AXI_ACLK,
    // Global Reset Signal. This Signal is Active LOW
    input logic  S_AXI_ARESETN,
    // Write address (issued by master, acceped by Slave)
    input logic [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
    // Write channel Protection type. This signal indicates the
        // privilege and security level of the transaction, and whether
        // the transaction is a data access or an instruction access.
    input logic [2 : 0] S_AXI_AWPROT,
    // Write address valid. This signal indicates that the master signaling
        // valid write address and control information.
    input logic  S_AXI_AWVALID,
    // Write address ready. This signal indicates that the slave is ready
        // to accept an address and associated control signals.
    output logic  S_AXI_AWREADY,
    // Write data (issued by master, acceped by Slave) 
    input logic [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
    // Write strobes. This signal indicates which byte lanes hold
        // valid data. There is one write strobe bit for each eight
        // bits of the write data bus.    
    input logic [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,//write strobe descrption
    // Write valid. This signal indicates that valid write
        // data and strobes are available.
    input logic  S_AXI_WVALID,
    // Write ready. This signal indicates that the slave
        // can accept the write data.
    output logic  S_AXI_WREADY,
    // Write response. This signal indicates the status
        // of the write transaction.
    output logic [1 : 0] S_AXI_BRESP,
    // Write response valid. This signal indicates that the channel
        // is signaling a valid write response.
    output logic  S_AXI_BVALID,
    // Response ready. This signal indicates that the master
        // can accept a write response.
    input logic  S_AXI_BREADY,
    // Read address (issued by master, acceped by Slave)
    input logic [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
    // Protection type. This signal indicates the privilege
        // and security level of the transaction, and whether the
        // transaction is a data access or an instruction access.
    input logic [2 : 0] S_AXI_ARPROT,
    // Read address valid. This signal indicates that the channel
        // is signaling valid read address and control information.
    input logic  S_AXI_ARVALID,
    // Read address ready. This signal indicates that the slave is
        // ready to accept an address and associated control signals.
    output logic  S_AXI_ARREADY,
    // Read data (issued by slave)
    output logic [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
    // Read response. This signal indicates the status of the
        // read transfer.
    output logic [1 : 0] S_AXI_RRESP,
    // Read valid. This signal indicates that the channel is
        // signaling the required read data.
    output logic  S_AXI_RVALID,
    // Read ready. This signal indicates that the master can
        // accept the read data and response information.
    input logic  S_AXI_RREADY,
    
    input logic[9:0]DrawX,
    
    input logic[9:0] DrawY,
    
    output logic[3:0] Red,
    
    output logic[3:0] Blue,
    
    output logic[3:0] Green
);

// AXI4LITE signals
logic  [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
logic  axi_awready;
logic  axi_wready;
logic  [1 : 0] 	axi_bresp;
logic  axi_bvalid;
logic  [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
logic  axi_arready;
logic  [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
logic  [1 : 0] 	axi_rresp;
logic  	axi_rvalid;


localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
localparam integer OPT_MEM_ADDR_BITS = 11;   //modify to 11 since we have 1200 register now + 8 additonal register
//----------------------------------------------
//-- Signals for user logic register space example
//------------------------------------------------
logic [C_S_AXI_DATA_WIDTH-1:0]	 slv_regs[8];
logic [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;  // data from VRAM
integer	 byte_index;
logic	 aw_en;
logic read_ready;                               // read_ready signal -- wait
//------------------------------------//
//local logic for memory block
int count=0;
// I/O Connections assignments

assign S_AXI_AWREADY	= axi_awready;
assign S_AXI_WREADY	= axi_wready;
assign S_AXI_BRESP	= axi_bresp;
assign S_AXI_BVALID	= axi_bvalid;
assign S_AXI_ARREADY	= axi_arready;
assign S_AXI_RDATA	= axi_rdata;
assign S_AXI_RRESP	= axi_rresp;
assign S_AXI_RVALID	= axi_rvalid;
//-------------------------------------------provided logic------------------------------------------//
always_ff @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_awready <= 1'b0;
      aw_en <= 1'b1;
    end 
  else
    begin    
      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
        begin
        
          axi_awready <= 1'b1;
          aw_en <= 1'b0;
        end
        else if (S_AXI_BREADY && axi_bvalid)
            begin
              aw_en <= 1'b1;
              axi_awready <= 1'b0;
            end
      else           
        begin
          axi_awready <= 1'b0;
        end
    end 
end       


always_ff @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_awaddr <= 0;
    end 
  else
    begin    
      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
        begin
          // Write Address latching 
          axi_awaddr <= S_AXI_AWADDR;
        end
    end 
end       

always_ff @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_wready <= 1'b0;
    end 
  else
    begin    
      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
        begin
        
          axi_wready <= 1'b1;
        end
      else
        begin
          axi_wready <= 1'b0;
        end
    end 
end       
assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;
//-------------------------------------------provided logic------------------------------------------//

logic [OPT_MEM_ADDR_BITS:0] address_to_char;    // user inut char address output char content
logic [C_S_AXI_DATA_WIDTH-1:0] char_from_VRAM;  // haven't used
logic [OPT_MEM_ADDR_BITS:0] Address_to_VRAM;    // write or read address
logic [3:0] wea_en;                            // port A wea signal

// Address_to_VRAM depend on write or read mode or destination (reg/VRAM)
always_comb 
begin
  if(slv_reg_wren && (~axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS]) ) // choose VRAM mode 
  begin
    wea_en = S_AXI_WSTRB;
    Address_to_VRAM = axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB];
  end
  else begin                                                    // we can keep reading since read not ready
    Address_to_VRAM = axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB];
    wea_en = 4'b0;
  end
end
blk_mem_gen_0 ram0(
                    .addra(Address_to_VRAM),  //the most significant bit is used for 8 additional register
                    .clka(S_AXI_ACLK),
                    .dina(S_AXI_WDATA),
                    .douta(reg_data_out)
                    ,.ena(1'b1),
                    .wea(wea_en),
                    
                    .addrb(address_to_char),
                    .clkb(S_AXI_ACLK),
                    .dinb(),
                    .doutb(char_from_VRAM),
                    .enb(1'b1),
                    .web(4'b0)
);
//-------------------------------------------provided logic------------------------------------------//
 always_ff @( posedge S_AXI_ACLK )
 begin
   if ( S_AXI_ARESETN == 1'b0 )
     begin
         for (integer i = 0; i < 2**C_S_AXI_ADDR_WIDTH; i++)
         begin
            slv_regs[i] <= 0;
         end
     end
   else begin
     if (slv_reg_wren && axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS])
       begin
         for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
           if ( S_AXI_WSTRB[byte_index] == 1 ) 
           begin
             slv_regs[axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]-2048][(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8]; //2048 is the most significant bit
           end  
       end
   end
 end    

always_ff @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_bvalid  <= 0;
      axi_bresp   <= 2'b0;
    end 
  else
    begin    
      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
        begin
          axi_bvalid <= 1'b1;
          axi_bresp  <= 2'b0; // 'OKAY' response 
        end                   // work error responses in future
      else
        begin
          if (S_AXI_BREADY && axi_bvalid)   
            begin
              axi_bvalid <= 1'b0; 
            end  
        end
    end
end   

always_ff @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_arready <= 1'b0;
      axi_araddr  <= 32'b0;
    end 
  else
    begin    
      if (~axi_arready && S_AXI_ARVALID)
        begin
          // indicates that the slave has acceped the valid read address
          axi_arready <= 1'b1;
          // Read address latching
          axi_araddr  <= S_AXI_ARADDR;
        end
      else
        begin
          axi_arready <= 1'b0;
        end
    end 
end       
//-------------------------------------------provided logic------------------------------------------// 
always_ff @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_rvalid <= 0;
      axi_rresp  <= 0;
    end 
  else
    begin    
      if (count == 3 && ~axi_rvalid) //wait two cycle for rvalid
        begin
          // Valid read data is available at the read data bus
          axi_rvalid <= 1'b1;
          axi_rresp  <= 2'b0; // 'OKAY' response
        end   
      else if (axi_rvalid && S_AXI_RREADY)
        begin
          // Read data is accepted by the master
          axi_rvalid <= 1'b0;
        end                
    end
end    
logic address_assert;
assign address_assert = ~axi_arready && S_AXI_ARVALID;
// //wait two cycle to get daata ready count start from when address is asserted
always_ff @( posedge S_AXI_ACLK ) 
begin
  if(address_assert) begin  
    count <= 1;  
  end
  if(count == 1) begin
    count <= 2;
  end
  if(count == 2) begin
    read_ready <= 1'b1;
    count <= 3;
  end
  if(count == 3) begin
    read_ready <= 1'b0;
    count <= 0;
  end
end

//------------------------------------provided--------------------------------------//
// Output register or memory read data
always_ff @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_rdata  <= 0;
    end 
  else
    begin    
      // When there is a valid read address (S_AXI_ARVALID) with 
      // acceptance of read address by the slave (axi_arready), 
      // output the read dada 
      if (read_ready) //wait end
        begin
          axi_rdata <= reg_data_out;     // register read data
        end   
    end
end    
//------------------------------------provided--------------------------------------//
//logic for platte
logic [3:0] fgd_index, bkg_index;
logic [31:0]F_data, B_data;
logic [11:0]F_rgb, B_rgb;
// //local logic for color mapper
logic [C_S_AXI_DATA_WIDTH-1:0]cur_data;
logic [9:0]row;
logic [9:0]column;
logic [15:0] char;
logic [9:0] offset_x;
logic [9:0] offset_y;
logic [10:0] fon_address;
logic [7:0] print_data;
logic [9:0] offset_x_1;
logic [7:0] offset_r;
logic IVN;
logic [10:0]char_e;

//Add user logic here                 
//each data is 4 byte but 2 char   one row -- 80 char
// one address 2 char
// address * 2 = row * 80 + 2 * column
assign column = DrawX / 16 ;                                 // column index     
assign offset_x = DrawX % 16;                   // column offset          
assign row = DrawY / 16;                                    // row index
assign offset_y = DrawY % 16 ;                   // row offset
assign address_to_char  = row * 40 + column  ;                //assign address_to_char[9:0] = row * 20 + column ;                 
assign cur_data = char_from_VRAM;
always_comb
   begin
        if( offset_x<=7 && offset_x >= 0) begin
          char = cur_data[15:0];
          offset_x_1=offset_x;
          IVN = char[15]; //get inverse bit
           // get color
          fgd_index = cur_data[7:4];
          bkg_index = cur_data[3:0];
        end
        else  if(offset_x>=8 && offset_x <=15 )
        begin 
          char = cur_data[31:16]; 
          offset_x_1=offset_x-8;
          IVN = char[31]; 
          fgd_index = cur_data[23:20];
          bkg_index = cur_data[19:16];
        end
        F_data = slv_regs[fgd_index/2];
        B_data = slv_regs[bkg_index/2];
        
        
        if((fgd_index % 2) == 0)begin
                F_rgb = F_data[12:1];
        end
        else begin
                F_rgb = F_data[24:13];
        end 
        
        if((bkg_index % 2) == 0)begin
                B_rgb = B_data[12:1];
        end
        else begin
                B_rgb = B_data[24:13];
        end             
        char_e= {{char[14:8]},{4'b0000}};
        fon_address=char_e + offset_y; // convert to fon address   
   end

// get the print data
   font_rom my_font( .addr(fon_address), .data(print_data));                  
// draw x draw y

   always_comb
   begin
       offset_r=7-offset_x_1;
       if(print_data[offset_r]==1)begin  // have data
            if(IVN == 0)begin
                   Red = F_rgb[11:8];
                   Green = F_rgb[7:4];
                   Blue = F_rgb[3:0]; 
            end
            else begin
                   Red =   B_rgb[11:8];
                   Green = B_rgb[7:4];
                   Blue = B_rgb[3:0];  
            end
        end
        else begin
            if(IVN == 0)begin
                   Red = B_rgb[11:8];
                   Green = B_rgb[7:4];
                   Blue = B_rgb[3:0]; 
            end
            else begin
                   Red = F_rgb[11:8];
                   Green = F_rgb[7:4];
                   Blue = F_rgb[3:0]; 
            end
        end
   end
//user logic ends
//           // call control bit
//           if(IVN==0)begin
//              if(fgd_offset==1)begin   // upper bit
//                   Red=slv_regs[fgd_reg][24:21];
//                   Green=slv_regs[fgd_reg][20:17];
//                   Blue=slv_regs[fgd_reg][16:13];
//               end
//               else if(fgd_offset==0) begin   //lower bit
//                   Red=slv_regs[fgd_reg][12:9];
//                   Green=slv_regs[fgd_reg][8:5];
//                   Blue=slv_regs[fgd_reg][4:1];
//               end
//           end
//           else begin  // IVN ==1
//           if(bkg_offset==1)begin // upper bit
//                   Red=slv_regs[bkg_reg][24:21];
//                   Green=slv_regs[bkg_reg][20:17];
//                   Blue=slv_regs[bkg_reg][16:13];
//            end
//            else if(bkg_offset==0) begin  // lower bit
//                   Red=slv_regs[bkg_reg][12:9];
//                   Green=slv_regs[bkg_reg][8:5];
//                   Blue=slv_regs[bkg_reg][4:1];
//               end
//           end
//       end
//       else if(print_data[offset_r]==0)  begin // no data
//           if(IVN==0) // no reverse bkg
//           begin
//               if(bkg_offset==1)begin
//                   Red=slv_regs[bkg_reg][24:21];
//                   Green=slv_regs[bkg_reg][20:17];
//                   Blue=slv_regs[bkg_reg][16:13];
//            end
//            else if(bkg_offset==0) begin
//                   Red=slv_regs[bkg_reg][12:9];
//                   Green=slv_regs[bkg_reg][8:5];
//                   Blue=slv_regs[bkg_reg][4:1];
//               end
//           end
//           else if(IVN == 1) begin  // rever se bkg
//               if(fgd_offset==1)begin
//                   Red=slv_regs[fgd_reg][24:21];
//                   Green=slv_regs[fgd_reg][20:17];
//                   Blue=slv_regs[fgd_reg][16:13];
//               end
//               else if(fgd_offset==0) begin
//                   Red=slv_regs[fgd_reg][12:9];
//                   Green=slv_regs[fgd_reg][8:5];
//                   Blue=slv_regs[fgd_reg][4:1];
//               end
//           end
//        end
endmodule