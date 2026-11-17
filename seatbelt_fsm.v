`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 10:27:26
// Design Name: 
// Module Name: seatbelt_fsm
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



module seatbelt_fsm (

    input wire clk,

    input wire ignition,
    input wire occupancy,
    input wire buckle,
    input wire length_ok,

    output reg safe_led,
    output reg warning_led,
    output reg buzzer

);

    localparam IDLE   = 2'b00;
    localparam SAFE   = 2'b01;
    localparam UNSAFE = 2'b10;

    reg [1:0] state;

    initial state = IDLE;

    // State transition logic
    always @(posedge clk) begin

        if (!ignition || !occupancy)
            state <= IDLE;

        else if (buckle && length_ok)
            state <= SAFE;

        else
            state <= UNSAFE;

    end

    // Output logic
    always @(*) begin

        safe_led = 1'b0;
        warning_led = 1'b0;
        buzzer = 1'b0;

        case (state)

            IDLE: begin
                safe_led = 1'b0;
                warning_led = 1'b0;
                buzzer = 1'b0;
            end

            SAFE: begin
                safe_led = 1'b1;
                warning_led = 1'b0;
                buzzer = 1'b0;
            end

            UNSAFE: begin
                safe_led = 1'b0;
                warning_led = 1'b1;
                buzzer = 1'b1;
            end

            default: begin
                safe_led = 1'b0;
                warning_led = 1'b0;
                buzzer = 1'b0;
            end

        endcase

    end

endmodule
