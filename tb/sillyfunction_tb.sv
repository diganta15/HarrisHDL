`timescale 1ns/1ps

module sillyfunction_tb;

  logic a, b, c;
  logic y;

  // Instantiate the DUT (Device Under Test)
  sillyfunction dut (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );

  initial begin
    $display("a b c | y");
    $display("------------");
    for (int i = 0; i < 8; i++) begin
      {a, b, c} = i; // assign a, b, c from i
      $display("%b %b %b | %b", a, b, c, y);
    end
    $finish;
  end

endmodule