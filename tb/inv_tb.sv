`timescale 1ps/1ps

module inv_tb;

logic [3:0]a;
logic [3:0]y;

inv dut(
    .a(a),
    .y(y)
);

initial begin
    $display("a   |   y");
    $display("------------");

    for(int i=0; i<16; i++) begin
        a = i;
        #1
        $display("%04b | %04b",a,y);
    end

    $finish;
end
endmodule