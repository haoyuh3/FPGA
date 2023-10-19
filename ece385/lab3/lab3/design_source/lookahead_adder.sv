module lookahead_adder (
	input  [15:0] A, B,
	input  logic       cin,
	output [15:0] S,
	output logic        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
     logic c8,c4,c12;
     logic p0,p4,p8,p12;
     logic g0,g4,g8,g12;
     always_comb
     begin
     c4=g0|cin&p0;
     c8=g4|g0&p4|cin&p0&p4;
     c12=g4&p8|g0&p4&p8|cin&p0&p4&p8|g8;
     cout= g12| p12&g4&p8|p12&g0&p4&p8|p12&cin&p0&p4&p8|p12&g8;
     end
     
     CLA CLA1(A[3:0],B[3:0],cin,S[3:0],p0,g0);
     CLA CLA2(A[7:4],B[7:4],c4,S[7:4],p4,g4);
     CLA CLA3(A[11:8],B[11:8],c8,S[11:8],p8,g8);
     CLA CLA4(A[15:12],B[15:12],c12,S[15:12],p12,g12);
     
     

endmodule
module CLA(
           input logic [3:0]A,
           input logic [3:0]B,
           input logic Cin,
       
           output logic [3:0]Sum,
           output logic p,
           output logic g
);
           logic p0,p1,p2,p3;
           logic g0,g1,g2,g3;
           logic c1,c2,c3;
           
           always_comb//combinational
           begin
           
           p0=A[0]^B[0];
           p1=A[1]^B[1];
           p2=A[2]^B[2];
           p3=A[3]^B[3];
           
           g0=A[0]&B[0];
           g1=A[1]&B[1];
           g2=A[2]&B[2];
           g3=A[3]&B[3];
           
           g=g3| g2&p3 | g1&p3&p2 | g0&p3&p2&p1;
           p=p0&p1&p2&p3;
           
           
           c1=Cin&p0|g0;
           c2=Cin&p0&p1|g1|g0&p1;
           c3=Cin&p0&p1&p2|g2|g1&p2|g0&p1&p2;
           
           Sum[0]=Cin^p0;
           Sum[1]=c1^p1;
           Sum[2]=c2^p2;
           Sum[3]=c3^p3;
           
           
           end
           
           
           
           
           
endmodule

           