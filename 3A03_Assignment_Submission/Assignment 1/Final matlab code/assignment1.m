clc;
clear;

%% System1 Causality Tests

%Test Case 1
%sets up the discrete steps (n) and the inputs (x)
n1 = 0:6;
x1 = [0,1,2,3,2,1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n1,x1)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y1 = system1(n1,x1);

%Plots the output values
figure
stem(n1,y1)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%Test Case 2
%sets up the discrete steps (n) and the inputs (x)
n2 = -5:5;
x2 = [0,4,-1,-3,-5,-2,3,1,1,1,2];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n2,x2)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y2 = system1(n2,x2);

%Plots the output values
figure
stem(n2,y2)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%Test Case 3
%sets up the discrete steps (n) and the inputs (x)
n3 = -6:6;
x3 = [0, 0, 0, 0, 0, 0, 2, 1, 3, 2, 2, 2, 2];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n3,x3)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y3 = system1(n3,x3);

%Plots the output values
figure
stem(n3,y3)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%% System1 Memeroryless Tests

%Base Case: compare test cases to this
%sets up the discrete steps (n) and the inputs (x)
n1 = -5:5;
x1 = [0,0,3,4,2,1,-2,-5,-4,-1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n1,x1)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y1 = system1(n1,x1);

%Plots the output values
figure
stem(n1,y1)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%Test Case 1
%In this test case, we change the fourth number

%sets up the discrete steps (n) and the inputs (x)
n2 = -5:5;
x2 = [0,0,3,-2,2,1,-2,-5,-4,-1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n2,x2)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y2 = system1(n2,x2);

%Plots the output values
figure
stem(n2,y2)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%Test Case 2
%In this second test case, we change the second last number
%sets up the discrete steps (n) and the inputs (x)
n3 = -5:5;
x3 = [0,0,3,-2,2,1,-2,-5,-4,5,0];


%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n3,x3)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')


%inputs the inputs(x) into the system and assign it to output(y)
y3 = system1(n3,x3);

%Plots the output values
figure
stem(n3,y3)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%% System1 Linearity Tests
% Base variables to check linearity, scaling factors determined randomly
halfSize = 10; % determines half the size of input functions
n = -1*halfSize:halfSize; % time steps between n = -halfSize and halfSize
positiveScalingFactor = 41;
negativeScalingFactor = -12;

