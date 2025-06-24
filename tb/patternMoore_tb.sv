`timescale 1ns/1ps

module patternMoore_tb;

    reg clk, reset, a;
    wire y;

    // Instantiate DUT
    patternMoore dut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .y(y)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns period

    initial begin
        $dumpfile("patternMoore.vcd");
        $dumpvars(0, patternMoore_tb);

        // Initialize
        clk = 0;
        reset = 1;
        a = 0;

        #12 reset = 0;

        // Test pattern: 0, 1, 0, 1, 0, 1, 1, 0
        repeat (2) @(posedge clk); a = 0;
        repeat (2) @(posedge clk); a = 1;
        repeat (2) @(posedge clk); a = 0;
        repeat (2) @(posedge clk); a = 1;
        repeat (2) @(posedge clk); a = 1;
        repeat (2) @(posedge clk); a = 0;

        #20 $finish;
    end

    // Monitor output
    initial begin
        $display("Time\tclk\treset\ta\tstate\ty");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, clk, reset, a, dut.state, y);
    end

endmodule
