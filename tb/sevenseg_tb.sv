`timescale 1ns/1ps

module sevenseg_tb;

  // Testbench signals
  logic [3:0] data;
  logic [6:0] segments;

  // Instantiate the module under test (MUT)
  sevenseg dut (
    .data(data),
    .segments(segments)
  );

  // Task to display output
  task display_output;
    $display("data = %0d (0x%0h), segments = %b", data, data, segments);
  endtask

  initial begin
    $display("Starting sevenseg testbench...");

    // Test values from 0 to 9
    for (int i = 0; i <= 9; i++) begin
      data = i; #10;
      display_output();
    end

    // Test default (invalid input)
    data = 4'b1111; #10;
    display_output();

    $display("Testbench completed.");
    $finish;
  end

endmodule
