`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:07:38 PM
// Design Name: 
// Module Name: ALU_4bit
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


module alu_4bit(
    input  wire [3:0] a, b,
    input  wire [3:0] opcode,
    output wire [7:0] result,
    output wire       carry, zero, overflow, negative
);
    wire sub_en, is_arith, is_shl, is_shr;
    wire [3:0] sum, out_and, out_or, out_xor, out_not, out_shl, out_shr;
    wire [7:0] out_mul, out_div;
    wire c3, c4, bit_out_shl, bit_out_shr;

    contrlunit_4bit u_ctrl (
        .opcode(opcode), .sub_en(sub_en), 
        .is_arith(is_arith), .is_shl(is_shl), .is_shr(is_shr)
    );

    addsub_4bit u_addsub (
        .a(a), .b(b), .sub(sub_en), .sum(sum), .c3(c3), .c4(c4)
    );

    logic_ubit u_logic (
        .a(a), .b(b), .out_and(out_and), .out_or(out_or), .out_xor(out_xor), .out_not(out_not)
    );

    shift_4bit u_shift (
        .a(a), .out_shl(out_shl), .out_shr(out_shr), 
        .bit_out_shl(bit_out_shl), .bit_out_shr(bit_out_shr)
    );

    Muldiv_4bit u_muldiv (
        .a(a), .b(b), .out_mul(out_mul), .out_div(out_div)
    );

    kqmux_4bit u_mux (
        .opcode(opcode), .sum(sum), 
        .out_and(out_and), .out_or(out_or), .out_xor(out_xor), .out_not(out_not),
        .out_shl(out_shl), .out_shr(out_shr), 
        .out_mul(out_mul), .out_div(out_div), 
        .final_result(result)
    );

    flag_4bit u_flags (
        .result(result), .is_arith(is_arith), .is_shl(is_shl), .is_shr(is_shr),
        .c3(c3), .c4(c4), .bit_out_shl(bit_out_shl), .bit_out_shr(bit_out_shr),
        .carry(carry), .zero(zero), .overflow(overflow), .negative(negative)
    );
endmodule
