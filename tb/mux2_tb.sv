`timescale 1ns/1ps

module mux2_tb;

  logic [3:0] d0, d1;
  logic s;
  logic [3:0] y;

  // DUT instantiation
  mux2 dut (
    .d0(d0),
    .d1(d1),
    .s(s),
    .y(y)
  );

  initial begin
    $display("  s  |  d0   |  d1   ||   y");
    $display("------------------------------");

    for (int i = 0; i < 16; i++) begin
      for (int j = 0; j < 16; j++) begin
        d0 = i;
        d1 = j;

        s = 0; #1;
        $display("  %b  | %04b | %04b || %04b", s, d0, d1, y);

        s = 1; #1;
        $display("  %b  | %04b | %04b || %04b", s, d0, d1, y);
      end
    end

    $finish;
  end

endmodule
