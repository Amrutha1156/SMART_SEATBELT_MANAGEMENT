`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 10:26:47
// Design Name: 
// Module Name: belt_length_check
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



module belt_length_check (

    input wire [1:0] belt_length,
    output wire length_ok

);

    parameter [1:0] THRESHOLD = 2'd2;

    assign length_ok = (belt_length >= THRESHOLD);

endmodule
