`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 03:00:31 PM
// Design Name: 
// Module Name: datapath_fourbit_tb
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


module tb_cpu();
    reg clk;
    reg reset;
    
    integer cycle_count = 0;

    cpu_top uut (
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; 
        reset = 1;
        cycle_count = 0;
        
        uut.u_imem.mem[0] = 12'h645;
        uut.u_imem.mem[1] = 12'h683;
        uut.u_imem.mem[2] = 12'h060;
        uut.u_imem.mem[3] = 12'h160;
        uut.u_imem.mem[4] = 12'h260;
        uut.u_imem.mem[5] = 12'h360;
        uut.u_imem.mem[6] = 12'h460;
        uut.u_imem.mem[7] = 12'h540;    
        uut.u_imem.mem[8] = 12'hC00;
        uut.u_imem.mem[9] = 12'hC00;
        
        #15 reset = 0;
        
        #120; 
        
        $display("=========================================================================================");
        $display(">>>                              SIMULATION COMPLETED                                 <<<");
        $display("=========================================================================================");
        $finish;
    end

    initial begin
        #15; 
        $display("=========================================================================================");
        $display(" Cycle | PC | Instr Fetch | ALU_Out | WB_Data | R1 | R2 | R3 | Zero | Carry | Flush |");
        $display("=========================================================================================");
    end

    always @(negedge clk) begin
        if (!reset) begin
            cycle_count = cycle_count + 1;
            $display("   %2d  | %2d |   %3h    |   %2d   |   %2d    | %2d | %2d | %2d |  %b   |   %b   |   %b   |",
                cycle_count,
                uut.pc,
                uut.instr_fetched,
                uut.alu_result,
                uut.write_back_data,
                uut.u_rf.registers[1],
                uut.u_rf.registers[2],
                uut.u_rf.registers[3],
                uut.flag_z,
                uut.flag_c,
                uut.flush
            );
        end
    end

endmodule