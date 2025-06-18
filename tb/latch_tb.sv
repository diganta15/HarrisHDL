`timescale 1ns/1ps

module latch_tb;

  logic clk;
  logic [3:0] d;
  logic [3:0] q;

  // Instantiate the DUT
  latch dut (
    .clk(clk),
    .d(d),
    .q(q)
  );

  initial begin
    $display("Time | clk |   d   |   q");
    $display("-----------------------------");

    // Initial values
    clk = 0; d = 4'b0000; #2;
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    // Latch is transparent when clk = 1
    clk = 1; d = 4'b1010; #3;
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    d = 4'b1111; #3;
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    // Latch holds value when clk = 0
    clk = 0; d = 4'b0011; #3;
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    // Change input again with latch disabled
    d = 4'b1001; #3;
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    // Enable latch again
    clk = 1; #2;
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    $finish;
  end

endmodule
