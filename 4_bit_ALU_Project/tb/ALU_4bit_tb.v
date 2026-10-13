`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:15:13 PM
// Design Name: 
// Module Name: ALU_4bit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_4bit_tb();
    reg  [3:0] a, b, opcode;
    wire [7:0] result;
    wire       carry, zero, overflow, negative;

    alu_4bit uut (
        .a(a), .b(b), .opcode(opcode),
        .result(result), .carry(carry), .zero(zero), .overflow(overflow), .negative(negative)
    );

    integer errors;
    initial begin
        $display("Student Name: Hoang Ngoc Long");
        $display("Roll Number : SE204586");
        a = 4'd10; 
        b = 4'd0; 
        errors = 0;

        $display("- PART 1: ARITHMETIC -");
        opcode = 4'b0000; #10;
        if (result[3:0] !== (a + b)) begin $display("ADDITION ERROR!"); errors = errors + 1; end
        
        opcode = 4'b0001; #10;
        if (result[3:0] !== (a - b)) begin $display("SUBTRACTION ERROR!"); errors = errors + 1; end

        opcode = 4'b1000; #10;
        if (result !== (a * b)) begin $display("MULTIPlICATION ERROR!"); errors = errors + 1; end

        opcode = 4'b1001; #10; 
        if (result[3:0] !== (a / b) || result[7:4] !== (a % b)) begin $display("DIVISION ERROR!"); errors = errors + 1; end
        
        $display("- PART 2: LOGIC & SHIFT -");
        opcode = 4'b0010; #10;
        if (result[3:0] !== (a & b)) begin $display("AND LOGIC ERROR!"); errors = errors + 1; end
        opcode = 4'b0011; #10;
        if (result[3:0] !== (a | b)) begin $display("OR LOGIC ERROR!"); errors = errors + 1; end
        opcode = 4'b0100; #10;
        if (result[3:0] !== (a ^ b)) begin $display("XOR LOGIC ERROR!"); errors = errors + 1; end
        opcode = 4'b0101; #10;
        if (result[3:0] !== (~a & 4'hf)) begin $display("NOT LOGIC ERROR!"); errors = errors + 1; end
        opcode = 4'b0110; #10;
        if (result[3:0] !== ((a << 1) & 4'hf)) begin $display("SHIFT LEFT ERROR!"); errors = errors + 1; end
        opcode = 4'b0111; #10;
        if (result[3:0] !== (a >> 1)) begin $display("SHIFT RIGHT ERROR!"); errors = errors + 1; end
        
        if (errors == 0) begin
            $display(">>> TEST RESULT: PASS");
        end else begin
            $display(">>> TEST RESULT: FAIL WITH %0d ERRORS!", errors);
        end
        $finish;
    end
endmodule
