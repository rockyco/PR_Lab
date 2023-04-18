`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/15 19:03:25
// Design Name: 
// Module Name: led_pr4
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
module led_pr4(
    input clk,
    input rst_n,
    output [1:0]led
);
reg [1:0]led_o;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        led_o <= 2'b00;
    end
    else begin
        led_o <= 2'b00;
    end
end

assign led = led_o;

endmodule