%%

%Bonus

clear;
clc;
%Question 3

n = -4:15; % discrete step (n values)
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function as input
y1A = ltisystemA(n,x); % impulse response from system A
y1B = ltisystemB(n,x); % impulse response from system B
y1C = ltisystemC(n,x); % impulse response from system C

n2 = -4:15; % discrete step (n2 values)
x2 = n2>=0; % unit step function as input
y2A = ltisystemA(n2,x2); % unit step reponse from system A
y2B = ltisystemB(n2,x2); % unit step reponse from system B
y2C = ltisystemC(n2,x2); % unit step reponse from system C

sumA = cumsum(y1A); % cumulative sum of impulse response (System A)
sumB = cumsum(y1B); % cumulative sum of impulse response (System B)
sumC = cumsum(y1C); % cumulative sum of impulse response (System C)

% for each system, verifying if unit step response equals cumulative sum of
% impulse response (to 5 decimals). (1 = true, 0 = false)
Q3a = isequal(round(y2A,5),round(sumA,5));
Q3b = isequal(round(y2B,5),round(sumB,5));
Q3c = isequal(round(y2C,5),round(sumC,5));



%%

clear;
clc;

%Question 4

n = -4:15; % discrete step (n1 values)
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function as input 
y1A = ltisystemA(n,x); % impulse response from system A
y1B = ltisystemB(n,x); % impulse response from system B
y1C = ltisystemC(n,x); % impulse response from system C

n2 = -4:15; % discrete step (n2 values)
x2 = n2>=0; % unit step function as input
y2A = ltisystemA(n2,x2); % unit step response from system A
y2B = ltisystemB(n2,x2); % unit step response from system B
y2C = ltisystemC(n2,x2); % unit step response from system C

diffA = diff(y2A); % first difference of the unit step response (System A)
diffB = diff(y2B); % first difference of the unit step response (System B)
diffC = diff(y2C); % first difference of the unit step response (System C)

% for each system, verifying if impulse response equals first difference of
% unit step response (to 5 decimals). (1 = true, 0 = false)
Q4a = isequal(round(y1A,5),round([0 diffA],5));
Q4b = isequal(round(y1B,5),round([0 diffB],5));
Q4c = isequal(round(y1C,5),round([0 diffC],5));



%%
%Question 7

load ECG_assignment2.mat          % loading ECG values
ecg_x = x;                        % ECG values as the input function
ecg_n = 0:length(ecg_x)-1;        % ECG n values (discrete step)
ecg_yA = ltisystemA(ecg_n,ecg_x); % ECG response from System A
ecg_yB = ltisystemB(ecg_n,ecg_x); % ECG response from System B
ecg_yC = ltisystemC(ecg_n,ecg_x); % ECG response from System C


n = -4:15; % discrete step (n values) for impulse function
x = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % impulse function as input
yA = ltisystemA(n,x); % impulse response from System A
yB = ltisystemB(n,x); % impulse response from System B
yC = ltisystemC(n,x); % impulse response from System C

conv_ecgA = conv(ecg_x,yA); % impulse response (System A) convolved with the ECG data 
conv_ecgB = conv(ecg_x,yB); % impulse response (System B) convolved with the ECG data
conv_ecgC = conv(ecg_x,yC); % impulse response (System C) convolved with the ECG data

% applying a time shift and truncating each convolution so that the n
% values are consistent with the n values of their ECG response
conv_ecgA = conv_ecgA(5:length(ecg_yA)+4);
conv_ecgB = conv_ecgB(5:length(ecg_yB)+4); 
conv_ecgC = conv_ecgC(5:length(ecg_yC)+4); 

% for each system, verifying if ECG response equals the convolution of the
% impulse response with the ECG data
Q7ECGa = isequal(round(ecg_yA,2),round(conv_ecgA,2));
Q7ECGb = isequal(round(ecg_yB,2),round(conv_ecgB,2));
Q7ECGc = isequal(round(ecg_yC,2),round(conv_ecgC,2));

load respiration_assignment2.mat     % loading respiration values
resp_x = x;                          % respiration values as input function
resp_n = 0:length(resp_x)-1;         % respiration n values
resp_yA = ltisystemA(resp_n,resp_x); % respiration response from System A
resp_yB = ltisystemB(resp_n,resp_x); % respiration response from System B
resp_yC = ltisystemC(resp_n,resp_x); % respiration response from System C

conv_respA = conv(resp_x,yA); % impulse response (System A) convolved with respiration data
conv_respB = conv(resp_x,yB); % impulse response (System B) convolved with respiration data
conv_respC = conv(resp_x,yC); % impulse response (System C) convolved with respiration data

% applying a time shift and truncating each convolution so that the n
% values are consistent with the n values of their respiration response
conv_respA = conv_respA(5:length(resp_yA)+4); 
conv_respB = conv_respB(5:length(resp_yB)+4); 
conv_respC = conv_respC(5:length(resp_yC)+4); 

% for each system, verifying if respiration response equals the convolution of the
% impulse response with the respiration data
Q7RESPa = isequal(round(resp_yA),round(conv_respA));
Q7RESPb = isequal(round(resp_yB),round(conv_respB));
Q7RESPc = isequal(round(resp_yC),round(conv_respC));

%%
