module latch(input logic clk,
            input logic [3:0]d,
            output logic [3:0]q);

always_latch begin
    if(clk) q<=d;
end

endmodule