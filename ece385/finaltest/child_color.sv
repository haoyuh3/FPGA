`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/10 14:43:59
// Design Name: 
// Module Name: child_color
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


module child_color(     input logic[7:0] child_red,
                        output logic[23:0] child_rgb

    );
    always_comb begin : child_color_map
        unique case(child_red)
            8'hff: child_rgb=24'hffffff;
            8'hf7: child_rgb=24'hf7f5f1;
            8'hf8: child_rgb=24'hf8f6f3;
            8'hf9: child_rgb=24'hf9f7f4;
            8'hfb: child_rgb=24'hfbfaf8;
            8'hfc: child_rgb=24'hfcfbf9;
            8'hfd: child_rgb=24'hfdfcfb;
            8'hfe: child_rgb=24'hfefdfd;
            8'hb5: child_rgb=24'hb5a279;
            8'h8b: child_rgb=24'h8b6c28;
            8'h8d: child_rgb=24'h8d6f2e;
            8'h84: child_rgb=24'h84641e;
            8'h76: child_rgb=24'h764f00;
            8'h9b: child_rgb=24'h9b834e;
            8'hf6: child_rgb=24'hf6f5f2;
            8'h92: child_rgb=24'h927333;
            8'hbe: child_rgb=24'hbeae8d;
            8'ha2: child_rgb=24'ha28c5b;
            8'h85: child_rgb=24'h856726;
            8'h88: child_rgb=24'h886a2b;
            8'h77: child_rgb=24'h77540c;
            8'ha3: child_rgb=24'ha38d60;
            8'hf5: child_rgb=24'hf5f4f1;
            8'h79: child_rgb=24'h795509;
            8'h86: child_rgb=24'h866724;
            8'ha5: child_rgb=24'ha57f30;
            8'ha8: child_rgb=24'ha88437;
            8'ha6: child_rgb=24'ha67e2e;
            8'hac: child_rgb=24'hac8d4c;
            8'hbf: child_rgb=24'hbfb091;
            8'hb6: child_rgb=24'hb6a47e;
            8'hfa: child_rgb=24'hfaf9f7;
            8'ha7: child_rgb=24'ha7946b;
            8'hd0: child_rgb=24'hd0c6b2;
            8'hd7: child_rgb=24'hd7cebb;
            8'hdb: child_rgb=24'hdbd3c2;
            8'hd8: child_rgb=24'hd8d0bd;
            8'hdc: child_rgb=24'hdcd5c4;
            8'hd5: child_rgb=24'hd5cdb9;
            8'hc1: child_rgb=24'hc1b498;
            8'hf4: child_rgb=24'hf4f3f0;
            8'h7f: child_rgb=24'h7f5e1c;
            8'hae: child_rgb=24'hae9256;
            8'hcc: child_rgb=24'hcca047;
            8'hcb: child_rgb=24'hcb9f45;
            8'hb8: child_rgb=24'hb88e38;
            8'h69: child_rgb=24'h693f00;
            8'h7c: child_rgb=24'h7c5910;
            8'h7e: child_rgb=24'h7e590c;
            8'h81: child_rgb=24'h815d13;
            8'h7d: child_rgb=24'h7d580b;
            8'h89: child_rgb=24'h89684e;
            8'h8e: child_rgb=24'h8e6e57;
            8'h8f: child_rgb=24'h8f6d57;
            8'h8a: child_rgb=24'h8a6a50;
            8'h83: child_rgb=24'h836320;
            8'h9e: child_rgb=24'h9e7c35;
            8'hca: child_rgb=24'hca9f45;
            8'hc8: child_rgb=24'hc89d45;
            8'hc6: child_rgb=24'hc69b43;
            8'hce: child_rgb=24'hcea146;
            8'h8c: child_rgb=24'h8c6d2f;
            8'h95: child_rgb=24'h957733;
            8'h97: child_rgb=24'h977528;
            8'h96: child_rgb=24'h967630;
            8'h90: child_rgb=24'h907130;
            8'h91: child_rgb=24'h917230;
            8'h87: child_rgb=24'h876726;
            8'h9d: child_rgb=24'h9d8777;
            8'hea: child_rgb=24'heae7e5;
            8'ha1: child_rgb=24'ha18c5d;
            8'ha4: child_rgb=24'ha48d5b;
            8'h94: child_rgb=24'h947432;
            8'h9f: child_rgb=24'h9f7d36;
            8'h9a: child_rgb=24'h9a7934;
            8'h82: child_rgb=24'h82622a;
            8'h98: child_rgb=24'h987733;
            8'h9c: child_rgb=24'h9c7b35;
            8'h99: child_rgb=24'h99762f;
            8'hd1: child_rgb=24'hd1c6ae;
            8'he1: child_rgb=24'he1dbce;
            8'hdd: child_rgb=24'hddd6c6;
            8'he9: child_rgb=24'he9e5dd;
            8'hc0: child_rgb=24'hc0a793;
            8'h93: child_rgb=24'h937433;
            8'h80: child_rgb=24'h805c0f;
            8'h54: child_rgb=24'h543930;
            8'h49: child_rgb=24'h492c2d;
            8'h62: child_rgb=24'h624533;
            8'hb7: child_rgb=24'hb78f3e;
            8'hc4: child_rgb=24'hc49a43;
            8'hc5: child_rgb=24'hc59b44;
            8'ha9: child_rgb=24'ha99770;
            8'hab: child_rgb=24'hab774e;
            8'haa: child_rgb=24'haa764f;
            8'h7b: child_rgb=24'h7b5404;
            8'h44: child_rgb=24'h442920;
            8'h43: child_rgb=24'h432729;
            8'h60: child_rgb=24'h604430;
            8'hbd: child_rgb=24'hbd953f;
            8'hd4: child_rgb=24'hd4a548;
            8'h74: child_rgb=24'h745106;
            8'hb1: child_rgb=24'hb1a282;
            8'ha0: child_rgb=24'ha0724d;
            8'hcd: child_rgb=24'hcdc3ad;
            8'hbb: child_rgb=24'hbbac8c;
            8'hb9: child_rgb=24'hb9ab8c;
            8'h68: child_rgb=24'h684a2a;
            8'h6e: child_rgb=24'h6e5131;
            8'h58: child_rgb=24'h583610;
            8'h5f: child_rgb=24'h5f3f33;
            8'h5d: child_rgb=24'h5d3d36;
            8'h6b: child_rgb=24'h6b4b3a;
            8'hb3: child_rgb=24'hb38d3b;
            8'had: child_rgb=24'had883b;
            8'hc2: child_rgb=24'hc29842;
            8'hc7: child_rgb=24'hc7bba2;
            8'h57: child_rgb=24'h573e3d;
            8'h3e: child_rgb=24'h3e2121;
            8'h73: child_rgb=24'h734c48;
            8'h72: child_rgb=24'h724c48;
            8'h71: child_rgb=24'h714b47;
            8'h75: child_rgb=24'h754e49;
            8'h67: child_rgb=24'h674541;
            8'h4c: child_rgb=24'h4c3131;
            8'h32: child_rgb=24'h321211;
            8'h45: child_rgb=24'h45261e;
            8'h70: child_rgb=24'h704a47;
            8'h6f: child_rgb=24'h6f4849;
            8'hc9: child_rgb=24'hc99e44;
            8'hc3: child_rgb=24'hc39842;
            8'h6c: child_rgb=24'h6c4400;
            8'h64: child_rgb=24'h644b41;
            8'h6d: child_rgb=24'h6d4b3f;
            8'h55: child_rgb=24'h553a31;
            8'h3c: child_rgb=24'h3c1c11;
            8'h5c: child_rgb=24'h5c4338;
            8'h4d: child_rgb=24'h4d3028;
            8'h5b: child_rgb=24'h5b3e35;
            8'hcf: child_rgb=24'hcfa347;
            8'h7a: child_rgb=24'h7a5347;
            8'h52: child_rgb=24'h52372f;
            8'h38: child_rgb=24'h38180f;
            8'h61: child_rgb=24'h61483e;
            8'h4e: child_rgb=24'h4e3129;
            8'h51: child_rgb=24'h51372f;
            8'h36: child_rgb=24'h36180f;
            8'h5a: child_rgb=24'h5a4139;
            8'h37: child_rgb=24'h37180f;
            8'h56: child_rgb=24'h563e33;
            8'h48: child_rgb=24'h482c25;
            8'hef: child_rgb=24'hefeceb;
            8'h63: child_rgb=24'h634439;
            8'h78: child_rgb=24'h785b2f;
            8'hb4: child_rgb=24'hb48d3c;
            8'he5: child_rgb=24'he5e2e0;
            8'h3a: child_rgb=24'h3a1c15;
            8'h66: child_rgb=24'h664e47;
            8'h6a: child_rgb=24'h6a5353;
            8'h47: child_rgb=24'h472a20;
            8'h5e: child_rgb=24'h5e4239;
            8'h4f: child_rgb=24'h4f3533;
            8'hb0: child_rgb=24'hb0a281;
            8'hf1: child_rgb=24'hf1efee;
            8'hf2: child_rgb=24'hf2f1f0;
            8'hd9: child_rgb=24'hd9d2c3;
            8'h30: child_rgb=24'h301315;
            8'h31: child_rgb=24'h31130d;
            8'h4b: child_rgb=24'h4b2e28;
            8'he8: child_rgb=24'he8e4da;
            8'h4a: child_rgb=24'h4a3027;
            8'hde: child_rgb=24'hded8d1;
            8'hf0: child_rgb=24'hf0eeec;
            8'hb2: child_rgb=24'hb2a053;
            8'hba: child_rgb=24'hbaada2;
            8'h42: child_rgb=24'h422922;
            8'h46: child_rgb=24'h462d26;
            8'h3f: child_rgb=24'h3f241b;
            8'hd2: child_rgb=24'hd2c8a2;
            8'hd6: child_rgb=24'hd6bb37;
            8'h41: child_rgb=24'h41261c;
            8'hec: child_rgb=24'hecce40;
            8'h65: child_rgb=24'h654231;
            8'he6: child_rgb=24'he6e0de;
            8'heb: child_rgb=24'hebe6e4;
            8'hed: child_rgb=24'hede8e6;
            8'hf3: child_rgb=24'hf3f2f2;
            8'he7: child_rgb=24'he7c843;
            8'haf: child_rgb=24'haf9733;
            8'he3: child_rgb=24'he3ada4;
            8'he2: child_rgb=24'he2a8a1;
            8'hee: child_rgb=24'heece45;
            8'he0: child_rgb=24'he0a9a4;
            8'hda: child_rgb=24'hdab944;
            8'h53: child_rgb=24'h533144;
            8'h59: child_rgb=24'h592c28;
            8'hdf: child_rgb=24'hdfa5a2;
            8'hd3: child_rgb=24'hd3b344;
            8'hbc: child_rgb=24'hbca335;
            8'he4: child_rgb=24'he4c640;
            8'h01: child_rgb=24'h010101;
            8'h0d: child_rgb=24'h0d0d0d;
            8'h11: child_rgb=24'h111111;
            8'h00: child_rgb=24'h000000;
            8'h0a: child_rgb=24'h0a040e;
            8'h09: child_rgb=24'h09040d;
            8'h0c: child_rgb=24'h0c0610;
            8'h0f: child_rgb=24'h0f0714;
            8'h2b: child_rgb=24'h2b2216;
            8'h2f: child_rgb=24'h2f2f30;
            8'h2d: child_rgb=24'h2d2d2d;
            8'h19: child_rgb=24'h191919;
            8'h12: child_rgb=24'h121212;
            8'h26: child_rgb=24'h261e15;
            8'h04: child_rgb=24'h04000e;
            8'h03: child_rgb=24'h030009;
            8'h39: child_rgb=24'h393644;
            8'h33: child_rgb=24'h332919;
            8'h0e: child_rgb=24'h0e0712;
            8'h0b: child_rgb=24'h0b050f;
            8'h13: child_rgb=24'h131313;
            8'h08: child_rgb=24'h08020d;
            8'h07: child_rgb=24'h07020f;
            8'h06: child_rgb=24'h06010e;
            8'h3d: child_rgb=24'h3d301c;
            8'h10: child_rgb=24'h100817;
            8'h22: child_rgb=24'h222222;
            8'h2a: child_rgb=24'h2a2a2a;
            8'h2c: child_rgb=24'h2c2316;
            8'h40: child_rgb=24'h404040;
            8'h05: child_rgb=24'h050505;
            8'h34: child_rgb=24'h34303a;
            8'h16: child_rgb=24'h161018;
            8'h20: child_rgb=24'h202020;
            8'h29: child_rgb=24'h292929;


        endcase
        
    end
endmodule
