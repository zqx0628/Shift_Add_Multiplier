`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/24 10:38:23
// Design Name: 
// Module Name: multiplier
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


module multiplier(clk, rst, D, Q, out);
parameter m=8, n=8;
input clk, rst;
input [m-1:0] D;
input [n-1:0] Q;
output [m+n-1:0] out;

wire c_out,load_cmd,add_cmd,shift_cmd,lsb,out_cmd;
wire [m-1:0] A,add_out;
adder adder(.D(D), .A(A), .add_out(add_out), .c_out(c_out));
shifter shifter(add_out,c_out,load_cmd,add_cmd,shift_cmd,clk,rst,out_cmd,Q,A,lsb,out);
controller controller(clk,rst,lsb,load_cmd,add_cmd,shift_cmd,out_cmd);
endmodule
