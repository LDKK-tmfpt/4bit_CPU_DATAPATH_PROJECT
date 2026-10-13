`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:13:53 PM
// Design Name: 
// Module Name: contrlunit_4bit
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


module contrlunit_4bit(
    input  wire [3:0] opcode,
    output wire       sub_en,
    output wire       is_arith, is_shl, is_shr
);
    assign sub_en   = (opcode == 4'b0001);
    assign is_arith = (opcode == 4'b0000) || (opcode == 4'b0001);
    assign is_shl   = (opcode == 4'b0110);
    assign is_shr   = (opcode == 4'b0111);
endmodule
