ECE281_Lab1
===========

Two's compliment circuit design lab

### Pre-lab

The goal of the prelab was to design, simulate, and test a basic three-bit two's compliment converter. The 
values were created from the following truth table with A, B, and C as inputs and X, Y, and Z as outputs with
A and X as the most significant bits for each number.

| A | B | C || X | Y | Z |
|:-:|:-:|:-:||:-:|:-:|:-:|
| 0 | 0 | 0 || 0 | 0 | 0 |
| 0 | 0 | 1 || 1 | 1 | 1 |
| 0 | 1 | 0 || 1 | 1 | 0 |
| 0 | 1 | 1 || 1 | 0 | 1 |
| 1 | 0 | 0 || 1 | 0 | 0 |
| 1 | 0 | 1 || 0 | 1 | 1 |
| 1 | 1 | 0 || 0 | 1 | 0 |
| 1 | 1 | 1 || 0 | 0 | 1 |
    
Karnaugh maps yeielded the follwoing canonical equations for each of the outputs

    X = A'B + A'C + AB'C'
    Y = BC' + B'C
    Z = C
    
Which then translated to the following schematic:

![alt text](https://raw2.github.com/IanGoodbody/ECE281_Lab1/master/Project_Images/CanonicalDesign.jpg "Canonical Schematic")


Given the complexity of the canonical schematic, the equations were simplified to more usable XOR gate models:

    X = A &oplus (B + C)
    Y = B &oplus C
    Z = C
    
Which then produced the far more usable schematic: 

![alt text](https://raw2.github.com/IanGoodbody/ECE281_Lab1/master/Project_Images/SimplifiedDesign.jpg "Simplified Schematic")

The simplified circuit was then abstracted as a VHDL file and simulated with the Xilinx ISE Project Design
Suite 14.1 and gave the following output, with signals arragned A, B, C, X, Y, Z from top to bottom in a
sequence corresponding with the truth table above:

![alt text](https://raw2.github.com/IanGoodbody/ECE281_Lab1/master/Project_Images/ElementSignal.JPG "Component Signals")

Ultimately the Input and Output values produced by the simulation matched those of the truth table validating the
digital circuit design. It is worth noting that the signal and truth table input and output signals mirror one
another as one would expect for two's compliment numbers. The binary inputs run from 0 to 3 while the outputs
correspondingly decrease from 0 to -3, the binary value for wierd numbers 0 and -4 are their own two's compliments,
and the last three values of the table cycle from -3 to -1 for the input and from 3 to 1 for the outoput.
