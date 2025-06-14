module ALU_tb;
    logic [31:0] A, B;
    logic [2:0] opcode;
    logic enable;
    logic [31:0] result;
    logic ack;

    ALU uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .enable(enable),
        .result(result),
        .ack(ack)
    );

    initial begin
        $dumpfile("dumpfile.vcd");
    	$dumpvars(1);
        A = 32'd10;
        B = 32'd5;
        enable = 1;

        opcode = 3'b000; #10;
        $display("A + B = %d, ack = %b", result, ack);

        opcode = 3'b001; #10;
        $display("A - B = %d, ack = %b", result, ack);

        opcode = 3'b010; #10;
        $display("A + 1 = %d, ack = %b", result, ack);

        opcode = 3'b011; #10;
        $display("A - 1 = %d, ack = %b", result, ack);

        opcode = 3'b100; #10;
        $display("A = %d, ack = %b", result, ack);

        opcode = 3'b101; #10;
        $display("A Complement = %d, ack = %b", result, ack);

        opcode = 3'b110; #10;
        $display("A OR B = %d, ack = %b", result, ack);

        opcode = 3'b111; #10;
        $display("A AND B = %d, ack = %b", result, ack);

        enable = 0;
        opcode = 3'b000; #10;
        $display("Tri-state output when disabled: result = %h, ack = %b", result, ack);

        $finish;
    end
endmodule
