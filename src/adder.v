`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/24 09:28:07
// Design Name: 
// Module Name: adder
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


module adder(
    D,A,add_out,c_out
    );
    parameter m=8,n=8;
    input [m-1:0] D,A;
    output [m-1:0] add_out;
    output c_out;
    wire [m:0] add_result, data1, data2;
    assign data1 = {1'b0,D};
    assign data2 = {1'b0,A};
    assign add_result = data1+data2;
    assign add_out = add_result[m-1:0];
    assign c_out = add_result[m];
endmodule
