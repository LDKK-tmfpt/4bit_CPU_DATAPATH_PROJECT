`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:12:50 PM
// Design Name: 
// Module Name: shift_4bit
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


module shift_4bit(
    input  wire [3:0] a,
    output wire [3:0] out_shl, out_shr,
    output wire       bit_out_shl, bit_out_shr
);
    assign out_shl = {a[2:0], 1'b0};
    assign bit_out_shl = a[3];
    assign out_shr = {1'b0, a[3:1]};
    assign bit_out_shr = a[0];
endmodule