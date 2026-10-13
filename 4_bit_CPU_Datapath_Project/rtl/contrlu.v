`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:49:54 AM
// Design Name: 
// Module Name: contrlu
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


module control_unit(
    input  wire [3:0] opcode,
    input  wire       zero_flag,
    output wire [2:0] alu_ctrl,
    output wire       alu_src_sel, wb_sel, reg_we, mem_we, 
    output wire       zero_we, carry_we, is_jmp, is_jz, pc_sel, flush
);
    instruction_decoder u_decode (
        .opcode(opcode),
        .alu_ctrl(alu_ctrl), .alu_src_sel(alu_src_sel), .wb_sel(wb_sel), 
        .reg_we(reg_we), .mem_we(mem_we), .zero_we(zero_we), .carry_we(carry_we), 
        .is_jmp(is_jmp), .is_jz(is_jz)
    );
    
    branch_unit u_branch (
        .is_jmp(is_jmp), .is_jz(is_jz), .zero_flag(zero_flag),
        .pc_sel(pc_sel), .flush(flush)
    );
endmodule

module instruction_decoder(
    input  wire [3:0] opcode,
    output reg  [2:0] alu_ctrl,
    output reg        alu_src_sel, wb_sel, reg_we, mem_we, 
    output reg        zero_we, carry_we, is_jmp, is_jz
);
    always @(*) begin
        alu_ctrl = 3'd0; alu_src_sel = 0; wb_sel = 0; 
        reg_we = 0; mem_we = 0; zero_we = 0; carry_we = 0; 
        is_jmp = 0; is_jz = 0;
        
        case (opcode)
            4'b0000: begin alu_ctrl = 3'd0; reg_we = 1; zero_we = 1; carry_we = 1; end
            4'b0001: begin alu_ctrl = 3'd1; reg_we = 1; zero_we = 1; carry_we = 1; end
            4'b0010: begin alu_ctrl = 3'd2; reg_we = 1; zero_we = 1; end
            4'b0011: begin alu_ctrl = 3'd3; reg_we = 1; zero_we = 1; end
            4'b0100: begin alu_ctrl = 3'd4; reg_we = 1; zero_we = 1; end
            4'b0101: begin alu_ctrl = 3'd5; reg_we = 1; zero_we = 1; end
            4'b0110: begin alu_ctrl = 3'd6; alu_src_sel = 1; reg_we = 1; end
            4'b0111: begin alu_ctrl = 3'd6; reg_we = 1; end
            4'b1000: begin alu_ctrl = 3'd6; alu_src_sel = 1; wb_sel = 1; reg_we = 1; end
            4'b1001: begin alu_ctrl = 3'd6; alu_src_sel = 1; mem_we = 1; end 
            4'b1010: begin is_jmp = 1; end
            4'b1011: begin is_jz = 1; end
            default: ;
        endcase
    end
endmodule

module branch_unit(
    input  wire is_jmp, is_jz, zero_flag,
    output wire pc_sel, flush
);
    assign pc_sel = is_jmp | (is_jz & zero_flag);
    assign flush = pc_sel;
endmodule