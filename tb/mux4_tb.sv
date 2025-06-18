`timescale 1ns/1ps

module mux4_tb;

  logic [3:0] d0, d1, d2, d3;
  logic [1:0] s;
  logic [3:0] y;

  // DUT instantiation
  mux4 dut (
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .s(s),
    .y(y)
  );

  initial begin
    $display(" s  |  d0  |  d1  |  d2  |  d3  ||   y");
    $display("------------------------------------------");

    // Try a small set of combinations to demonstrate correct selection
    for (int i = 0; i < 4; i++) begin
      d0 = 4'b0000 + i;
      d1 = 4'b0100 + i;
      d2 = 4'b1000 + i;
      d3 = 4'b1100 + i;

      for (int sel = 0; sel < 4; sel++) begin
        s = sel;
        #1;
        $display(" %02b | %04b | %04b | %04b | %04b || %04b", 
                  s, d0, d1, d2, d3, y);
      end
    end

    $finish;
  end

endmodule
