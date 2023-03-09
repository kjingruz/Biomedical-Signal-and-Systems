%%

%Question 1

clear;
clc;

n = -4:15; %discrete step
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; %Impulse Function as the input function
y = ltisystemB(n,x); %Impulse Response from system B

figure,%creating an impulse response graph 
subplot(1,1,1), stem(n,y),title("Impulse response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;

%Question 2

n = -4:15;%discrete step
x = n>=0;%unit step function as the input function 

y = ltisystemB(n,x);  % unit step response from system B

figure,%creating a unit step response graph 
subplot(1,1,1), stem(n,y),title("Unit Step Response"),xlabel("n"),ylabel("y[n]");

%%
clear;
clc;
%Question 3

n1 = -4:15;%discrete step
x1 = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];%impulse function as the input function
y1 = ltisystemB(n1,x1); %impulse response from system B

n2 = -4:15;%discrete step
x2 = n2>=0; %unit step function as the input function
y2 = ltisystemB(n2,x2); %unit step reponse from system B

sum = cumsum(y1); % use cumsum to find the cumulative sum of impulse response

figure, %creating a graph of the cumulative sum of impulse reponse and the unit step response
subplot(2,1,1), stem(n2,y2),title("Unit Step Reponse"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), stem(n1,sum),title("Cumulative Sum of Impulse Response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;
%Question 4

n1 = -4:15; %discrete step
x1 = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; %impulse function as the input function
y1 = ltisystemB(n1,x1); %impulse response from system B

n2 = -4:15; %discrete step
x2 = n2>=0; %unit step function as the input function 
y2 = ltisystemB(n2,x2); % unit step response from system B

difference = diff(y2); % the first difference of the unit step response


% creating a plot of the unit impulse response and the first difference of the unit step response.
% the length of the first difference of unit step response is adjusted to
% be align with unit impulse response
figure, 
subplot(2,1,1), stem(n1,y1),title("Unit Impulse Reponse"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), stem(n2(1:length(n2)-1)+1,difference),title("First difference of unit step response"),xlabel("n"),ylabel("y[n]");

%%

clear;
clc;

%Question 5


load ECG_assignment2.mat % loading the ECG values
ecg_x = x; %use the ECG values as the input function
ecg_n = 0:length(ecg_x)-1; %discrete step created from the x value, shorten the length to match
y = ltisystemB(ecg_n,ecg_x); %ECG response from system B

figure,% creating a graph of the ECG response
subplot(1,1,1), plot(ecg_n,y),title("ECG response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;

%Question 6

load respiration_assignment2.mat %loading the respiration values
resp_x = x; % use the respiration values as the input function
resp_n = 0:length(resp_x)-1;%discrete step created from the x value, shorten the length to match
y = ltisystemB(resp_n,resp_x);%respiration response from system B

figure,% creating a graph of the respiration response
subplot(1,1,1), plot(resp_n,y),title("Respiration response"),xlabel("n"),ylabel("y[n]");


%%

clear;
clc;

%Question 7

load ECG_assignment2.mat % loading the ECG values
ecg_x = x; %use the ECG values as the input function
ecg_n = 0:length(ecg_x)-1; %discrete step created from the x value, shorten the length to match
ecg_y = ltisystemB(ecg_n,ecg_x);%ECG response from system B

n = -4:15; %discrete step
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; %impulse function as the input function
y = ltisystemB(n,x); %impulse response from system B

conv_ecg = conv(ecg_x,y); % impulse response convolved with the ECG data

figure, % plotting ecg response and impulse response convolved with ecg data
subplot(2,1,1), plot(ecg_n,ecg_y),title("ECG output"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), plot(ecg_n,conv_ecg(1:length(ecg_n))), title("Convolved signal"), xlabel("n"),ylabel("y[n]");


load respiration_assignment2.mat %loading the respiration values
resp_x = x; % use the respiration values as the input function
resp_n = 0:length(resp_x)-1; %discrete step created from the x value, shorten the length to match
resp_y = ltisystemB(resp_n,resp_x); % respiration response from system B


conv_resp = conv(resp_x,y);% impulse response convolved with the respiration data
figure,% plotting respiration response and impulse response convolved with respiration data
subplot(2,1,1), plot(resp_n,resp_y),title("Respiration output"),xlabel("n"),ylabel("y[n]");
subplot(2,1,2), plot(resp_n,conv_resp(1:length(resp_n))), title("Convolved signal"), xlabel("n"),ylabel("y[n]");

%%


