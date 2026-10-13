`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:35:23 AM
// Design Name: 
// Module Name: topmodule
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


module cpu_top(
    input wire clk, reset
);
    wire pc_sel, flush;
    wire [3:0] pc, pc_plus_1, pc_next, jump_addr;
    wire [11:0] instr_fetched, if_id_ir;
    wire [3:0] write_back_data, qa, qb, alu_b, alu_result;
    wire alu_carry, alu_zero, flag_z, flag_c;
    wire [3:0] mem_read_data;
    wire id_is_jmp, id_is_jz, id_reg_we, id_alu_src_sel, id_mem_we, id_wb_sel;
    wire id_zero_we, id_carry_we;
    wire [2:0] id_alu_ctrl;
    wire ex_is_jmp, ex_is_jz, ex_reg_we, ex_alu_src_sel, ex_mem_we, ex_wb_sel;
    wire ex_zero_we, ex_carry_we;
    wire [2:0] ex_alu_ctrl;
    wire [3:0] ex_imm;
    wire [1:0] ex_Rd, ex_Rs;

    mux_2to1 u_pc_mux (.in0(pc_plus_1), .in1(jump_addr), .sel(pc_sel), .out(pc_next));
    program_counter u_pc (.clk(clk), .reset(reset), .pc_en(1'b1), .pc_next(pc_next), .pc(pc), .pc_plus_1(pc_plus_1));
    instruction_memory u_imem (.addr(pc), .instr(instr_fetched));
    instruction_register u_ir (.clk(clk), .reset(reset), .flush(flush), .ir_load(1'b1), .instr_in(instr_fetched), .instr_out(if_id_ir));

    instruction_decoder u_decode (
        .opcode(if_id_ir[11:8]), 
        .alu_ctrl(id_alu_ctrl), .alu_src_sel(id_alu_src_sel), .wb_sel(id_wb_sel), 
        .reg_we(id_reg_we), .mem_we(id_mem_we), 
        .zero_we(id_zero_we), .carry_we(id_carry_we), 
        .is_jmp(id_is_jmp), .is_jz(id_is_jz)
    );

    pipeline_register u_id_ex (
        .clk(clk), .reset(reset), .flush(flush),
        .in_is_jmp(id_is_jmp), .in_is_jz(id_is_jz), .in_reg_we(id_reg_we), .in_alu_src_sel(id_alu_src_sel), .in_mem_we(id_mem_we), .in_wb_sel(id_wb_sel),
        .in_zero_we(id_zero_we), .in_carry_we(id_carry_we),
        .in_alu_ctrl(id_alu_ctrl), .in_imm(if_id_ir[3:0]), .in_Rd(if_id_ir[7:6]), .in_Rs(if_id_ir[5:4]),
        
        .out_is_jmp(ex_is_jmp), .out_is_jz(ex_is_jz), .out_reg_we(ex_reg_we), .out_alu_src_sel(ex_alu_src_sel), .out_mem_we(ex_mem_we), .out_wb_sel(ex_wb_sel),
        .out_zero_we(ex_zero_we), .out_carry_we(ex_carry_we),
        .out_alu_ctrl(ex_alu_ctrl), .out_imm(ex_imm), .out_Rd(ex_Rd), .out_Rs(ex_Rs)
    );

    register_file u_rf (.clk(clk), .reg_we(ex_reg_we), .read_addr1(ex_Rd), .read_addr2(ex_Rs), .write_addr(ex_Rd), .write_data(write_back_data), .read_data1(qa), .read_data2(qb));
    mux_2to1 u_op_mux (.in0(qb), .in1(ex_imm), .sel(ex_alu_src_sel), .out(alu_b));
    
    alu_4bit u_alu (
        .a(qa), .b(alu_b), .alu_ctrl(ex_alu_ctrl), 
        .result(alu_result), .carry(alu_carry), .zero(alu_zero)
    );

    flag_register u_flags (
        .clk(clk), .reset(reset), 
        .zero_we(ex_zero_we), .carry_we(ex_carry_we),
        .in_zero(alu_zero), .in_carry(alu_carry), 
        .out_zero(flag_z), .out_carry(flag_c)
    );
    
    branch_unit u_branch (
        .is_jmp(ex_is_jmp), .is_jz(ex_is_jz), .zero_flag(flag_z),
        .pc_sel(pc_sel), .flush(flush)
    );
    
    assign jump_addr = ex_imm;

    data_memory u_dmem (.clk(clk), .mem_we(ex_mem_we), .addr(alu_result), .write_data(qa), .read_data(mem_read_data));
    mux_2to1 u_wb_mux (.in0(alu_result), .in1(mem_read_data), .sel(ex_wb_sel), .out(write_back_data));

endmodule