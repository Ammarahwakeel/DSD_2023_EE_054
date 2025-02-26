module project5_tb;

// Declare testbench signals
logic a0, a1, a2, a3; //for cathodes
logic sel_0, sel_1, sel_2;// for anodes
logic seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G, DP;
logic AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7;

localparam period= 10;
project5 uut (
    .a0(a0), .a1(a1), .a2(a2), .a3(a3),
    .sel_0(sel_0), .sel_1(sel_1), .sel_2(sel_2),
    .seg_A(seg_A), .seg_B(seg_B), .seg_C(seg_C), .seg_D(seg_D),
    .seg_E(seg_E), .seg_F(seg_F), .seg_G(seg_G), .DP(DP),
    .AN0(AN0), .AN1(AN1), .AN2(AN2), .AN3(AN3),
    .AN4(AN4), .AN5(AN5), .AN6(AN6), .AN7(AN7)
 );

 // Test sequence
  initial begin
// combinations for cathodes:
a0 = 0; a1 = 0; a2 = 0; a3 = 0; // 0000 (0)
sel_0 = 0; sel_1 = 0; sel_2 = 0; // 000 (0)
#period;

a0 = 0; a1 = 0; a2 = 0; a3 = 1; // 0001 (1)
sel_0 = 0; sel_1 = 0; sel_2 = 1; // 001 (1)
#period;

a0 = 0; a1 = 0; a2 = 1; a3 = 0; // 0010 (2)
sel_0 = 0; sel_1 = 1; sel_2 = 0; // 010 (2)
#period;

a0 = 0; a1 = 0; a2 = 1; a3 = 1; // 0011 (3)
sel_0 = 0; sel_1 = 1; sel_2 = 1; // 011 (3)
#period;

a0 = 0; a1 = 1; a2 = 0; a3 = 0; // 0100 (4)
sel_0 = 1; sel_1 = 0; sel_2 = 0; // 100 (4)
#period;

a0 = 0; a1 = 1; a2 = 0; a3 = 1; // 0101 (5)
sel_0 = 1; sel_1 = 0; sel_2 = 1; // 101 (5)
#period;

a0 = 0; a1 = 1; a2 = 1; a3 = 0; // 0110 (6)
sel_0 = 1; sel_1 = 1; sel_2 = 0; // 110 (6)
#period;

a0 = 0; a1 = 1; a2 = 1; a3 = 1; // 0111 (7)
sel_0 = 1; sel_1 = 1; sel_2 = 1; // 111 (7)
#period;

a0 = 1; a1 = 0; a2 = 0; a3 = 0; // 1000 (8)
sel_0 = 0; sel_1 = 0; sel_2 = 0; // 000 (0)
#period;

a0 = 1; a1 = 0; a2 = 0; a3 = 1; // 1001 (9)
sel_0 = 0; sel_1 = 0; sel_2 = 1; // 001 (1)
#period;

a0 = 1; a1 = 0; a2 = 1; a3 = 0; // 1010 (A)
sel_0 = 0; sel_1 = 1; sel_2 = 0; // 010 (2)
#period;

a0 = 1; a1 = 0; a2 = 1; a3 = 1; // 1011 (B)
sel_0 = 0; sel_1 = 1; sel_2 = 1; // 011 (3)
#period;

a0 = 1; a1 = 1; a2 = 0; a3 = 0; // 1100 (C)
sel_0 = 1; sel_1 = 0; sel_2 = 0; // 100 (4)
#period;

a0 = 1; a1 = 1; a2 = 0; a3 = 1; // 1101 (D)
sel_0 = 1; sel_1 = 0; sel_2 = 1; // 101 (5)
#period;

a0 = 1; a1 = 1; a2 = 1; a3 = 0; // 1110 (E)
sel_0 = 1; sel_1 = 1; sel_2 = 0; // 110 (6)
#period;

a0 = 1; a1 = 1; a2 = 1; a3 = 1; // 1111 (F)
sel_0 = 1; sel_1 = 1; sel_2 = 1; // 111 (7)
#period;


   
$stop;
end
initial begin
$monitor("Time=%0t | a=%b%b%b%b | sel=%b%b%b | seg=%b%b%b%b%b%b%b | DP=%b | AN=%b%b%b%b%b%b%b%b",
             $time, a3, a2, a1, a0, sel_2, sel_1, sel_0, 
             seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G, DP,
             AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7);
    
end
endmodule
