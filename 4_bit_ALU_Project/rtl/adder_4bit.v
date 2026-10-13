`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:12:03 PM
// Design Name: 
// Module Name: addsub_4bit
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


module addsub_4bit(
    input  wire [3:0] a, b,
    input  wire       sub, 
    output wire [3:0] sum,
    output wire       c3, c4
);
    wire [3:0] b_xor;
    wire c1, c2;
    
    assign b_xor[0] = b[0] ^ sub;
    assign b_xor[1] = b[1] ^ sub;
    assign b_xor[2] = b[2] ^ sub;
    assign b_xor[3] = b[3] ^ sub;

    fulladder fa0 (.a(a[0]), .b(b_xor[0]), .cin(sub), .sum(sum[0]), .cout(c1));
    fulladder fa1 (.a(a[1]), .b(b_xor[1]), .cin(c1),  .sum(sum[1]), .cout(c2));
    fulladder fa2 (.a(a[2]), .b(b_xor[2]), .cin(c2),  .sum(sum[2]), .cout(c3));
    fulladder fa3 (.a(a[3]), .b(b_xor[3]), .cin(c3),  .sum(sum[3]), .cout(c4));
endmodule
