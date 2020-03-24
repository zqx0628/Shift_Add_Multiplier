`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/24 10:51:33
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb;
parameter m=8, n=8;
reg clk, rst;
reg [m-1:0] D;
reg [n-1:0] Q;
wire [m+n-1:0] out;

multiplier multiplier(clk, rst, D, Q, out);

initial 
begin
    clk = 1'b1;
    forever #5 clk = ~clk;
end
initial
begin
    rst = 0;
    D = 8'b11111111; 
    Q = 8'b11111111;
    #10;
    rst = 1;
    #100;
    rst = 0;
    D = 8'b00001111;
    Q = 8'b10000111;
    #10;
end
endmodule
