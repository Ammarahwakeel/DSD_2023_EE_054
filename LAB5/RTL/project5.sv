module project5(
// declaring inputs and outputs.
  input logic a0,
  input logic a1,
  input logic a2,
  input logic a3,// defining the 4 bits of input a.
  input logic sel_0,
  input logic sel_1,
  input logic sel_2,
  
  output logic seg_A, // definig output segments.  
  output logic seg_B,
  output logic seg_C,
  output logic seg_D,
  output logic seg_E,
  output logic seg_F,
  output logic seg_G,
  output logic DP,
  
  output logic AN0,// anode declaration.
  output logic AN1,
  output logic AN2,
  output logic AN3,
  output logic AN4,
  output logic AN5,
  output logic AN6,
  output logic AN7
   
    );
    assign seg_A= (~a0& ~a1& ~a2& a3)| (~a0& a1& ~a2& ~a3)| (a0& a1& ~a2& a3) | (a0& ~a1& a2& a3);
    assign seg_B= (a0& a1& ~a3) | (a0& a2& a3) |(~a0& a1& ~a2& a3) | (a1& a2& ~a3);
    assign seg_C= (~a0& ~a1& a2& ~a3) | (a0& a1& a2) |( a0& a1& ~a3); 
    assign seg_D= (~a0 & ~a1 &~a2 & a3) | (~a0& a1& ~a2& ~a3) |( a1& a2& a3) | (a0& ~a1& a2& ~a3);
    assign seg_E= (~a0& a3) |( ~a1& ~a2& a3) | (~a0& a1& ~a2);
    assign seg_F = (~a0& ~a1& a3)| (~a0& ~a1& a2)| (~a0& a2& a3)|( a0& a1& ~a2& a3);
    assign seg_G= (~a0& ~a1& ~a2)| (~a0& a1& a2& a3)|(a0& a1& ~a2& ~a3);
    assign DP = 1;
    
    assign AN0= sel_0 | sel_1 | sel_2;
    assign AN1= sel_0 | sel_1 | ~sel_2;
    assign AN2= sel_0 | ~sel_1 | sel_2;
    assign AN3= sel_0 | ~sel_1 | ~sel_2;
    assign AN4= ~sel_0 | sel_1 | sel_2;
    assign AN5= ~sel_0 | sel_1 | ~sel_2;
    assign AN6= ~sel_0 | ~sel_1 | sel_2;
    assign AN7= ~sel_0 | ~sel_1 |~sel_2;
endmodule
