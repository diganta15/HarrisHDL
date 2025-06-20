`timescale 1ns/1ps

module decoder3_8_tb;

  // Testbench signals
  logic [2:0] a;
  logic [7:0] y;

  // Instantiate the decoder
  decoder3_8 dut (
    .a(a),
    .y(y)
  );

  // Display helper
  task display_output;
    $display("a = %b (%0d), y = %b", a, a, y);
  endtask

  initial begin
    $display("Starting decoder3_8 testbench...");

    // Apply all 3-bit combinations
    for (int i = 0; i < 8; i++) begin
      a = i[2:0];
      #10;
      display_output();
    end

    // Optionally test default case (though unreachable for 3-bit input)
    a = 3'bxxx; #10; display_output();

    $display("Testbench completed.");
    $finish;
  end

endmodule
