`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:43:22 AM
// Design Name: 
// Module Name: counter
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


module program_counter(
    input wire clk, reset, pc_en,
    input wire [3:0] pc_next,
    output reg [3:0] pc,
    output wire [3:0] pc_plus_1
);
    always @(posedge clk or posedge reset) begin
        if (reset) pc <= 4'b0000;
        else if (pc_en) pc <= pc_next;
    end
    assign pc_plus_1 = pc + 1'b1;
endmodule