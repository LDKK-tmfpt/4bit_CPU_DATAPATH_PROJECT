`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:45:37 AM
// Design Name: 
// Module Name: flagreg
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


module flag_register(
    input wire clk, reset,
    input wire zero_we, carry_we,
    input wire in_zero, in_carry,
    output reg out_zero, out_carry
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            out_zero <= 0; 
            out_carry <= 0; 
        end else begin 
            if (zero_we) out_zero <= in_zero; 
            if (carry_we) out_carry <= in_carry; 
        end
    end
endmodule