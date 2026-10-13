`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:47:54 AM
// Design Name: 
// Module Name: pipereg
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


module pipeline_register(
    input wire clk, reset, flush,
    input wire in_is_jmp, in_is_jz, in_reg_we, in_alu_src_sel, in_mem_we, in_wb_sel,
    input wire in_zero_we, in_carry_we,
    input wire [2:0] in_alu_ctrl,
    input wire [3:0] in_imm,
    input wire [1:0] in_Rd, in_Rs,
    output reg out_is_jmp, out_is_jz, out_reg_we, out_alu_src_sel, out_mem_we, out_wb_sel,
    output reg out_zero_we, out_carry_we,
    output reg [2:0] out_alu_ctrl,
    output reg [3:0] out_imm,
    output reg [1:0] out_Rd, out_Rs
);
    always @(posedge clk or posedge reset) begin
        if (reset || flush) begin
            out_is_jmp<=0; out_is_jz<=0; out_reg_we<=0; out_alu_src_sel<=0; out_mem_we<=0; out_wb_sel<=0;
            out_zero_we<=0; out_carry_we<=0;
            out_alu_ctrl<=0; out_imm<=0; out_Rd<=0; out_Rs<=0;
        end else begin
            out_is_jmp<=in_is_jmp; out_is_jz<=in_is_jz; out_reg_we<=in_reg_we; out_alu_src_sel<=in_alu_src_sel; 
            out_mem_we<=in_mem_we; out_wb_sel<=in_wb_sel; 
            out_zero_we<=in_zero_we; out_carry_we<=in_carry_we;
            out_alu_ctrl<=in_alu_ctrl; 
            out_imm<=in_imm; out_Rd<=in_Rd; out_Rs<=in_Rs;
        end
    end
endmodule