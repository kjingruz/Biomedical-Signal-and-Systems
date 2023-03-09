%%

%Question 1
n = -4:15; % discrete step (n values)
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function as input
y = ltisystemC(n,x); % impulse response from system C

% plotting impulse response (System C)
figure, 
subplot(1,1,1), stem(n,y),title("Impulse response"),xlabel("n"),ylabel("y[n]");

%%

clear;
clc;

%Question 2

n = -4:15; % discrete step (n values)
x = n>=0; % unit step function as input

y = ltisystemC(n,x); % unit step response from system C

% plotting unit step response (System C)
figure,
subplot(1,1,1), stem(n,y),title("Unit Step Response"),xlabel("n"),ylabel("y[n]");

%%
clear;
clc;
%Question 3

n1 = -4:15; % discrete step (n1 values)
x1 = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function as input
y1 = ltisystemC(n1,x1); % impulse response from system C

n2 = -4:15; % discrete step (n2 values)
x2 = n2>=0; % unit step function as input
y2 = ltisystemC(n2,x2); % unit step reponse from system C

sum = cumsum(y1); % cumulative sum of impulse response (System C)

% plotting unit step response and cumulative sum of impulse response (System C)
figure,
subplot(2,1,1), stem(n2,y2),title("Unit Step Reponse"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), stem(n1,sum),title("Cumulative Sum of Impulse Response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;
%Question 4

n1 = -4:15; % discrete step (n1 values)
x1 = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function as input 
y1 = ltisystemC(n1,x1); % impulse response from system C

n2 = -4:15; % discrete step (n2 values)
x2 = n2>=0; % unit step function as input
y2 = ltisystemC(n2,x2); % unit step response from system C

difference = diff(y2); % first difference of the unit step response

% Plotting unit impulse response & first difference of unit step response.
% Length of first difference of unit step response is adjusted to be align 
% with unit impulse response. This is for System C.
figure,
subplot(2,1,1), stem(n1,y1),title("Unit Impulse Reponse"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), stem(n2(1:length(n2)-1)+1,difference),title("First difference of unit step response"),xlabel("n"),ylabel("y[n]");

%%

clear;
clc;

%Question 5

load ECG_assignment2.mat     % loading the ECG values
ecg_x = x;                   % ECG values as the input function
ecg_n = 0:length(ecg_x)-1;   % ECG n values (discrete step)
y = ltisystemC(ecg_n,ecg_x); % ECG response from System C

% plotting ECG response (System C)
figure,
subplot(1,1,1), plot(ecg_n,y),title("ECG response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;

%Question 6

load respiration_assignment2.mat % loading respiration values
resp_x = x;                      % respiration values as input function
resp_n = 0:length(resp_x)-1;     % respiration n values
y = ltisystemC(resp_n,resp_x);   % respiration response from System C 

% plotting respiration response (System C)
figure,
subplot(1,1,1), plot(resp_n,y),title("Respiration response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;

%Question 7

load ECG_assignment2.mat         % loading ECG values
ecg_x = x;                       % ECG values as the input function
ecg_n = 0:length(ecg_x)-1;       % ECG n values (discrete step)
ecg_y = ltisystemC(ecg_n,ecg_x); % ECG response from System C

n = -4:15; % discrete step (n values) for impulse function
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function as input
y = ltisystemC(n,x); % impulse response from System C

conv_ecg = conv(ecg_x,y); % impulse response convolved with the ECG data

% plotting ECG response and impulse response convolved with ECG data
figure,
subplot(2,1,1), plot(ecg_n,ecg_y),title("ECG output"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), plot(ecg_n,conv_ecg(1:length(ecg_n))), title("Convolved signal"), xlabel("n"),ylabel("y[n]");


load respiration_assignment2.mat    % loading respiration values
resp_x = x;                         % respiration values as input function
resp_n = 0:length(resp_x)-1;        % respiration n values
resp_y = ltisystemC(resp_n,resp_x); % respiration response from System C


conv_resp = conv(resp_x,y); % impulse response convolved with respiration data

% plotting respiration response and impulse response convolved with respiration data
figure,
subplot(2,1,1), plot(resp_n,resp_y),title("Respiration output"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), plot(resp_n,conv_resp(1:length(resp_n))), title("Convolved signal"), xlabel("n"),ylabel("y[n]");

%%


