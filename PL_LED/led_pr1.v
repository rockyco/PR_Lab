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
module led_pr1(
    input clk,
    input rst_n,
    output [1:0]led
);
reg [1:0]led_o;
reg [31:0]cnt;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        cnt <= 32'd0;
    end
    else if(cnt == 32'd400_000_000)begin
        cnt <= 32'd0;
    end
    else begin
        cnt <= cnt + 32'd1;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        led_o <= 2'b00;
    end
    else if(cnt == 32'd200_000_000)begin
        led_o <= 2'b01;
    end
    else if(cnt == 32'd400_000_000)begin
        led_o <= 2'b10;
    end
    else begin
        led_o <= led_o;
    end
end

assign led = led_o;

endmodule