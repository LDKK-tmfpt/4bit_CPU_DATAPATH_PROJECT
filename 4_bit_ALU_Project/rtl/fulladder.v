`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 01:12:22 PM
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input  wire a, 
    input  wire b, 
    input  wire cin,
    output wire sum, 
    output wire cout
);
    wire w_xor1; 
    wire w_and1; 
    wire w_and2;
   
    xor gate_xor1 (w_xor1, a, b);
    xor gate_xor2 (sum, w_xor1, cin);
    and gate_and1 (w_and1, a, b);
    and gate_and2 (w_and2, w_xor1, cin);
    or  gate_or1  (cout, w_and1, w_and2);

endmodule
