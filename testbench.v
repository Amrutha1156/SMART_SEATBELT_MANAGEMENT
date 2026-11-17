`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 10:29:02
// Design Name: 
// Module Name: testbench
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



`timescale 1ns / 1ps

module testbench;

    reg clk;

    reg SW0, SW1, SW2;
    reg SW3, SW4;

    wire LED0, LED1, Buzzer;

    // Device Under Test
    top DUT (

        .clk(clk),

        .SW0(SW0),
        .SW1(SW1),
        .SW2(SW2),
        .SW3(SW3),
        .SW4(SW4),

        .LED0(LED0),
        .LED1(LED1),
        .Buzzer(Buzzer)

    );

    // 100 MHz clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        // Initial conditions
        SW0 = 0;
        SW1 = 0;
        SW2 = 0;
        SW3 = 0;
        SW4 = 0;

        // Test 1: Ignition OFF
        #20;
        SW0 = 0;
        SW1 = 1;

        // Test 2: Person seated, buckle unlocked
        #20;
        SW0 = 1;
        SW1 = 1;
        SW2 = 0;
        SW3 = 1;
        SW4 = 1;

        // Test 3: Buckle locked, insufficient length
        #30;
        SW2 = 1;
        SW3 = 0;
        SW4 = 0;

        // Test 4: Buckle locked, length = 1
        #30;
        SW3 = 1;
        SW4 = 0;

        // Test 5: Buckle locked, length = 2
        #30;
        SW3 = 0;
        SW4 = 1;

        // Test 6: Buckle locked, length = 3
        #30;
        SW3 = 1;
        SW4 = 1;

        // Test 7: Buckle unlocked
        #30;
        SW2 = 0;

        // Test 8: Nobody seated
        #30;
        SW1 = 0;

        // Test 9: Ignition OFF
        #30;
        SW0 = 0;

        #30;
        $finish;

    end

endmodule

