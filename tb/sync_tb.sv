`timescale 1ns/1ps

module sync_tb;

  logic clk;
  logic d;
  logic q;

  // Instantiate the DUT
  sync dut (
    .clk(clk),
    .d(d),
    .q(q)
  );

  // Clock generation (10ns period)
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $display("Time | clk | d | q");
    $display("--------------------");

    d = 0; #3;  // t=3
    $display("%4t |  %b  | %b | %b", $time, clk, d, q);

    // Set d high asynchronously
    d = 1; #7;  // crosses rising edge at t=10
    $display("%4t |  %b  | %b | %b", $time, clk, d, q);

    #10;  // 2nd rising edge at t=20
    $display("%4t |  %b  | %b | %b", $time, clk, d, q);

    d = 0; #10; // goes low before next edge
    $display("%4t |  %b  | %b | %b", $time, clk, d, q);

    #10; // t = 40
    $display("%4t |  %b  | %b | %b", $time, clk, d, q);

    $finish;
  end

endmodule
