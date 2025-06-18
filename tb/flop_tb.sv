`timescale 1ns/1ps

module flop_tb;

  logic clk;
  logic [3:0] d;
  logic [3:0] q;

  // Instantiate the DUT
  flop dut (
    .clk(clk),
    .d(d),
    .q(q)
  );

  // Clock generation: 10ns period
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $display("Time | clk |   d   |   q");
    $display("-----------------------------");

    // Apply input before clock goes high
    d = 4'b0001; #3;   // clk=0 here
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    #4;                // clk goes high at t=5, triggers rising edge
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    d = 4'b1010; #5;   // clk goes low at t=10
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    d = 4'b1100; #5;   // clk goes high at t=15 → triggers q update
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    d = 4'b1111; #5;   // clk low again at t=20 → no update
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    d = 4'b0011; #5;   // clk high at t=25 → triggers q update
    $display("%4t |  %b  | %04b | %04b", $time, clk, d, q);

    $finish;
  end

endmodule
