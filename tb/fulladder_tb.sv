`timescale 1ns/1ps

module fulladder_tb;

  logic a, b, cin;
  logic s, cout;

  // Instantiate DUT
  fulladder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
  );

  initial begin
    $display("a b cin | s cout");
    $display("----------------");

    for (int i = 0; i < 8; i++) begin
      {a, b, cin} = i[2:0]; // assign bits from i to a, b, cin
      #1;
      $display("%b %b  %b  | %b   %b", a, b, cin, s, cout);
    end

    $finish;
  end

endmodule
