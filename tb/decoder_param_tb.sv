`timescale 1ns/1ps

module decoder_param_tb;

    // Parameters
    parameter N = 3;
    localparam Y_WIDTH = 2 ** N;

    // Testbench signals
    logic [N-1:0] a;
    logic [Y_WIDTH-1:0] y;

    // Instantiate the decoder
    decoder_param #(.N(N)) dut (
        .a(a),
        .y(y)
    );

    // Test procedure
    initial begin
        $display("Time\t a \t| y");
        $display("----------------------------");
        for (int i = 0; i < (1 << N); i++) begin
            a = i;
            #1; // Wait for combinational logic to settle
            $display("%0t\t %b \t| %b", $time, a, y);
        end
        $finish;
    end

endmodule
