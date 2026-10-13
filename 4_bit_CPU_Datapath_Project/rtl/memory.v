`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:44:08 AM
// Design Name: 
// Module Name: memory
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


module instruction_memory(
    input wire [3:0] addr,
    output wire [11:0] instr
);
    reg [11:0] mem [0:15];
    initial begin
        mem[0] = 12'b0000_00_00_0000;
    end
    assign instr = mem[addr];
endmodule