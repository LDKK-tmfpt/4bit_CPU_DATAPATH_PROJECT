`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:14:54 PM
// Design Name: 
// Module Name: kqmux_bit
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


module kqmux_4bit(
    input  wire [3:0] opcode,
    input  wire [3:0] sum,
    input  wire [3:0] out_and, out_or, out_xor, out_not,
    input  wire [3:0] out_shl, out_shr,
    input  wire [7:0] out_mul, out_div,
    output reg  [7:0] final_result
);
    always @(*) begin
        case (opcode)
            4'b0000: final_result = {4'b0000, sum};
            4'b0001: final_result = {4'b0000, sum};
            4'b0010: final_result = {4'b0000, out_and};
            4'b0011: final_result = {4'b0000, out_or};
            4'b0100: final_result = {4'b0000, out_xor};
            4'b0101: final_result = {4'b0000, out_not};
            4'b0110: final_result = {4'b0000, out_shl};
            4'b0111: final_result = {4'b0000, out_shr};
            4'b1000: final_result = out_mul;
            4'b1001: final_result = out_div;
            default: final_result = 8'd0;
        endcase
    end
endmodule