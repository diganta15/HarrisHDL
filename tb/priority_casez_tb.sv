module priority_casez_tb;

    logic [3:0] a;
    logic [3:0] y;

    // Instantiate the DUT
    priority_casez dut (
        .a(a),
        .y(y)
    );

    // Stimulus block
    initial begin
        $display("Time\t a     => y");
        $monitor("%0t\t%b => %b", $time, a, y);

        // Apply test vectors
        a = 4'b0000; #10;
        a = 4'b0001; #10;
        a = 4'b0010; #10;
        a = 4'b0011; #10;
        a = 4'b0100; #10;
        a = 4'b0111; #10;
        a = 4'b1000; #10;
        a = 4'b1010; #10;
        a = 4'b1111; #10;

        $finish;
    end

endmodule
