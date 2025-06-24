`timescale 1ns/1ps

module patternMealy_tb;

    reg clk, reset, a;
    wire y;

    // Instantiate DUT
    patternMealy dut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .y(y)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, patternMealy_tb);

        // Initialize signals
        clk = 0;
        reset = 1;
        a = 0;

        #12;
        reset = 0;

        // Apply input pattern: a=1, 0, 1, 0, ...
        repeat (2) @(posedge clk); a = 1;
        repeat (2) @(posedge clk); a = 0;
        repeat (2) @(posedge clk); a = 1;
        repeat (2) @(posedge clk); a = 0;
        repeat (2) @(posedge clk); a = 1;
        repeat (2) @(posedge clk); a = 0;

        #20 $finish;
    end

    // Print signal values
    initial begin
        $display("Time\tclk\treset\ta\tstate\ty");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, clk, reset, a, dut.state, y);
    end

endmodule
