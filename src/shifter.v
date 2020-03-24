`timescale 1ns / 1ps
 module shifter(
    add_out,c_out,load_cmd,add_cmd,shift_cmd,clk,rst,out_cmd,Q,A,lsb,out   
 );
 parameter m=8,n=8;
 input [m-1:0] add_out;
 input c_out,load_cmd,add_cmd,shift_cmd,clk,rst,out_cmd;
 input [n-1:0] Q;
 output [m-1:0] A;
 output lsb;
 output reg [m+n-1:0] out; 
 reg [m+n:0] temp;
 reg add_temp;
 
 assign A = temp[m+n-1:n];
 assign lsb = temp[0];
 always@(posedge clk or posedge rst)
 begin
    if (rst)
    begin
        add_temp<=0;
        temp<=0;
    end
    else
    begin
        if (load_cmd)
        begin
            temp[m+n:n]<=0;
            temp[n-1:0]<=Q;
        end
        else if (add_cmd)
            add_temp<=1;
        else if (shift_cmd && add_temp)
        begin
            temp<={1'b0, c_out, add_out, temp[n-1:1]};
            add_temp<=0;
        end
        else if (shift_cmd && !add_temp)
            temp<={1'b0, temp[m+n:1]}; 
    end
 end
 always@(out_cmd)
 begin
    if (!out_cmd)
        out<=0;
    else
        out<=temp[m+n-1:0];
 end
 endmodule