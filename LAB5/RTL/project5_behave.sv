module project5_behave(
  // Inputs
  input logic a0, a1, a2, a3,  // 4-bit input representing  (MSB: a0, LSB: a3)
  input logic sel_0, sel_1, sel_2, // 3-bit selector to choose active seven-segment display
  
  // Outputs
  output logic seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G, DP, // Segment outputs
  output logic AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7 // Anode controls
);
  // Behavioral logic for 7-segment display
  always_comb begin
    DP=1;
    case ({a0, a1, a2, a3}) // MSB to LSB
      4'b0000:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0000001; // 0
      4'b0001:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b1001111; // 1
      4'b0010:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0010010; // 2
      4'b0011:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0000110; // 3
      4'b0100:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G}= 7'b1001100; // 4
      4'b0101:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0100100; // 5
      4'b0110:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0100000; // 6
      4'b0111:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0001111; // 7
      4'b1000:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0000000; // 8
      4'b1001:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0000100; // 9
      4'b1010:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0001000; // A
      4'b1011:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b1100000; // B
      4'b1100:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0110001; // C
      4'b1101:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b1000010; // D
      4'b1110:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0110000; // E
      4'b1111:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b0111000; // F
      default:  {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G} = 7'b1111111; // Blank display
    endcase
  end
  // Behavioral logic for anode control (active-low logic)
  always_comb begin
   
    case ({sel_0, sel_1, sel_2}) // MSB to LSB
      3'b000: {AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b01111111; // Activate AN0
      3'b001: {AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b10111111; // Activate AN1
      3'b010: {AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b11011111; // Activate AN2
      3'b011: {AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b11101111; // Activate AN3
      3'b100:{AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b11110111; // Activate AN4
      3'b101: {AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b11111011; // Activate AN5
      3'b110: {AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b11111101; // Activate AN6
      3'b111: {AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b11111110; // Activate AN7
      default:{AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7} = 8'b11111111; // All off
    endcase
  end

 

endmodule
