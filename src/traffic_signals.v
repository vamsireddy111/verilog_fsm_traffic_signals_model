`timescale 1ns/1ps

module traffic_light_fsm (
    input clk,
    input reset,
    output reg [2:0] light
);

parameter RED=2'b00, GREEN=2'b01, YELLOW=2'b10;

reg [1:0] state, next_state;
reg [3:0] count;

always @(posedge clk) begin
    if (reset)
        state <= RED;
    else
        state <= next_state;
end

always @(posedge clk) begin
    if (reset)
        count <= 0;
    else if (state != next_state)
        count <= 0;
    else
        count <= count + 1;
end

always @(*) begin
    case(state)
        RED:    next_state = (count == 10) ? GREEN  : RED;
        GREEN:  next_state = (count == 10) ? YELLOW : GREEN;
        YELLOW: next_state = (count == 3)  ? RED    : YELLOW;
        default: next_state = RED;
    endcase
end

always @(*) begin
    case(state)
        RED:    light = 3'b100;
        GREEN:  light = 3'b001;
        YELLOW: light = 3'b010;
        default: light = 3'b000;
    endcase
end

endmodule
