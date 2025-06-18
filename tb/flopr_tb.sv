`timescale 1ns/1ps

module flopr_tb;

  logic clk;
  logic reset;
  logic [3:0] d;
  logic [3:0] q;

  // DUT instantiation
  flopr dut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );

  // Clock generation (10ns period)
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $display("Time | clk | rst |   d   |   q");
    $display("-----------------------------------");

    // Initial values
    d = 4'b0000;
    reset = 0;

    #2;  // time = 2, clk = 0
    $display("%4t |  %b  |  %b  | %04b | %04b", $time, clk, reset, d, q);

    // Trigger async reset
    reset = 1; #2;
    $display("%4t |  %b  |  %b  | %04b | %04b", $time, clk, reset, d, q);

    #1;  // reset still active during clk rising edge
    reset = 0; d = 4'b1010;

    #5;  // clk rising edge at t=10
    $display("%4t |  %b  |  %b  | %04b | %04b", $time, clk, reset, d, q);

    d = 4'b1100; #10; // Next clk rising edge
    $display("%4t |  %b  |  %b  | %04b | %04b", $time, clk, reset, d, q);

    // Trigger reset again mid-cycle
    reset = 1; #1;
    $display("%4t |  %b  |  %b  | %04b | %04b", $time, clk, reset, d, q);
    
    reset = 0; d = 4'b1111; #10;
    $display("%4t |  %b  |  %b  | %04b | %04b", $time, clk, reset, d, q);

    $finish;
  end

endmodule
