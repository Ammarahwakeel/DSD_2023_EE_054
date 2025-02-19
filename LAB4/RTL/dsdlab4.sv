module dsdlab4(
    output logic red,
    output logic blue,
    output logic green,// defining outputs
    input logic a1,
    input logic a0,
    input logic b1,
    input logic b0
    
    );
    assign red= (~b1 & ~b0) | (a1&a0) | (~b1 & a0) | (~b1 & a1) | ( ~b0 & a1) ;
    assign green= (~a1 & ~a0 ) | (~a1 & b0) | (~a1 & b1)| (b1 & b0) | (~a0 & b1);
    assign blue= (a1&~b1) | (a0&~b0) | (~a0&b0) | (~a1&b1);
    

endmodule