# EE205 Signal and System LAB

## IMPORTANT

**The files in this project should follow the following instructions.**

### The name of the file

1. We will create a `LABx` folder for each LAB Session.
2. Files need to be named as `Problem_subquestion_others.m`, like `P1_5_a1.m`, except the name of functions, and set the name of the photos with `filename_photoname_out/photoindex.png` like `P_1_5_a1_out1.png`

### The part contained in the code

1. **The code implementation of the problem**
2. **Plot**: We need to add all the setings to the plot in the code so that we do not need to adjust the polt if we replot it.
3. **Save**: the plots by function `saveas(gcf, "plots/P1_4_f_out2.png");`, here we are running the program in root dictionary. After save the image, you can use `close` to close the windows
4. For convinence, each signal `x` should have a relative position notation `nx`, which can be used in plots.

### Basci instructions about plots

1. `title('text')` for the title of the plots
2. 


### Issues

Any problem encontered in the LAB should be pasted to the issues page.

### About the lab report

#### Format

1. The introduction section should include what you will do in this LAB
2. You can copy from the introduction of the problem
3. *Argument* and *Analysis* should be included in the LAB report
4. **All MATLAB codes** should be included at the end of the file.

#### Content

In a single LAB we should perform following steps:

1. Construct (a) signal(s)
2. Emulate
3. Compare

All the steps should be implicted in the report

#### Experience


## Introduction

Here is the lab session of course **Signal and System** *(EE205)* in *Southern University of Science and Technology* (Shenzhen). In the lab session, we will use MATLAB to explore the properties of different signals.


### Team members

- YUAN Tong (Student ID: 11810818)
- DAI Yujin (Student ID: 11910114)

## Lab 1: MATLAB Programming

**NOTICE: LAB1 should be submitted before 11th March**

In lab 1

#### Proofing of  linear system

We use unit pulse $\delta [n]$ as the test input, the system should satisfy:

1. 齐次性
2. 叠加性

#### Proofing of casualty

The out won''t depended on the input from future, to proof this we need to:

1. construct a step signal

#### Proofing the stability

输入有界，输出有界

when n=0 y=-Inf, the system is not stable.

#### Proofing inveribility

1 y only have one x to obtain it.

## Lab 2: Linear Time-Invariant Systems

## Lab 3: Fourier Series Representation of Periodic Signals

## Lab 4: The Continuous-Time Fourier Transform

## Lab 5: System, Transform, Convolution and Filter

And also there will we two projects to help studets apply all the technocs learned. The two projects will be held in another respositories

- Project 1. Speech synthesis and perception with envelope cue
- Project 2: OFDM Technology
