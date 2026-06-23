# Traffic Light Controller using Verilog (FSM-Based)

# Overview

This project implements a Traffic Light Controller using a Finite State Machine (FSM) in Verilog HDL.
It simulates the working of a real-world traffic signal by cycling through RED → GREEN → YELLOW states with proper timing control.

This project is designed as a beginner-friendly RTL design to understand core digital design concepts like:

FSM (Finite State Machine)
Registers and Counters
Sequential vs Combinational Logic
Timing using clock cycles

# Design Concept

The traffic light operates based on an FSM with three states:

State	Description	     Output (light)
RED	     Stop	            3'b100
GREEN	    Go	            3'b001
YELLOW	Transition 
         / Caution	      3'b010

State Transitions
RED → GREEN → YELLOW → RED → ...

Each state is maintained for a specific number of clock cycles using a counter.

## Architecture

The design follows a standard FSM structure:

# State Register
Stores current state
Updates on clock edge
# Next-State Logic
Determines next state based on current state and counter
# Counter
Controls duration of each state
# Output Logic
Generates light signals based on current state

# Verilog Implementation
🔹 Inputs
clk → Clock signal
reset → Reset signal
🔹 Outputs
light[2:0] → Traffic light signals
light[2] → RED
light[1] → YELLOW
light[0] → GREEN

# Timing Behavior
RED state lasts 10 clock cycles
GREEN state lasts 10 clock cycles
YELLOW state lasts 3 clock cycles

# Tools Used
EDA Playground , Xilinx Vivado