% Functions used to test linearity (different x[n]'s)
impulseFunction = zeros(1,halfSize*2+1); % impulse is 0 for all except n = 0
impulseFunction(halfSize+1) = 1; % time step where n = 0

unitStepFunction = n >= 0;

unitRampFunction = (n >= 0).*n;

sinusoidalFunction = sin(pi/4*n);

% Scaling Testing
plotScaling(positiveScalingFactor, negativeScalingFactor, impulseFunction, n, @system1, "Impulse Function", 1, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, unitStepFunction, n, @system1, "Unit Step Function", 1, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, unitRampFunction, n, @system1, "Unit Ramp Function", 1,@stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, sinusoidalFunction, n, @system1, "Sinusoidal Function", 1, @stem);

% Additivity Testing
plotAdditivity(impulseFunction, unitStepFunction, n, @system1, "Impulse Function", "Unit Step Function", 1, @stem);
plotAdditivity(unitRampFunction, sinusoidalFunction, n, @system1, "Unit Ramp Function", "Sinusoidal Function", 1, @stem);

%% System1 time Invariance Tests
n = -5:5;  % range of discrete samples

% Input centred at n=0 (5 nonzeroes: 3 positive, 2 negative)
x = [0 0 0 -2 2 1 3 -3 0 0 0];      % Input Signal #1: x[n]

% Shifted inputs based on input signal #1 to test for time invariance
% Naming convention is "x" + right/left shift + shift amount
x_R_1 = [0 0 0 0 -2 2 1 3 -3 0 0];  % Input Signal #2: x[n-1]
x_R_2 = [0 0 0 0 0 -2 2 1 3 -3 0];  % Input Signal #3: x[n-2]
x_R_3 = [0 0 0 0 0 0 -2 2 1 3 -3];  % Input Signal #4: x[n-3]
x_L_1 = [0 0 -2 2 1 3 -3 0 0 0 0];  % Input Signal #5: x[n+1]
x_L_2 = [0 -2 2 1 3 -3 0 0 0 0 0];  % Input Signal #6: x[n+2]
x_L_3 = [-2 2 1 3 -3 0 0 0 0 0 0];  % Input Signal #7: x[n+3]

y1 = system1(n,x);           % Output Signal #1: y1[x[n]]
y1_R_1 = system1(n,x_R_1);   % Output Signal #2: y1[x[n-1]]
y1_R_2 = system1(n,x_R_2);   % Output Signal #3: y1[x[n-2]]
y1_R_3 = system1(n,x_R_3);   % Output Signal #4: y1[x[n-3]]
y1_L_1 = system1(n,x_L_1);   % Output Signal #5: y1[x[n+1]]
y1_L_2 = system1(n,x_L_2);   % Output Signal #6: y1[x[n+2]]
y1_L_3 = system1(n,x_L_3);   % Output Signal #7: y1[x[n+3]]

% Generating a figure with 2 stemplots (left: input #1; right: output #1)
figure
subplot(1,2,1), stem(n, x), title('Input Signal #1 for System 1'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y1), title('Output Signal #1 for System 1'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #2; right: output #2)
figure
subplot(1,2,1), stem(n, x_R_1), title('Input Signal #2 for System 1'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y1_R_1), title('Output Signal #2 for System 1'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #3; right: output #3)
figure
subplot(1,2,1), stem(n, x_R_2), title('Input Signal #3 for System 1'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y1_R_2), title('Output Signal #3 for System 1'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #4; right: output #4)
figure
subplot(1,2,1), stem(n, x_R_3), title('Input Signal #4 for System 1'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y1_R_3), title('Output Signal #4 for System 1'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #5; right: output #5)
figure
subplot(1,2,1), stem(n, x_L_1), title('Input Signal #5 for System 1'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y1_L_1), title('Output Signal #5 for System 1'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #6; right: output #6)
figure
subplot(1,2,1), stem(n, x_L_2), title('Input Signal #6 for System 1'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y1_L_2), title('Output Signal #6 for System 1'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #7; right: output #7)
figure
subplot(1,2,1), stem(n, x_L_3), title('Input Signal #7 for System 1'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y1_L_3), title('Output Signal #7 for System 1'), xlabel('n'), ylabel('y[n]')

%% System2 Causality Tests
%Test Case 1
%sets up the discrete steps (n) and the inputs (x)
n1 = 0:6;
x1 = [0,1,2,3,2,1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n1,x1)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y1 = system2(n1,x1);

%Plots the output values
figure
stem(n1,y1)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%Test Case 2
%sets up the discrete steps (n) and the inputs (x)
n2 = -5:5;
x2 = [0,4,-1,-3,-5,-2,3,1,1,1,2];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n2,x2)
title('Input x2[n]')
xlabel('index n')
ylabel('x1[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y2 = system2(n2,x2);

%Plots the output values
figure
stem(n2,y2)
title('Output y2[n]')
xlabel('index n')
ylabel('y2[n]')

%Test Case 3
%sets up the discrete steps (n) and the inputs (x)
n3 = -6:6;
x3 = [0, 0, 0, 0, 0, 0, 2, 1, 3, 2, 2, 2, 2];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n3,x3)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y3 = system2(n3,x3);

%Plots the output values
figure
stem(n3,y3)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%% System2 Memoryless Tests
%Test case 1
%sets up the discrete steps (n) and the inputs (x)
n1 = -5:5;
x1 = [0,0,3,4,2,1,-2,-5,-4,-1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n1,x1)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y1 = system2(n1,x1);

%Plots the output values
figure
stem(n1,y1)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%test case 2
%In this test case, we change the fourth number

%sets up the discrete steps (n) and the inputs (x)
n2 = -5:5;
x2 = [0,0,3,-2,2,1,-2,-5,-4,-1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n2,x2)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y2 = system2(n2,x2);

%Plots the output values
figure
stem(n2,y2)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%test case 3
%In this second test case, we change the second last number

%sets up the discrete steps (n) and the inputs (x)
n3 = -5:5;
x3 = [0,0,3,-2,2,1,-2,-5,-4,5,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n3,x3)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y3 = system2(n3,x3);

%Plots the output values
figure
stem(n3,y3)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%% System2 Linearity Tests
% Base variables to check linearity, scaling factors determined randomly
halfSize = 10; % determines half the size of input functions
n = -1*halfSize:halfSize; % time steps between n = -halfSize and halfSize
positiveScalingFactor = 41;
negativeScalingFactor = -12;

% Functions used to test linearity (different x[n]'s)
impulseFunction = zeros(1,halfSize*2+1); % impulse is 0 for all except n = 0
impulseFunction(halfSize+1) = 1; % time step where n = 0

unitStepFunction = n >= 0;

unitRampFunction = (n >= 0).*n;

sinusoidalFunction = sin(pi/4*n);

% Scaling Testing
plotScaling(positiveScalingFactor, negativeScalingFactor, impulseFunction, n, @system2, "Impulse Function", 2, @stem);

%% System2 Time Invariance Tests
n = -5:5;  % range of discrete samples

% Input centred at n=0 (5 nonzeroes: 3 positive, 2 negative)
x = [0 0 0 -2 2 1 3 -3 0 0 0];      % Input Signal #1: x[n]

% Shifted inputs based on input signal #1 to test for time invariance
% Naming convention is "x" + right/left shift + shift amount
x_R_1 = [0 0 0 0 -2 2 1 3 -3 0 0];  % Input Signal #2: x[n-1]
x_R_2 = [0 0 0 0 0 -2 2 1 3 -3 0];  % Input Signal #3: x[n-2]
x_R_3 = [0 0 0 0 0 0 -2 2 1 3 -3];  % Input Signal #4: x[n-3]
x_L_1 = [0 0 -2 2 1 3 -3 0 0 0 0];  % Input Signal #5: x[n+1]
x_L_2 = [0 -2 2 1 3 -3 0 0 0 0 0];  % Input Signal #6: x[n+2]
x_L_3 = [-2 2 1 3 -3 0 0 0 0 0 0];  % Input Signal #7: x[n+3]

y2 = system2(n,x);           % Output Signal #1: y2[x[n]]
y2_R_1 = system2(n,x_R_1);   % Output Signal #2: y2[x[n-1]]
y2_R_2 = system2(n,x_R_2);   % Output Signal #3: y2[x[n-2]]
y2_R_3 = system2(n,x_R_3);   % Output Signal #4: y2[x[n-3]]
y2_L_1 = system2(n,x_L_1);   % Output Signal #5: y2[x[n+1]]
y2_L_2 = system2(n,x_L_2);   % Output Signal #6: y2[x[n+2]]
y2_L_3 = system2(n,x_L_3);   % Output Signal #7: y2[x[n+3]]

% Generating a figure with 2 stemplots (left: input #1; right: output #1)
figure
subplot(1,2,1), stem(n, x), title('Input Signal #1 for System 2'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y2), title('Output Signal #1 for System 2'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #2; right: output #2)
figure
subplot(1,2,1), stem(n, x_R_1), title('Input Signal #2 for System 2'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y2_R_1), title('Output Signal #2 for System 2'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #3; right: output #3)
figure
subplot(1,2,1), stem(n, x_R_2), title('Input Signal #3 for System 2'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y2_R_2), title('Output Signal #3 for System 2'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #4; right: output #4)
figure
subplot(1,2,1), stem(n, x_R_3), title('Input Signal #4 for System 2'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y2_R_3), title('Output Signal #4 for System 2'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #5; right: output #5)
figure
subplot(1,2,1), stem(n, x_L_1), title('Input Signal #5 for System 2'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y2_L_1), title('Output Signal #5 for System 2'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #6; right: output #6)
figure
subplot(1,2,1), stem(n, x_L_2), title('Input Signal #6 for System 2'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y2_L_2), title('Output Signal #6 for System 2'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #7; right: output #7)
figure
subplot(1,2,1), stem(n, x_L_3), title('Input Signal #7 for System 2'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y2_L_3), title('Output Signal #7 for System 2'), xlabel('n'), ylabel('y[n]')

%% System3 Causality Test
%Test Case 1
%sets up the discrete steps (n) and the inputs (x)
n1 = 0:6;
x1 = [0,1,2,3,2,1,0];
 
%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n1,x1)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')
 
%inputs the inputs(x) into the system and assign it to output(y)
y1 = system3(n1,x1);
 
%Plots the output values
figure
stem(n1,y1)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%Test Case 2
%sets up the discrete steps (n) and the inputs (x)
n2 = -5:5;
x2 = [0,4,-1,-3,-5,-2,3,1,1,1,2];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n2,x2)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y2 = system3(n2,x2);

%Plots the output values
figure
stem(n2,y2)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%Test Case 3
%sets up the discrete steps (n) and the inputs (x)
n3 = -6:6;
x3 = [0, 0, 0, 0, 0, 0, 2, 1, 3, 2, 2, 2, 2];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n3,x3)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y3 = system3(n3,x3);

%Plots the output values
figure
stem(n3,y3)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%% System3 Memoryless testing
%Test case 1
%sets up the discrete steps (n) and the inputs (x)
n1 = -5:5;
x1 = [0,0,3,4,2,1,-2,-5,-4,-1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n1,x1)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y1 = system3(n1,x1);

%Plots the output values
figure
stem(n1,y1)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%test case 2
%In this test case, we change the fourth number

%sets up the discrete steps (n) and the inputs (x)
n2 = -5:5;
x2 = [0,0,3,-2,2,1,-2,-5,-4,-1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n2,x2)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y2 = system3(n2,x2);

%Plots the output values
figure
stem(n2,y2)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%test case 3
%In this second test case, we change the second last number

%sets up the discrete steps (n) and the inputs (x)
n3 = -5:5;
x3 = [0,0,3,-2,2,1,-2,-5,-4,5,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n3,x3)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y3 = system3(n3,x3);

%Plots the output values
figure
stem(n3,y3)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%% System3 Linearity Testing
% Base variables to check linearity, scaling factors determined randomly
halfSize = 10; % determines half the size of input functions
n = -1*halfSize:halfSize; % time steps between n = -halfSize and halfSize
positiveScalingFactor = 41;
negativeScalingFactor = -12;

% Functions used to test linearity (different x[n]'s)
impulseFunction = zeros(1,halfSize*2+1); % impulse is 0 for all except n = 0
impulseFunction(halfSize+1) = 1; % time step where n = 0

unitStepFunction = n >= 0;

unitRampFunction = (n >= 0).*n;

sinusoidalFunction = sin(pi/4*n);

% Scaling Testing
plotScaling(positiveScalingFactor, negativeScalingFactor, impulseFunction, n, @system3, "Impulse Function", 3, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, unitStepFunction, n, @system3, "Unit Step Function", 3, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, unitRampFunction, n, @system3, "Unit Ramp Function", 3, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, sinusoidalFunction, n, @system3, "Sinusoidal Function", 3, @stem);

% Additivity Testing
plotAdditivity(impulseFunction, unitStepFunction, n, @system3, "Impulse Function", "Unit Step Function", 3,@stem);
plotAdditivity(unitRampFunction, sinusoidalFunction, n, @system3, "Unit Ramp Function", "Sinusoidal Function", 3, @stem);

%% System3 Time Invariance Testing
n = -5:5;  % range of discrete samples

% Input centred at n=0 (5 nonzeroes: 3 positive, 2 negative)
x = [0 0 0 -2 2 1 3 -3 0 0 0];      % Input Signal #1: x[n]

% Shifted inputs based on input signal #1 to test for time invariance
% Naming convention is "x" + right/left shift + shift amount
x_R_1 = [0 0 0 0 -2 2 1 3 -3 0 0];  % Input Signal #2: x[n-1]
x_R_2 = [0 0 0 0 0 -2 2 1 3 -3 0];  % Input Signal #3: x[n-2]
x_R_3 = [0 0 0 0 0 0 -2 2 1 3 -3];  % Input Signal #4: x[n-3]
x_L_1 = [0 0 -2 2 1 3 -3 0 0 0 0];  % Input Signal #5: x[n+1]
x_L_2 = [0 -2 2 1 3 -3 0 0 0 0 0];  % Input Signal #6: x[n+2]
x_L_3 = [-2 2 1 3 -3 0 0 0 0 0 0];  % Input Signal #7: x[n+3]

y3 = system3(n,x);           % Output Signal #1: y3[x[n]]
y3_R_1 = system3(n,x_R_1);   % Output Signal #2: y3[x[n-1]]
y3_R_2 = system3(n,x_R_2);   % Output Signal #3: y3[x[n-2]]
y3_R_3 = system3(n,x_R_3);   % Output Signal #4: y3[x[n-3]]
y3_L_1 = system3(n,x_L_1);   % Output Signal #5: y3[x[n+1]]
y3_L_2 = system3(n,x_L_2);   % Output Signal #6: y3[x[n+2]]
y3_L_3 = system3(n,x_L_3);   % Output Signal #7: y3[x[n+3]]

% Generating a figure with 2 stemplots (left: input #1; right: output #1)
figure
subplot(1,2,1), stem(n, x), title('Input Signal #1 for System 3'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y3), title('Output Signal #1 for System 3'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #2; right: output #2)
figure
subplot(1,2,1), stem(n, x_R_1), title('Input Signal #2 for System 3'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y3_R_1), title('Output Signal #2 for System 3'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #3; right: output #3)
figure
subplot(1,2,1), stem(n, x_R_2), title('Input Signal #3 for System 3'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y3_R_2), title('Output Signal #3 for System 3'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #4; right: output #4)
figure
subplot(1,2,1), stem(n, x_R_3), title('Input Signal #4 for System 3'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y3_R_3), title('Output Signal #4 for System 3'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #5; right: output #5)
figure
subplot(1,2,1), stem(n, x_L_1), title('Input Signal #5 for System 3'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y3_L_1), title('Output Signal #5 for System 3'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #6; right: output #6)
figure
subplot(1,2,1), stem(n, x_L_2), title('Input Signal #6 for System 3'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y3_L_2), title('Output Signal #6 for System 3'), xlabel('n'), ylabel('y[n]')

% Generating a figure with 2 stemplots (left: input #7; right: output #7)
figure
subplot(1,2,1), stem(n, x_L_3), title('Input Signal #7 for System 3'), xlabel('n'), ylabel('x[n]')
subplot(1,2,2), stem(n, y3_L_3), title('Output Signal #7 for System 3'), xlabel('n'), ylabel('y[n]')
%% Helper functions for checking linearity
function [comboFun, comboResp, respToComboFun] = plotAdditivity(inpFun1, inpFun2, n, system, inpFun1Name, inpFun2Name, systemNum, plotFun)
    % Sum of input functions: x1[n] + x2[n]
    comboFun = inpFun1 + inpFun2;

    % Sum of individual responses to input functions: y[x1[n]] + y[x2[n]]
    comboResp = system(n,inpFun1) + system(n,inpFun2);

    % Response to sum of input functions: y[x1[n] + x2[n]]
    respToComboFun = system(n,comboFun);

    % graphing impulse/unit step comination function, actual output, and expected output
    InputFunctionsCombination = figure;
    tiledlayout(3,1);

    nexttile
    plotFun(n,comboFun);
    title("Input: " + inpFun1Name + "/" + inpFun2Name + " Comination")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("x1[n]+x2[n]")
    grid("on")

    nexttile
    plotFun(n,respToComboFun);
    title("Actual Output: Response to " + inpFun1Name + "/" + inpFun2Name + " Comination")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[x1[n]+x2[n]")
    grid("on")

    nexttile
    plotFun(n,comboResp);
    title("Expected Output: " + inpFun1Name + "+" + inpFun2Name)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[x1[n]] + y[x2[n]]")
    grid("on")
end

function [posScaledInpFun, negScaledInpFun, resp, posScaledResp, negScaledResp, respToPosScaledInpFun, respToNegScaledInpFun] = plotScaling(posScalingFactor, negScalingFactor, inpFun, n, system, inpFunName, systemNum, plotFun)
    % Scaled input functions: a*x[n]
    posScaledInpFun = posScalingFactor * inpFun;
    negScaledInpFun = negScalingFactor * inpFun;
    
    % Response to original input function: y[x[n]]
    resp = system(n,inpFun);
    
    % Scaled response of original function a*y[x[n]]
    posScaledResp = posScalingFactor * resp;
    negScaledResp = negScalingFactor * resp;
    
    % Response to scaled input function: y[a*x[n]]
    respToPosScaledInpFun = system(n,posScaledInpFun);
    respToNegScaledInpFun = system(n,negScaledInpFun);

    % graphing input function and its response
    BasicInputFunction = figure;
    tiledlayout(2,1);

    nexttile
    plotFun(n,inpFun);
    title("Input: " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("x[n]")
    grid("on")

    nexttile
    plotFun(n,resp);
    title("Output: " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[x[n]]")
    grid("on")

    % graphing positively scaled input function, actual output, and expected output
    PositiveScaledInputFunction = figure;
    tiledlayout(3,1);

    nexttile
    plotFun(n,posScaledInpFun);
    title("Input: Positive Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("a*x[n]")
    grid("on")

    nexttile
    plotFun(n,respToPosScaledInpFun);
    title("Actual Output: Response to Positive Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[a*x[n]]")
    grid("on")

    nexttile
    plotFun(n,posScaledResp);
    title("Expected Output: Positive Scaled " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("a*y[x[n]]")
    grid("on")

    % graphing negatively scaled impulse function, actual output, and expected output
    NegativeScaledInputFunction = figure;
    tiledlayout(3,1);

    nexttile
    plotFun(n,negScaledInpFun);
    title("Input: Negative Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("-a*x[n]")
    grid("on")

    nexttile
    plotFun(n,respToNegScaledInpFun);
    title("Actual Output: Response to Negative Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[-a*x[n]]")
    grid("on")
    
    nexttile
    plotFun(n,negScaledResp);
    title("Expected Output: Negative Scaled " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("-a*y[x[n]]")
    grid("on")
end