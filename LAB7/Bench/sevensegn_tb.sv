`timescale 1ns / 1ps

module sevenseg_tb;

    // defining signals
    reg clk;
    reg reset;
    reg write;
    reg [3:0] num;
    reg [2:0] sel;
    wire [7:0] an;
    wire [6:0] seg;
   

    // mapping signals
    sevenseg UUT (
        .clk(clk),
        .reset(reset),
        .write(write),
        .num(num),
        .sel(sel),
        .an(an),
        .seg(seg)
       
    );

    // Generate a 100 MHz clock
    always #5 clk = ~clk; 

    initial begin
       
        clk = 0;
        reset = 1;
        write = 0;
        num = 4'b0000;
        sel = 3'b000;
        
        #10 reset = 0;
        
    
        
        // testing with my roll no 2023EE54

        #10 write = 1; sel = 3'b000; num = 4'b0100; // Store '4'
        #10 write = 1; sel = 3'b001; num = 4'b0101; // Store '5'
        #10 write = 1; sel = 3'b010; num = 4'b1110; // Store 'e'
        #10 write = 1; sel = 3'b011; num = 4'b1110; // Store 'e'
        #10 write = 1; sel = 3'b100; num = 4'b0011; // Store '3'
        #10 write = 1; sel = 3'b101; num = 4'b0010; // Store '2'
        #10 write = 1; sel = 3'b110; num = 4'b0000; // Store '0'
        #10 write = 1; sel = 3'b111; num = 4'b0010; // Store '2'
       // to display the stored values
        #10 write = 0;
        #100;

        // End the simulation
        $display("Testbench completed.");
 
    end
endmodule