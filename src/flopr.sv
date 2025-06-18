module flopr(input logic clk,
            input logic reset,
            input logic[3:0]d,
            output logic[3:0]q);
    
//asynchronous reset
always_ff@(posedge clk, posedge reset) //remove reset for synchronous reset
    if(reset) q<=4'b0;
    else q<=d;
endmodule