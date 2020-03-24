`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/24 09:27:24
// Design Name: 
// Module Name: controler
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


module controller(clk,rst,lsb,load_cmd,add_cmd,shift_cmd,out_cmd);
    input clk, rst,lsb;
    output load_cmd,add_cmd,shift_cmd,out_cmd;
    reg load_cmd,add_cmd,shift_cmd, out_cmd;
    reg [2:0] state;
    reg start;
    integer count;
    parameter m=8;
    parameter n=8;
    parameter idle=3'b000, init=3'b001, test=3'b010, add=3'b011, shift=3'b100;
    always@(posedge clk or posedge rst)
        if (rst)
            begin
                state<=idle;
                count<=0;
                start<=1;
                out_cmd<=0;
            end
        else 
            case (state)
                idle: begin
                    load_cmd<=0;
                    add_cmd<=0;
                    shift_cmd<=0;
                    if (start) begin
                        state<=init;
                        out_cmd<=0;
                    end
                    else begin
                        state<=idle;
                        out_cmd<=1;
                    end
                end
                init: begin
                    load_cmd<=1;
                    add_cmd<=0;
                    shift_cmd<=0;
                    out_cmd<=0;
                    state<=test;
                end
                test: begin
                    load_cmd<=0;
                    add_cmd<=0;
                    shift_cmd<=0;
                    out_cmd<=0;
                    if (lsb) begin
                        state<=add;
                        end
                    else state<=shift;
                end 
                add: begin
                    load_cmd<=0;
                    add_cmd<=1;
                    shift_cmd<=0;
                    out_cmd<=0;
                    state<=shift;
                end
                shift: begin
                    load_cmd<=0;
                    add_cmd<=0;
                    shift_cmd<=1;
                    out_cmd<=0;
                    if (count<m) begin
                        state<=test;
                        count<=count+1;
                    end
                    else begin
                        count<=0;
                        state<=idle;
                        start<=0;
                    end
                end 
            endcase                
endmodule
