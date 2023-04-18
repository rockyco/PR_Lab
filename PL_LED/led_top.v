`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/15 16:26:35
// Design Name: 
// Module Name: led_top
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


module led_top(
    input clk,
    input rst,
    output [3:0]led
    );

    led_static Inst_static(
        .clk(clk),
        .rst_n(~rst),
        .led(led[1:0])
    );

    led_pr Inst_pr(
        .clk(clk),
        .rst_n(~rst),
        .led(led[3:2])
    );


endmodule

module led_pr(
    input clk,
    input rst_n,
    output [1:0]led
    );
endmodule