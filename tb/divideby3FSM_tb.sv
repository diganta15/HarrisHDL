module dividedby3FSM_tb;

  logic clk;
  logic reset;
  logic y;

  // Instantiate the DUT (Device Under Test)
  dividedby3FSM dut (
    .clk(clk),
    .reset(reset),
    .y(y)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;

    // Apply reset
    #10;
    reset = 0;

    // Run for a few clock cycles
    repeat (10) @(posedge clk);

    // Finish simulation
    $finish;
  end

  // Monitor output
  initial begin
    $display("Time\tclk\treset\ty");
    $monitor("%0t\t%b\t%b\t%b", $time, clk, reset, y);
  end

endmodule
