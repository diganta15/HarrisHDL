`timescale 1ns/1ps

module mux2_8_tb;

  logic [7:0] d0, d1;
  logic       s;
  logic [7:0] y;

  // DUT instantiation
  mux2_8 dut (
    .d0(d0),
    .d1(d1),
    .s(s),
    .y(y)
  );

  initial begin
    $display(" s |    d0    |    d1    ||    y");
    $display("--------------------------------------");

    for (int i = 0; i < 4; i++) begin
      d0 = $random & 8'hFF; // random 8-bit value
      d1 = $random & 8'hFF;

      s = 0; #1;
      $display(" %b | %08b | %08b || %08b", s, d0, d1, y);

      s = 1; #1;
      $display(" %b | %08b | %08b || %08b", s, d0, d1, y);
    end

    $finish;
  end

endmodule
