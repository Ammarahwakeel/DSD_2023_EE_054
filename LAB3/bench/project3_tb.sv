`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 07:41:50 PM
// Design Name: 
// Module Name: project3_tb
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


module project3_tb;
// defining parameters for test bench.
    logic a1;
    logic b1;
    logic c1;
    logic y1;
    logic x1;
    //defining peiod for the wave to hold value
    localparam period = 10;
    
labdsd1 UUT(
//mapping parameters of test bench with rtl parameter
.a(a1),
.b(b1),
.c(c1),
.y(y1),
.x(x1)
);
initial //initial block executes only once
begin
// Provide different combinations of the inputs to check validity of code
a1 = 0; b1 = 0; c1 = 0;
#period;
a1 = 0; b1 = 0; c1 = 1;
#period;
a1 = 0; b1 = 1; c1 = 0;
#period;
a1 = 0; b1 = 1; c1 = 1;
#period;
a1 = 1; b1 = 0; c1 = 0;
#period;
a1 = 1; b1 = 0; c1 = 1;
#period;
a1 = 1; b1 = 1; c1 = 0;
#period;
a1 = 1; b1 = 1; c1 = 1;
#period;
$stop;
end
initial
begin
/*the following system task will print out the signal values
every time they change on the Transcript Window */
$monitor("y=%b, x=%b, a=%b, b=%b, c=%b", y1, x1, a1, b1, c1);
end  
endmodule
