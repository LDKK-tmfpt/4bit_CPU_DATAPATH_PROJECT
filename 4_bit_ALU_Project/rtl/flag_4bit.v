`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:14:33 PM
// Design Name: 
// Module Name: flag_4bit
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


module flag_4bit(
input  wire [7:0] result,
    input  wire is_arith, is_shl, is_shr,
    input  wire c3, c4,
    input  wire bit_out_shl, bit_out_shr,
    output wire carry, zero, overflow, negative
);
    assign zero = (result == 8'd0);
    assign negative = result[3];
    assign carry = (is_arith & c4) | (is_shl & bit_out_shl) | (is_shr & bit_out_shr);
    assign overflow = is_arith & (c3 ^ c4);
    
endmodule
