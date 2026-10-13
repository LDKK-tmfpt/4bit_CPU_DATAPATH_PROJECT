`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:47:17 AM
// Design Name: 
// Module Name: datamem
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


module data_memory(
    input wire clk, mem_we,
    input wire [3:0] addr, write_data,
    output wire [3:0] read_data
);
    reg [3:0] memory [0:15];
    assign read_data = memory[addr];
    always @(posedge clk) begin
        if (mem_we) memory[addr] <= write_data;
    end
endmodule
