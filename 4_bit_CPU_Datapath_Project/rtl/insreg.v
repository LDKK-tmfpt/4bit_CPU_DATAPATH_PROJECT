`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:50:29 AM
// Design Name: 
// Module Name: insreg
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


module instruction_register(
    input wire clk, reset, flush, ir_load,
    input wire [11:0] instr_in,
    output reg [11:0] instr_out
);
    always @(posedge clk or posedge reset) begin
        if (reset || flush) instr_out <= 12'b0;
        else if (ir_load) instr_out <= instr_in;
    end
endmodule
