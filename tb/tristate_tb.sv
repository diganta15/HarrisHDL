`timescale 1ns/1ps

module tristate_tb;

  logic [3:0] a;
  logic       en;
  tri   [3:0] y;

  // DUT instantiation
  tristate dut (
    .a(a),
    .en(en),
    .y(y)
  );

  initial begin
    $display(" en |   a   ||   y");
    $display("----------------------");

    // Case 1: Output driven
    a = 4'b1010; en = 1; 
    #1;
    $display(" %b  | %04b || %s", en, a, y);

    // Case 2: Output high-Z
    en = 0; 
    #1;
    $display(" %b  | %04b || %s", en, a, y);

    // Case 3: Change data while enabled
    en = 1; a = 4'b1100; 
    #1;
    $display(" %b  | %04b || %s", en, a, y);

    // Case 4: Change data while disabled
    en = 0; a = 4'b1111; 
    #1;
    $display(" %b  | %04b || %s", en, a, y);

    $finish;
  end

endmodule
