`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 10:13:51
// Design Name: 
// Module Name: top
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





module top (

    input wire clk,

    // FPGA switches
    input wire SW0,       // Ignition
    input wire SW1,       // Occupancy
    input wire SW2,       // Buckle
    input wire SW3,       // Length bit 0
    input wire SW4,       // Length bit 1

    // FPGA outputs
    output wire LED0,     // Green LED - Safe
    output wire LED1,     // Red LED - Unsafe
    output wire Buzzer    // Audible warning

);

    wire [1:0] belt_length;
    wire length_ok;

    // Combine the two length switches
    assign belt_length = {SW4, SW3};

    // Belt length checking module
    belt_length_check COMP (

        .belt_length(belt_length),
        .length_ok(length_ok)

    );

    // Seatbelt safety controller
    seatbelt_fsm FSM (

        .clk(clk),

        .ignition(SW0),
        .occupancy(SW1),
        .buckle(SW2),
        .length_ok(length_ok),

        .safe_led(LED0),
        .warning_led(LED1),
        .buzzer(Buzzer)

    );

endmodule
