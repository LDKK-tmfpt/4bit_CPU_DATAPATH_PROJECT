`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 11:16:40 PM
// Design Name: 
// Module Name: alu
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


module alu_4bit(
    input  wire [3:0] a, b,
    input  wire [2:0] alu_ctrl,
    output wire [3:0] result,
    output wire       carry, zero
);
    wire [3:0] sum;
    wire c_out;
    wire do_sub = (alu_ctrl == 3'd1);
    
    adder_subtractor u_addsub (
        .a(a), .b(b), .do_sub(do_sub), .sum(sum), .carry(c_out)
    );
    
    wire [3:0] logic_out;
    logic_unit u_logic (
        .a(a), .b(b), .alu_ctrl(alu_ctrl), .logic_out(logic_out)
    );
    
    reg [3:0] res;
    always @(*) begin
        case (alu_ctrl)
            3'd0: res = sum;
            3'd1: res = sum;
            3'd2: res = logic_out;
            3'd3: res = logic_out;
            3'd4: res = logic_out;
            3'd5: res = logic_out;
            3'd6: res = b;
            default: res = 4'b0000;
        endcase
    end
    
    assign result = res;
    assign carry = c_out;
    zero_detector u_zero (.result(res), .zero(zero));
endmodule

module adder_subtractor(
    input  wire [3:0] a, b,
    input  wire       do_sub,
    output wire [3:0] sum,
    output wire       carry
);
    wire [3:0] bx;
    assign bx = b ^ {4{do_sub}};
    
    wire [4:0] temp_sum;
    assign temp_sum = a + bx + do_sub;
    assign sum = temp_sum[3:0];
    assign carry = temp_sum[4];
endmodule

module logic_unit(
    input  wire [3:0] a, b,
    input  wire [2:0] alu_ctrl,
    output reg  [3:0] logic_out
);
    always @(*) begin
        case(alu_ctrl)
            3'd2: logic_out = a & b;
            3'd3: logic_out = a | b;
            3'd4: logic_out = a ^ b;
            3'd5: logic_out = ~a;   
            default: logic_out = 4'b0000;
        endcase
    end
endmodule

module zero_detector(
    input  wire [3:0] result,
    output wire       zero
);
    assign zero = (result == 4'b0000);
endmodule