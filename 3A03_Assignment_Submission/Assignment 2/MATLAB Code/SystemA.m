%%

%Question 1
n = -4:15; % n values
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function
y = ltisystemA(n,x); % impulse response 

% plotting impulse response
figure,
subplot(1,1,1), stem(n,y),title("Impulse Response"),xlabel("n"),ylabel("y[n]");

%%

clear;
clc;

%Question 2

n = -4:15; % n values
x = n>=0; % unit step function

y = ltisystemA(n,x);% unit step response

% plotting unit step response
figure,
subplot(1,1,1), stem(n,y),title("Unit Step Response"),xlabel("n"),ylabel("y[n]");

%%
clear;
clc;
%Question 3

n1 = -4:15; % n values
x1 = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function
y1 = ltisystemA(n1,x1); % impulse response

n2 = -4:15; % n values
x2 = n2>=0; % unit step function
y2 = ltisystemA(n2,x2); % unit step response

sum = cumsum(y1); % cumulative sum of impulse response

% plotting unit step response and cumulative sum of impulse response
figure,
subplot(2,1,1), stem(n2,y2),title("Unit Step Response"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), stem(n1,sum),title("Cumulative Sum of Impulse Response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;
%Question 4

n1 = -4:15; % n values
x1 = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function
y1 = ltisystemA(n1,x1); % impulse response

n2 = -4:15; % n values
x2 = n2>=0; % unit step function
y2 = ltisystemA(n2,x2); % unit step response

difference = diff(y2); % first difference of unit step response

% plotting impulse response and first difference of unit step response
figure,
subplot(2,1,1), stem(n1,y1),title("Unit Impulse Response"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), stem(n2(1:length(n2)-1)+1,difference),title("First Difference of Unit Step Response"),xlabel("n"),ylabel("y[n]");

%%

clear;
clc;

%Question 5

load ECG_assignment2.mat
ecg_x = x; % ecg values
ecg_n = 0:length(ecg_x)-1; % ecg n values
y = ltisystemA(ecg_n,ecg_x); % ecg response

% plotting ecg response
figure,
subplot(1,1,1), plot(ecg_n,y),title("ECG Response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;

%Question 6

load respiration_assignment2.mat
resp_x = x; % respiration values
resp_n = 0:length(resp_x)-1; % respiration n values
y = ltisystemA(resp_n,resp_x); % respiration response

% plotting respiration response
figure,
subplot(1,1,1), plot(resp_n,y),title("Respiration Response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;

%Question 7

load ECG_assignment2.mat
ecg_x = x; % ecg values
ecg_n = 0:length(ecg_x)-1; % ecg n values
ecg_y = ltisystemA(ecg_n,ecg_x); % ecg response

n = -4:15; % impulse function n values
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function
y = ltisystemA(n,x); % impulse response

conv_ecg = conv(ecg_x,y); % impulse response convolved with ecg data

% plotting ecg response and impulse response convolved with ecg data
figure,
subplot(2,1,1), plot(ecg_n,ecg_y),title("ECG Response"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), plot(ecg_n,conv_ecg(1:length(ecg_n))), title("Convolved ECG and Impulse"), xlabel("n"),ylabel("y[n]");


load respiration_assignment2.mat
resp_x = x; % respiration data
resp_n = 0:length(resp_x)-1; % respiration n values
resp_y = ltisystemA(resp_n,resp_x); % respiration response

conv_resp = conv(resp_x,y); % impulse response convolved with respiration data

% plotting respiration response and impulse response convolved with respiration data
figure,
subplot(2,1,1), plot(resp_n,resp_y),title("Respiration Response"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), plot(resp_n,conv_resp(1:length(resp_n))), title("Convolved Respiratory and Impulse"), xlabel("n"),ylabel("y[n]");
