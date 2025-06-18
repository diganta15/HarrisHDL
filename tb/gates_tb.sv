`timescale 1ns/1ps

module tb_gates;

  logic [3:0] a, b;
  logic [3:0] y1, y2, y3, y4, y5;

  // DUT instantiation
  gates dut (
    .a(a),
    .b(b),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4),
    .y5(y5)
  );

  initial begin
    $display("  a   |   b   ||  &   |  |   |  ^   | NAND | NOR ");
    $display("--------------------------------------------------");

    for (int i = 0; i < 16; i++) begin
      for (int j = 0; j < 16; j++) begin
        a = i;
        b = j;
        #1;
        $display("%04b | %04b || %04b | %04b | %04b | %04b | %04b",
                 a, b, y1, y2, y3, y4, y5);
      end
    end

    $finish;
  end

endmodule
