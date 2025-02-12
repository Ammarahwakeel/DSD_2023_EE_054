`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2025 09:04:33 PM
// Design Name: 
// Module Name: labdsd1
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


module labdsd1( output logic x,
                output logic  y,
                input logic  a,
                input logic  b,
                input logic c 
 );
 // giving names to internediate signals.
       logic  not_c;
       logic a_or_b;
       logic a_nand_b;
       logic nandout_xor_orout;// xor gate which is the input signal of andgate(y output) has input from nand gate and or gate.
 // performing operations.
      assign not_c=~c; //not gate operation on c. 
      assign a_or_b=a|b; // or gate opeation on a,b.
      assign a_nand_b= ~(a&b); // nand gate operation on a,b.
      assign nandout_xor_orout=(a_nand_b) ^ (a_or_b); //performing xor operation on the outputs of nand gate and or gate.
 // opertions to get final  x and y output.
      assign x= (not_c)^(a_or_b);
      assign y=(a_or_b )& (nandout_xor_orout);            
  
    
endmodule
