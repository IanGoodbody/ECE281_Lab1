ECE281_Lab1
===========

Two's compliment circuit design lab

### Pre-lab

The goal of the prelab was to design, simulate, and test a basic three-bit two's complement converter. The 
values were created from the following truth table with A, B, and C as inputs and X, Y, and Z as outputs with
A and X as the most significant bits for each number. (Lab Notebook 6)

| A | B | C | X | Y | Z |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 1 | 1 | 0 |
| 0 | 1 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 | 0 |
| 1 | 0 | 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 | 0 | 1 |
    
Karnaugh maps yielded the following canonical equations for each of the outputs (LN 7)

    X = A'B + A'C + AB'C'
    Y = BC' + B'C
    Z = C
    
Which then translated to the following schematic (LN 7):

![alt text](https://raw2.github.com/IanGoodbody/ECE281_Lab1/master/Project_Images/CanonicalDesign.jpg "Canonical Schematic")


Given the complexity of the canonical schematic, the equations were simplified to more usable XOR gate models (LN 6):

    X = A xor (B + C)
    Y = B xor C
    Z = C
    
Which then produced the far more usable schematic (LN 7): 

![alt text](https://raw2.github.com/IanGoodbody/ECE281_Lab1/master/Project_Images/SimplifiedDesign.jpg "Simplified Schematic")

The simplified circuit was then abstracted as a VHDL file (Lab1_Goodbody.vhd, LN 8) and simulated with a VHDL testbench
file (Lab1_ testbench_Goodbody, LN 9) theXilinx ISE Project DesignSuite 14.1 and gave the following output, with signals
arragned A, B, C, X, Y, Z from top tobottom in asequence corresponding with the truth table above:

![alt text](https://raw2.github.com/IanGoodbody/ECE281_Lab1/master/Project_Images/ElementSignal.JPG "Component Signals")

Ultimately the Input and Output values produced by the simulation matched those of the truth table above validating the
digital circuit design. The cursor on the signal output was used to read the different signal values to gather the
readings referenced above. As shown in the diagram, the input signal 010 under the yellow cursor corresponded with the
output signal 110 in accordance with the third line of the truth table.


### Main Lab

#### 3-bit Implementation

After the signal simulation validated the design, a constraints file (Lab_ 01_IRG.ucf, LN 12) was created setting the
lest significant bit as the leftmost input switch and left most output LED on the NEXYS 2 FPGA. The program was then
downloaded to the FPGA and an exhaustive test of the truth table above was performed to insure proper performance. 
Overall the 3-bitimplementation of the two's complement machine performed satisfactorily.

#### 8-bit Full Function Implementation

To create the fully functional 8-bit two's complement machine seperate VHDL file (Lab1_ FullFunction_ Goodbody.vhd, LN
13), testbench (Lab1_ TestBench_ FullFunction.vhd, LN 14), and constraints files (Lab1_ FF_ IRG.ucf) were
created based on those used for the 3-bit model. The behavioral VHDL file was modified to implement vectors and
arithmetic to simplify the code with the main architecture function:

    X = (not A) + 1
    
Where X is the output vector and A the input vector. This equation corresponds with the classical method of forming a
two's complement number by inverting all the numbers in the bit, adding 1, then disregarding the carry bit. The 
alternative would have involved redesign the logic circuit model above, which, although it allows for a degree of 
recursive design, the design would involve a linearly increasing level of complexity. For example,
considering A(0) and X(0) as the least significant input and output bit the straight VHDL logic syntax would have
expanded as follows:

    X(0) <= A(0)
    X(1) <= A(1) xor A(0)
    X(2) <= A(2) xor (A(1) or A(0))
    X(3) <= A(3) xor (A(2) or A(1) or A(0))
    ....
    
A testbench file was created from the behavioral VHDL code. Rather than exhaustively check every value, the testbench
only spot-tested the following 5 values in the truth table below (LN 18).

| A | X |
|:-:|:-:|
|0000 0000|0000 0000|
|0000 0001|1111 1111|
|1011 0101|0100 1011|
|1000 0000|1000 0000|
|1111 1111|0000 0001|

![alt text](https://raw2.github.com/IanGoodbody/ECE281_Lab1/master/Project_Images/8BitSignal.JPG "8-bit Signal")

Having passed the testbench, the design, along with a new constraints file adjusting the inputs and outputs for 8-bit
vectors, was pushed to the FPGA and again spot-checked. The two's complement machine passed the spot checking and
represented a fully functional two's complement machine.

Documentation: C2C Ryan Good helped me find with librarys were necessary to do arithmatic with IEEE_ STD_Vectors. 
He also critiqued my indexing syntax in the 8-bit testbench.
