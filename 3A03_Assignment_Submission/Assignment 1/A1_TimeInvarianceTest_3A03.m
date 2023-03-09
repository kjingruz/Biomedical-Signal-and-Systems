%% Time Invariance Test on each system to evaluate their time-dependence.

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

%% Time Invariance Test for System 1
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


%% Time Invariance Test for System 2
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


%% Time Invariance Test for System 3
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
