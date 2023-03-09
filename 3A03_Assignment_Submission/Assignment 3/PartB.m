load EEGdata_assignment3.mat; % load arrays containing EEG time-domain signals

% Task 1: Plotting the magnitude spectra of EEG1 and EEG2

% Computing the amplitude and phase spectra of EEG time-domain signals.
% Fs: sampling frequency 
% 'full': frequency scope that includes positive and negative frequencies.

% EEG1: EEG1 time-domain signal
% mEEG1: magnitude spectrum of EEG1
% phEEG1: phases spectrum of EEG1
% fEEG1: array of scaled frequencies of EEG1
[mEEG1, phEEG1, fEEG1] = fourier_dt(EEG1,Fs,'full');

% EEG2: EEG2 time-domain signal
% mEEG2: magnitude spectrum of EEG2
% phEEG2: phases spectrum of EEG2
% fEEG2: array of scaled frequences of EEG2
[mEEG2, phEEG2, fEEG2] = fourier_dt(EEG2,Fs,'full');

% Plotting the magnitude spectrum of EEG1
figure
plot(fEEG1,mEEG1)
xlim([-20 20]) % domain of x-axis, set to [-20,20] for improved visibility
xlabel('f (Hz)')
ylabel('Amplitude (µV)')
title('Magnitude Spectrum of EEG1')

% Plotting the magnitude spectrum of EEG2
figure
plot(fEEG2,mEEG2)
xlim([-20 20]) % domain of x-axis, set to [-20,20] for improved visibility
xlabel('f (Hz)')
ylabel('Amplitude (µV)')
title('Magnitude Spectrum of EEG2')

%%
load EEGdata_assignment3.mat; % load arrays containing EEG time-domain signals

% Task 2: Plotting signal 'band power' in specific frequency band ranges

% Assigning lower (LB) and upper bounds (UB) of frequency band ranges (FBR) 
% for rhythms delta (d), theta (t), alpha (a), beta (b) and gamma (g) 
d_LB = 0; % delta LB
d_UB = 3; % delta UB
t_LB = 3; % theta LB
t_UB = 8; % theta UB
a_LB = 8; % alpha LB
a_UB = 13; % alpha UB
b_LB = 13; % beta LB
b_UB = 25; % beta UB
g_LB = 25; % gamma LB
g_UB = 100; % gamma UB

% Rhythm FBRs for EEG1
FBR_d_1 = find(fEEG1 >= d_LB & fEEG1 < d_UB); % delta FBR for EEG1
FBR_t_1 = find(fEEG1 >= t_LB & fEEG1 < t_UB); % theta FBR for EEG1
FBR_a_1 = find(fEEG1 >= a_LB & fEEG1 < a_UB); % alpha FBR for EEG1
FBR_b_1 = find(fEEG1 >= b_LB & fEEG1 < b_UB); % beta FBR for EEG1
FBR_g_1 = find(fEEG1 >= g_LB & fEEG1 <= g_UB); % gamma FBR for EEG1

% Rhythm FBRs for EEG2
FBR_d_2 = find(fEEG2 >= d_LB & fEEG2 < d_UB); % delta FBR for EEG2
FBR_t_2 = find(fEEG2 >= t_LB & fEEG2 < t_UB); % theta FBR for EEG2
FBR_a_2 = find(fEEG2 >= a_LB & fEEG2 < a_UB); % alpha FBR for EEG2
FBR_b_2 = find(fEEG2 >= b_LB & fEEG2 < b_UB); % beta FBR for EEG2
FBR_g_2 = find(fEEG2 >= g_LB & fEEG2 <= g_UB); % gamma FBR for EEG2

% Calculating band powers (BPs) using Parseval's theorem and the expression
% learned in lecture: BP = sum((signal magnitude spectrum)^.2)

% Band Powers (BPs) of EEG1:
BP_d_1 = sum((mEEG1(FBR_d_1(1:end))).^2); % BP of EEG1 delta FBR
BP_t_1 = sum((mEEG1(FBR_t_1(1:end))).^2); % BP of EEG1 theta FBR
BP_a_1 = sum((mEEG1(FBR_a_1(1:end))).^2); % BP of EEG1 alpha FBR
BP_b_1 = sum((mEEG1(FBR_b_1(1:end))).^2); % BP of EEG1 beta FBR
BP_g_1 = sum((mEEG1(FBR_g_1(1:end))).^2); % BP of EEG1 gamma FBR

BPs_1 = [BP_d_1 BP_t_1 BP_a_1 BP_b_1 BP_g_1]; % array of BPs of EEG1

% Plotting BPs of EEG1:
rhythms = {'Delta [0,3)' 'Theta [3,8)' 'Alpha [8,13)' 'Beta [13,25)' 'Gamma [25,100]'};
figure
histogram('Categories', rhythms, 'BinCounts', BPs_1)
xlabel('Frequency Band Range (Hz)')
ylabel('Band Power (µV^2)')
title('EEG1 Band Power')

