module ALU(
    input logic [31:0] A,
    input logic [31:0] B,
    input logic [2:0] opcode,
    input logic enable,
    output logic [31:0] result,
    output logic ack
);
    always @ (A, B, opcode, enable) begin
        if (enable) begin
            case (opcode)
                3'b000: result = A + B;
                3'b001: result = A - B;
                3'b010: result = A + 1;
                3'b011: result = A - 1;
                3'b100: result = A;
                3'b101: result = ~A;
                3'b110: result = A | B;
                3'b111: result = A & B;
                default: result = 32'bz;
            endcase
            ack = 1;
        end else begin
            result = 32'bz;
            ack = 0;
        end
    end
endmodule
