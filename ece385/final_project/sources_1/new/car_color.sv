`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/17 12:49:46
// Design Name: 
// Module Name: car_color
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


module car_color( input  logic[7:0] car_red,
                  output logic[23:0] car_rgb

    );
    always_comb begin : car_color_map
        unique case(car_red)
            8'hfd: car_rgb=24'hffffff;
            8'hc4: car_rgb=24'hc4c4c4;
            8'ha9: car_rgb=24'ha9a9a9;
            8'h00: car_rgb=24'h000000;
            8'he8: car_rgb=24'he8e8e8;
            8'h81: car_rgb=24'h817f7f;
            8'h3a: car_rgb=24'h3a3a3a;
            8'h61: car_rgb=24'h615659;
            8'h01: car_rgb=24'h010001;
            8'h28: car_rgb=24'h28292c;
            8'h08: car_rgb=24'h08090b;
            8'h6f: car_rgb=24'h6fa0b8;
            8'h27: car_rgb=24'h273942;
            8'h19: car_rgb=24'h192a32;
            8'ha8: car_rgb=24'ha8aaad;
            8'h8c: car_rgb=24'h8cc4e2;
            8'h13: car_rgb=24'h130e10;
            8'h96: car_rgb=24'h96d5f4;
            8'h2d: car_rgb=24'h2d2c2c;
            8'h14: car_rgb=24'h141918;
            8'h3b: car_rgb=24'h3b3e3a;
            8'h9b: car_rgb=24'h9ba09f;
            8'hee: car_rgb=24'heef1f0;
            8'h87: car_rgb=24'h871c37;
            8'h4e: car_rgb=24'h4e534d;
            8'hdf: car_rgb=24'hdf1f54;
            8'h6b: car_rgb=24'h6b6e68;
            8'hda: car_rgb=24'hda5843;
            8'hd1: car_rgb=24'hd1c427;
            8'hd3: car_rgb=24'hd3a62d;
            8'hcd: car_rgb=24'hcdf513;

        endcase
    end
endmodule


module start_color( input  logic[7:0] start_red,
                  output logic[23:0] start_rgb

    );
    always_comb begin : start_color_map
        unique case(start_red)
            8'h10: start_rgb=24'h100815;
        8'h11: start_rgb=24'h110816;
        8'h05: start_rgb=24'h05000a;
        8'h00: start_rgb=24'h000000;
        8'h0d: start_rgb=24'h0d0512;
        8'h12: start_rgb=24'h120815;
        8'h03: start_rgb=24'h030715;
        8'h0b: start_rgb=24'h0b0310;
        8'h08: start_rgb=24'h08000d;
        8'h4b: start_rgb=24'h4b444e;
        8'haf: start_rgb=24'hafacb1;
        8'haa: start_rgb=24'haaa7ac;
        8'ha9: start_rgb=24'ha9a6ab;
        8'hac: start_rgb=24'haca9ae;
        8'ha7: start_rgb=24'ha7a4a9;
        8'h20: start_rgb=24'h201925;
        8'h04: start_rgb=24'h040207;
        8'h0c: start_rgb=24'h0c0311;
        8'h90: start_rgb=24'h908d93;
        8'hae: start_rgb=24'haeabb0;
        8'h07: start_rgb=24'h070715;
        8'h53: start_rgb=24'h530e14;
        8'h78: start_rgb=24'h781114;
        8'h6b: start_rgb=24'h6b1014;
        8'h7b: start_rgb=24'h7b1114;
        8'h49: start_rgb=24'h490d14;
        8'h0f: start_rgb=24'h0f0815;
        8'h28: start_rgb=24'h28212d;
        8'hab: start_rgb=24'haba8ad;
        8'h3c: start_rgb=24'h3c3540;
        8'h79: start_rgb=24'h79747b;
        8'hff: start_rgb=24'hffffff;
        8'h2d: start_rgb=24'h2d2632;
        8'h02: start_rgb=24'h020008;
        8'hf6: start_rgb=24'hf6f6f8;
        8'h88: start_rgb=24'h881414;
        8'hcc: start_rgb=24'hcc1913;
        8'hb3: start_rgb=24'hb31713;
        8'hcf: start_rgb=24'hcf1913;
        8'h75: start_rgb=24'h751114;
        8'h5e: start_rgb=24'h5e5962;
        8'hfe: start_rgb=24'hfefeff;
        8'hfb: start_rgb=24'hfbfbfc;
        8'h29: start_rgb=24'h29222e;
        8'h09: start_rgb=24'h09010e;
        8'hd8: start_rgb=24'hd8d7da;
        8'h9e: start_rgb=24'h9e1513;
        8'hb6: start_rgb=24'hb61713;
        8'h68: start_rgb=24'h681014;
        8'h36: start_rgb=24'h362f3a;
        8'h54: start_rgb=24'h544e58;
        8'h63: start_rgb=24'h635e66;
        8'h1e: start_rgb=24'h1e1623;
        8'hd6: start_rgb=24'hd6d5d8;
        8'h0a: start_rgb=24'h0a0815;
        8'h76: start_rgb=24'h761214;
        8'hb4: start_rgb=24'hb41713;
        8'hb7: start_rgb=24'hb71713;
        8'h65: start_rgb=24'h651014;
        8'h2c: start_rgb=24'h2c2430;
        8'h0e: start_rgb=24'h0e0614;
        8'h15: start_rgb=24'h150d1a;
        8'h6a: start_rgb=24'h6a656e;
        8'h35: start_rgb=24'h352e39;
        8'h01: start_rgb=24'h010001;
        8'h5d: start_rgb=24'h5d5760;
        8'he4: start_rgb=24'he4e3e5;
        8'hd1: start_rgb=24'hd1cfd3;
        8'he7: start_rgb=24'he7e6e8;
        8'hdc: start_rgb=24'hdcdbde;
        8'hdb: start_rgb=24'hdbd9dc;
        8'hcd: start_rgb=24'hcdcbce;
        8'h1c: start_rgb=24'h1c1421;
        8'hf8: start_rgb=24'hf8f8f9;
        8'hd7: start_rgb=24'hd7d6d9;
        8'he2: start_rgb=24'he2e1e3;
        8'ha3: start_rgb=24'ha3a0a5;
        8'h99: start_rgb=24'h991513;
        8'h87: start_rgb=24'h871313;
        8'h86: start_rgb=24'h861313;
        8'h98: start_rgb=24'h981413;
        8'ha1: start_rgb=24'ha11513;
        8'ha2: start_rgb=24'ha21513;
        8'h96: start_rgb=24'h961413;
        8'h84: start_rgb=24'h841313;
        8'h9c: start_rgb=24'h9c1513;
        8'h5a: start_rgb=24'h5a0f14;
        8'hd9: start_rgb=24'hd9d7db;
        8'hde: start_rgb=24'hdedde0;
        8'hd2: start_rgb=24'hd2d0d4;
        8'h74: start_rgb=24'h747077;
        8'h1f: start_rgb=24'h1f1924;
        8'hd0: start_rgb=24'hd0ced1;
        8'h83: start_rgb=24'h831314;
        8'hc4: start_rgb=24'hc41913;
        8'had: start_rgb=24'had1613;
        8'hc7: start_rgb=24'hc71913;
        8'h71: start_rgb=24'h711114;
        8'hf0: start_rgb=24'hf0eff1;
        8'hbe: start_rgb=24'hbebcc0;
        8'h13: start_rgb=24'h130918;
        8'h5b: start_rgb=24'h5b565e;
        8'hee: start_rgb=24'heeedef;
        8'h06: start_rgb=24'h06000b;
        8'hb5: start_rgb=24'hb51713;
        8'hb9: start_rgb=24'hb91713;
        8'h62: start_rgb=24'h621014;
        8'h23: start_rgb=24'h231c28;
        8'h3e: start_rgb=24'h3e3742;
        8'h27: start_rgb=24'h272528;
        8'hef: start_rgb=24'hefeef0;
        8'hd3: start_rgb=24'hd3d2d5;
        8'hfc: start_rgb=24'hfcfcfd;
        8'hf2: start_rgb=24'hf2f2f3;
        8'h43: start_rgb=24'h433d48;
        8'h37: start_rgb=24'h37313c;
        8'h14: start_rgb=24'h140c19;
        8'he5: start_rgb=24'he5e5e7;
        8'he1: start_rgb=24'he1e0e2;
        8'hc9: start_rgb=24'hc9c7cb;
        8'h31: start_rgb=24'h312a36;
        8'h24: start_rgb=24'h240a15;
        8'h7e: start_rgb=24'h7e1214;
        8'hb2: start_rgb=24'hb21713;
        8'h1a: start_rgb=24'h1a0815;
        8'h2b: start_rgb=24'h2b0a15;
        8'h16: start_rgb=24'h160e1b;
        8'h39: start_rgb=24'h39323d;
        8'h1b: start_rgb=24'h1b1420;
        8'h69: start_rgb=24'h69646c;
        8'h4d: start_rgb=24'h4d4751;
        8'h8a: start_rgb=24'h8a1313;
        8'hb1: start_rgb=24'hb11713;
        8'ha0: start_rgb=24'ha01513;
        8'h9f: start_rgb=24'h9f1513;
        8'hb8: start_rgb=24'hb81713;
        8'h58: start_rgb=24'h580f14;
        8'h2a: start_rgb=24'h2a232f;
        8'h64: start_rgb=24'h645f67;
        8'h48: start_rgb=24'h48424c;
        8'h8d: start_rgb=24'h8d1413;
        8'ha5: start_rgb=24'ha51613;
        8'h9d: start_rgb=24'h9d1513;
        8'h38: start_rgb=24'h38313c;
        8'h82: start_rgb=24'h827e86;
        8'h50: start_rgb=24'h504a54;
        8'h57: start_rgb=24'h570f14;
        8'h70: start_rgb=24'h706c75;
        8'h59: start_rgb=24'h59535d;
        8'h85: start_rgb=24'h851313;
        8'h8f: start_rgb=24'h8f0000;
        8'h97: start_rgb=24'h970402;
        8'h19: start_rgb=24'h19111e;
        8'h52: start_rgb=24'h524d57;
        8'hb0: start_rgb=24'hb0aeb2;
        8'h9a: start_rgb=24'h9a979d;
        8'ha4: start_rgb=24'ha4a1a6;
        8'hf4: start_rgb=24'hf4f4f6;
        8'h7a: start_rgb=24'h7a767e;
        8'h66: start_rgb=24'h666069;
        8'h4a: start_rgb=24'h4a0d14;
        8'h44: start_rgb=24'h440d14;
        8'hc8: start_rgb=24'hc87b7a;
        8'h72: start_rgb=24'h721114;
        8'h3a: start_rgb=24'h3a0c14;
        8'h4f: start_rgb=24'h4f0e14;
        8'h32: start_rgb=24'h320b15;
        8'h8c: start_rgb=24'h8c0000;
        8'hd4: start_rgb=24'hd49897;
        8'h9b: start_rgb=24'h9b1513;
        8'ha6: start_rgb=24'ha61613;
        8'hc0: start_rgb=24'hc0bec2;
        8'hf3: start_rgb=24'hf3f2f4;
        8'h34: start_rgb=24'h342d38;
        8'h7c: start_rgb=24'h7c1214;
        8'h8e: start_rgb=24'h8e0000;
        8'hc3: start_rgb=24'hc36f6e;
        8'hc2: start_rgb=24'hc26c6b;
        8'hba: start_rgb=24'hbab8bc;
        8'h92: start_rgb=24'h920000;
        8'h7f: start_rgb=24'h7f0000;
        8'hbb: start_rgb=24'hbb5b5a;
        8'h94: start_rgb=24'h940504;
        8'he6: start_rgb=24'he6c5c5;
        8'heb: start_rgb=24'hebd0d0;
        8'hd5: start_rgb=24'hd59c9b;
        8'hce: start_rgb=24'hce8a89;
        8'h7d: start_rgb=24'h7d0000;
        8'h60: start_rgb=24'h600f14;
        8'h25: start_rgb=24'h251e2a;
        8'h42: start_rgb=24'h420c14;
        8'hc6: start_rgb=24'hc67575;
        8'h95: start_rgb=24'h950504;
        8'hc1: start_rgb=24'hc11813;
        8'h81: start_rgb=24'h810000;
        8'h51: start_rgb=24'h514b55;
        8'hda: start_rgb=24'hdad9dc;
        8'h93: start_rgb=24'h930000;
        8'hbc: start_rgb=24'hbcb9be;
        8'hca: start_rgb=24'hca8080;
        8'hcb: start_rgb=24'hcb8585;
        8'he3: start_rgb=24'he3bdbd;
        8'hea: start_rgb=24'heacdce;
        8'h80: start_rgb=24'h800000;
        8'h18: start_rgb=24'h18101d;
        8'hdd: start_rgb=24'hddaeae;
        8'h45: start_rgb=24'h454149;
        8'he9: start_rgb=24'he9caca;
        8'hfa: start_rgb=24'hfaf5f6;
        8'ha8: start_rgb=24'ha83939;
        8'h3d: start_rgb=24'h3d3c3f;
        8'hed: start_rgb=24'hedd5d6;
        8'h91: start_rgb=24'h910000;
        8'he8: start_rgb=24'he8e8ea;
        8'hdf: start_rgb=24'hdfdce1;
        8'hf9: start_rgb=24'hf9f2f3;
        8'h1d: start_rgb=24'h1d1522;
        8'hec: start_rgb=24'hececed;
        8'he0: start_rgb=24'he0dee2;
        8'hf5: start_rgb=24'hf5f4f6;
        8'h21: start_rgb=24'h211926;
        8'hfd: start_rgb=24'hfdfbfb;
        8'h61: start_rgb=24'h615c64;
        8'h89: start_rgb=24'h890000;
        8'hc5: start_rgb=24'hc51913;
        8'h4e: start_rgb=24'h4e4852;
        8'h56: start_rgb=24'h56505a;
        8'hbf: start_rgb=24'hbfbdc0;
        8'h6f: start_rgb=24'h6f1014;
        8'h67: start_rgb=24'h671014;
        8'h77: start_rgb=24'h777479;
        8'h26: start_rgb=24'h261f2b;
        8'h41: start_rgb=24'h413b45;
        8'hf1: start_rgb=24'hf1dedf;
        8'h46: start_rgb=24'h46404a;
        8'h40: start_rgb=24'h403944;
        8'hbd: start_rgb=24'hbdbbc0;
        8'hf7: start_rgb=24'hf7f7f8;
        8'h47: start_rgb=24'h474648;
        8'h6d: start_rgb=24'h6d6870;
        8'h33: start_rgb=24'h332c37;
        8'h73: start_rgb=24'h737275;
        8'h6c: start_rgb=24'h6c676f;
        8'h55: start_rgb=24'h550e14;
        8'h8b: start_rgb=24'h8b8a8d;

        endcase
        end
endmodule
