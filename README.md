# Stepper-Motor


The aim of this project is to implement a digital system using FPGA based on FSM  and standard combinational modules to drive the 55SI-25 DAWC stepper motor which is a digital electromechanical motor which works on the digital input pulses. We aim to interface this module inorder to control the speed and directon of the stepper motor using different speed inputs from the DE2 board with a direction input.

![stepper motor diagram](https://user-images.githubusercontent.com/61749380/208877811-85e20907-5434-4b10-9544-a13f2b05256f.png)



# Getting started :

Inorder to use this design : 

1- Open the project in Quartus II 

2- Open and implement the global design block-Diagram-File (BDF) and perform simulations to verify the system functionality.

3- Re-assign the pins with four GPIO pins to be connected to the stepper motor through a 74244 tri.state buffer and a ULN2803 driver.

4-Verify the different step mottor speed and direction using the DE2 board.

![stepper BDF](https://user-images.githubusercontent.com/89112499/209016717-cd0e27b0-387a-43c0-9938-75e5514ee6f0.png)

# Discussion
To operate our stepper motor, we first created a block diagram of the FSM, which consists of a priority encoder, a clock divider, and a stepper control block. The Priority encoder output is routed into a clock divider to produce eight diffrent clock signals that serves as the stepper control unit's clock which results in right speeds. This latter will accept "dirSelect" as an input and the GS of the priority encoder as a reset.
After defining the components of the FSM, we wrote a VHDL file for each of them, then we created its symbol file and combined them in BDF. After implementation, the stepper motor was able to operate in two directions with 8 diffrent speeds.








# Contributors:

-Boumerzoug Nadhir 

-Benmalek Assala

-Bayou Meroua




