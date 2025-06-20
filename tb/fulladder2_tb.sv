`timescale 1ns/1ps

module fulladder2_tb;

  // Testbench signals
  logic a, b, cin;
  logic s, cout;

  // Instantiate the fulladder2 module
  fulladder2 dut (
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
  );

  // Task to display result
  task display_result;
    $display("a=%0b b=%0b cin=%0b | s=%0b cout=%0b", a, b, cin, s, cout);
  endtask

  initial begin
    $display("Starting fulladder2 testbench...");

    // Apply all 8 input combinations
    a = 0; b = 0; cin = 0; #10; display_result();
    a = 0; b = 0; cin = 1; #10; display_result();
    a = 0; b = 1; cin = 0; #10; display_result();
    a = 0; b = 1; cin = 1; #10; display_result();
    a = 1; b = 0; cin = 0; #10; display_result();
    a = 1; b = 0; cin = 1; #10; display_result();
    a = 1; b = 1; cin = 0; #10; display_result();
    a = 1; b = 1; cin = 1; #10; display_result();

    $display("Testbench completed.");
    $finish;
  end

endmodule
