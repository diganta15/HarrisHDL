`timescale 1ns/1ps

module andN_tb;

    // Parameters
    parameter WIDTH = 8;

    // Testbench signals
    logic [WIDTH-1:0] a;
    logic y;

    // DUT instance
    andN #(.width(WIDTH)) dut (
        .a(a),
        .y(y)
    );

    // Test procedure
    initial begin
        $display("Time\t\t a\t\t y");
        $display("----------------------------");

        // Test all 0s
        a = '0;
        #1 $display("%0t\t %b\t %b", $time, a, y);

        // Test all 1s
        a = '1;
        #1 $display("%0t\t %b\t %b", $time, a, y);

        // Test single 0 in different positions
        for (int i = 0; i < WIDTH; i++) begin
            a = '1;
            a[i] = 0;
            #1 $display("%0t\t %b\t %b", $time, a, y);
        end

        // Random values
        repeat (5) begin
            a = $random;
            #1 $display("%0t\t %b\t %b", $time, a, y);
        end

        $finish;
    end

endmodule
