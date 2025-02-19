module dsdlab4_tb;
    logic a1, a0, b1, b0; // Inputs
    logic red, blue, green; // Outputs

    // Instantiate the module under test (UUT)
    dsdlab4 UUT(
        .a1(a1),
        .a0(a0),
        .b1(b1),
        .b0(b0),
        .red(red),
        .green(green),
        .blue(blue)
    );

    localparam period = 10; // Time period for delay

    initial begin
        // Provide all 16 combinations
        a1 = 0; a0 = 0; b1 = 0; b0 = 0; #period;
        a1 = 0; a0 = 0; b1 = 0; b0 = 1; #period;
        a1 = 0; a0 = 0; b1 = 1; b0 = 0; #period;
        a1 = 0; a0 = 0; b1 = 1; b0 = 1; #period;
        
        a1 = 0; a0 = 1; b1 = 0; b0 = 0; #period;
        a1 = 0; a0 = 1; b1 = 0; b0 = 1; #period;
        a1 = 0; a0 = 1; b1 = 1; b0 = 0; #period;
        a1 = 0; a0 = 1; b1 = 1; b0 = 1; #period;
        
        a1 = 1; a0 = 0; b1 = 0; b0 = 0; #period;
        a1 = 1; a0 = 0; b1 = 0; b0 = 1; #period;
        a1 = 1; a0 = 0; b1 = 1; b0 = 0; #period;
        a1 = 1; a0 = 0; b1 = 1; b0 = 1; #period;
        
        a1 = 1; a0 = 1; b1 = 0; b0 = 0; #period;
        a1 = 1; a0 = 1; b1 = 0; b0 = 1; #period;
        a1 = 1; a0 = 1; b1 = 1; b0 = 0; #period;
        a1 = 1; a0 = 1; b1 = 1; b0 = 1; #period;

        #period; // Ensure last state is captured before stopping
        $stop;
    end

    // Monitor signal changes
    initial begin
        $monitor("Time=%0t | a1=%b, a0=%b, b1=%b, b0=%b | red=%b, green=%b, blue=%b", 
                  $time, a1, a0, b1, b0, red, green, blue);
    end
endmodule
