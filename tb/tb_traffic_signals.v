`timescale 1ns/1ps

module tb_traffic_light;

reg clk;
reg reset;
wire [2:0] light;

traffic_light_fsm uut (
    .clk(clk),
    .reset(reset),
    .light(light)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    // Initialize
    reset = 1;
    #200;

    reset = 0;

    // Run simulation
    #300;

    $finish;
end

initial begin
    $monitor("Time=%0t | reset=%b | light=%b", $time, reset, light);
end

endmodule
