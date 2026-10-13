`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:13:15 PM
// Design Name: 
// Module Name: Multipledivide_4bit
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


module Muldiv_4bit(
    input  wire [3:0] a, b,
    output wire [7:0] out_mul,
    output wire [7:0] out_div
);
    assign out_mul = a * b;
    assign out_div = (b != 0) ? { (a % b), (a / b) } : 8'b1111_1111;
endmodule
