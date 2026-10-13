`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:38:31 AM
// Design Name: 
// Module Name: regis
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


module register_file(
    input wire clk, reg_we,
    input wire [1:0] read_addr1, read_addr2, write_addr,
    input wire [3:0] write_data,
    output wire [3:0] read_data1, read_data2
);
    reg [3:0] registers [0:3];
    assign read_data1 = registers[read_addr1];
    assign read_data2 = registers[read_addr2];
    always @(posedge clk) begin
        if (reg_we) registers[write_addr] <= write_data;
    end
endmodule
