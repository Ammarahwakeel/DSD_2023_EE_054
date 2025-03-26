`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 11:32:47 PM
// Design Name: 
// Module Name: sevenseg
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


module sevenseg(
    input logic clk,     // FPGA clock (100 MHz)
    input logic reset,     // Reset signal 
    input logic write,
    input logic [2:0] sel,
    input logic [3:0] num,
    
    output logic [6:0]seg, // Segment outputs
    output logic [7:0] an // Anode controls 
    );
    logic  [2:0] count; // 3-bit output (0 to 7)
    logic [16:0] counter = 0;  // 17-bit counter (log2(125000) ? 17)
    logic clk_div = 0;  // 800 Hz clock signal
    logic [2:0] address; // 3bit address for reading
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_div <= 0;
        end else if (counter ==124999 ) begin  // Toggle at 62,500
            counter <= 0;
            clk_div <= ~clk_div; // Toggle output clock
        end else begin
            counter <= counter + 1;
        end
    end
   
   // 3-bit counter (Adder Circuit)
    always @(posedge clk_div or posedge reset) begin
        if (reset)
            count <= 3'b000;  // Reset to 0
        else if (count == 3'b111)
            count <= 3'b000;  // Reset to 0 after 7
        else
            count <= count + 1;  // Increment by 1
    end
    
 // mux which selects selector on the basis of write.
 logic [2:0] finalsel;
 always_comb begin
  case(write)
     1'b0: finalsel= count;
     1'b1: finalsel= sel;
     default: finalsel= count;
   endcase
 end
 
 // AND GATES FOR ENABLE
  logic en0,en1,en2,en3,en4,en5,en6,en7; // enable is the input of registers but it is the output of and operation between write and anode.
    
  assign en0 = ~an[0] & write;
  assign en1 = ~an[1] & write;
  assign en2 = ~an[2] & write;
  assign en3 = ~an[3] & write;
  assign en4 = ~an[4] & write;
  assign en5 = ~an[5] & write;
  assign en6 = ~an[6] & write;
  assign en7 = ~an[7] & write;
  
  //code for 8 registers
logic [3:0] registers [7:0];

// Behavioral Write Operation
always @(posedge clk or posedge reset) begin
   if (reset) begin
        // Reset all registers to 0
        registers[0] <= 4'b0000;
        registers[1] <= 4'b0000;
        registers[2] <= 4'b0000;
        registers[3] <= 4'b0000;
        registers[4] <= 4'b0000;
        registers[5] <= 4'b0000;
        registers[6] <= 4'b0000;
        registers[7] <= 4'b0000;
    end else begin
        // Write only to the enabled register
        if (en0) registers[0] <= num;
        if (en1) registers[1] <= num;
        if (en2) registers[2] <= num;
        if (en3) registers[3] <= num;
        if (en4) registers[4] <= num;
        if (en5) registers[5] <= num;
        if (en6) registers[6] <= num;
        if (en7) registers[7] <= num;
    end
end
// using a mux to map the outputs of register on seven segment cathode decoder.
logic [3:0] mux_out;
always_comb begin
case (finalsel)
            3'b000: mux_out =registers[0];
            3'b001: mux_out = registers[1];
            3'b010: mux_out =registers[2];
            3'b011: mux_out = registers[3];
            3'b100: mux_out = registers[4];
            3'b101: mux_out = registers[5];
            3'b110: mux_out = registers[6];
            3'b111: mux_out = registers[7];
            default:mux_out = registers[0]; // Default case
        endcase
    end

 always_comb begin
   
    case (mux_out)
     4'b0000:  seg = 7'b0000001; // 0
      4'b0001:  seg = 7'b1001111; // 1
      4'b0010:  seg = 7'b0010010; // 2
      4'b0011:  seg = 7'b0000110; // 3
      4'b0100:  seg= 7'b1001100; // 4
      4'b0101:  seg = 7'b0100100; // 5
      4'b0110:  seg = 7'b0100000; // 6
      4'b0111:  seg = 7'b0001111; // 7
      4'b1000:  seg = 7'b0000000; // 8
      4'b1001:  seg = 7'b0000100; // 9
      4'b1010:  seg = 7'b0001000; // A
      4'b1011:  seg = 7'b1100000; // B
      4'b1100:  seg = 7'b0110001; // C
      4'b1101:  seg = 7'b1000010; // D
      4'b1110:  seg = 7'b0110000; // E
      4'b1111:  seg = 7'b0111000; // F
      default:  seg = 7'b1111111; // Blank display
    endcase
        

end


// code for seven segment anode
  always_comb begin
   
    case (finalsel) // MSB to LSB
      3'b000: an = 8'b11111110; // Activate AN0
      3'b001: an = 8'b11111101; // Activate AN1
      3'b010: an = 8'b11111011; // Activate AN2
      3'b011:an=  8'b11110111; // Activate AN3
      3'b100: an = 8'b11101111; // Activate AN4
      3'b101: an = 8'b11011111; // Activate AN5
      3'b110: an = 8'b10111111; // Activate AN6
      3'b111: an = 8'b01111111; // Activate AN7
      default: an = 8'b11111111; // All off
    endcase
  end

      
endmodule
    