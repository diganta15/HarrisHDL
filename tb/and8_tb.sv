`timescale 1ns/1ps

module and8_tb;

  logic [7:0] a;
  logic y;

  // DUT instantiation
  and8 dut (
    .a(a),
    .y(y)
  );

  initial begin
    $display("     a      | y");
    $display("----------------");

    for (int i = 0; i < 256; i++) begin
      a = i;
      #1;
      $display("%08b |  %b", a, y);
    end

    $finish;
  end

endmodule