% Normalized BPs of EEG1:
normBP_d_1 = BP_d_1/(d_UB - d_LB); % normalized BP of EEG1 delta FBR
normBP_t_1 = BP_t_1/(t_UB - t_LB); % normalized BP of EEG1 theta FBR
normBP_a_1 = BP_a_1/(a_UB - a_LB); % normalized BP of EEG1 alpha FBR
normBP_b_1 = BP_b_1/(b_UB - b_LB); % normalized BP of EEG1 beta FBR
normBP_g_1 = BP_g_1/(g_UB - g_LB); % normalized BP of EEG1 gamma FBR

% array of normalized BPs of EEG1:
normBPs_1 = [normBP_d_1 normBP_t_1 normBP_a_1 normBP_b_1 normBP_g_1];

% Plotting Normalized BPs of EEG1:
figure
histogram('Categories', rhythms, 'BinCounts', normBPs_1)
xlabel('Frequency Band Range (Hz)')
ylabel('Normalized Band Power (µV^2/Hz)')
title('Normalized EEG1 Band Power')


% Band Powers (BPs) of EEG2:
BP_d_2 = sum((mEEG2(FBR_d_2(1:end))).^2); % BP of EEG2 delta FBR
BP_t_2 = sum((mEEG2(FBR_t_2(1:end))).^2); % BP of EEG2 theta FBR
BP_a_2 = sum((mEEG2(FBR_a_2(1:end))).^2); % BP of EEG2 alpha FBR
BP_b_2 = sum((mEEG2(FBR_b_2(1:end))).^2); % BP of EEG2 beta FBR
BP_g_2 = sum((mEEG2(FBR_g_2(1:end))).^2); % BP of EEG2 gamma FBR

BPs_2 = [BP_d_2 BP_t_2 BP_a_2 BP_b_2 BP_g_2]; % array of BPs of EEG1

% Plotting BPs of EEG2:
figure
histogram('Categories', rhythms, 'BinCounts', BPs_2)
xlabel('Frequency Band Range (Hz)')
ylabel('Band Power (µV^2)')
title('EEG2 Band Power')

% Normalized BPs of EEG2:
normBP_d_2 = BP_d_2/(d_UB - d_LB); % normalized BP of EEG2 delta FBR
normBP_t_2 = BP_t_2/(t_UB - t_LB); % normalized BP of EEG2 theta FBR
normBP_a_2 = BP_a_2/(a_UB - a_LB); % normalized BP of EEG2 alpha FBR
normBP_b_2 = BP_b_2/(b_UB - b_LB); % normalized BP of EEG2 beta FBR
normBP_g_2 = BP_g_2/(g_UB - g_LB); % normalized BP of EEG2 gamma FBR

% array of normalized BPs of EEG2:
normBPs_2 = [normBP_d_2 normBP_t_2 normBP_a_2 normBP_b_2 normBP_g_2];

% Plotting Normalized BPs of EEG2:
figure
histogram('Categories', rhythms, 'BinCounts', normBPs_2)
xlabel('Frequency Band Range (Hz)')
ylabel('Normalized Band Power (µV^2/Hz)')
title('Normalized EEG2 Band Power')

%%

% BONUS: spectrogram( ) of EEG signals
load EEGdata_assignment3.mat;

% These were the values that obtained visible differences between subplots 
% WITH t = [0,20] being entirely visible.
winlen = 1e3; % the desired length of windowed segments
overlap = 5e2; % the desired samples overlapping per window position
NFFT = 2e4; % signal is zero-padded to this length; number of DFT points

% Plotting spectrograms
figure

% EEG1 spectrogram:
subplot(2,1,1)

% spectrogram() uses NFFT sampling points to calculate discrete Fourier transform:
% s_EEG1: short-time Fourier transform of EEG1
% f_EEG1: frequency of EEG1
% t_EEG1: time instants of EEG1
[s_EEG1, f_EEG1, t_EEG1] = spectrogram(EEG1,winlen,overlap,NFFT,Fs);

% Displaying image with scaled colours: 
imagesc(t_EEG1,f_EEG1,abs(s_EEG1)/winlen);

axis xy
ylim([0 15])

title('EEG1')
ylabel('f (Hz)')
cb2 = colorbar;
cb2.Label.String = '|X(f)| (µV)';

% EEG2 spectrogram:
subplot(2,1,2)

% spectrogram() uses NFFT sampling points to calculate discrete Fourier transform:
% s_EEG2: short-time Fourier transform of EEG2
% f_EEG2: frequency of EEG2
% t_EEG2: time instants of EEG2
[s_EEG2, f_EEG2, t_EEG2] = spectrogram(EEG2,winlen,overlap,NFFT,Fs);

% Displaying image with scaled colours: 
imagesc(t_EEG2,f_EEG2,abs(s_EEG2)/winlen);

axis xy
ylim([0 15])

title('EEG2')
ylabel('f (Hz)')
xlabel('t (s)')
cb2 = colorbar;
cb2.Label.String = '|X(f)| (µV)';