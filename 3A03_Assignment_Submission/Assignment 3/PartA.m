%PART A
%% 1)
clc;
clear;
%load BFVdu value
load BFVdata_assignment3.mat
%calculate discrete fourier tranform
[mBFV, phBFV, fBFV] = fourier_dt(BFVdu, Fs, 'full');

%plot dtft
figure
plot(fBFV, mBFV)
xlim([-2 8])
ylim([0 0.07])
ylabel('Blood Flow Velocity (m/s)')
xlabel('Frequency (Hz)')
title('Blood Velocity Magnitude Spectrum')

%% 2)
clc;
clear;
%load BFVdu value
load BFVdata_assignment3.mat
%calculate discrete fourier tranform
[mFullBFV, phFullBFV, fFullBFV] = fourier_dt(BFVdu, Fs, 'full');

%dtft for L = 400
figure
plot(fFullBFV, mFullBFV)
hold on

L = 400;
adj_BFVdu = BFVdu(1:L);
[m400BFV, ph400BFV, f400BFV] = fourier_dt(adj_BFVdu, Fs, 'full');

plot(f400BFV, m400BFV)
xlim([-2 8])
ylim([0 0.07])
ylabel('Blood Flow Velocity (m/s)')
xlabel('Frequency (Hz)')
title('Blood Velocity Magnitude Spectrum')
legend('Full Signal','L = 400')
hold off

%dtft for L = 300
figure
plot(fFullBFV, mFullBFV)
hold on

L = 300;
adj_BFVdu = BFVdu(1:L);
[m300BFV, ph300BFV, f300BFV] = fourier_dt(adj_BFVdu, Fs, 'full');

plot(f300BFV, m300BFV)
xlim([-2 8])
ylim([0 0.07])
ylabel('Blood Flow Velocity (m/s)')
xlabel('Frequency (Hz)')
title('Blood Velocity Magnitude Spectrum')
legend('Full Signal','L = 300')
hold off

%dtft for L = 200
figure
plot(fFullBFV, mFullBFV)
hold on

L = 200;
adj_BFVdu = BFVdu(1:L);
[m200BFV, ph200BFV, f200BFV] = fourier_dt(adj_BFVdu, Fs, 'full');

plot(f200BFV, m200BFV)
xlim([-2 8])
ylim([0 0.07])
ylabel('Blood Flow Velocity (m/s)')
xlabel('Frequency (Hz)')
title('Blood Velocity Magnitude Spectrum')
legend('Full Signal', 'L = 200')
hold off

%L = 300 is the minimum L for which the harmonic structure observed in the
% spectrum of the entire BFV signal is well represented in
% the signal segment

%% 3) Zero-padded graph
clc;
clear;
%load BFVdu value
load BFVdata_assignment3.mat
%calculate discrete fourier tranform
[mFullBFV, phFullBFV, fFullBFV] = fourier_dt(BFVdu, Fs, 'full');

%zero padded L = 400
figure
plot(fFullBFV, mFullBFV)
hold on

L = 400;
adj_BFVdu = BFVdu(1:L);
zeropadding = [adj_BFVdu; zeros(L,1)];
[m400zeroBFV, ph400zeroBFV, f400zeroBFV] = fourier_dt(zeropadding, Fs, 'full');

plot(f400zeroBFV, m400zeroBFV)
xlim([-2 8])
ylim([0 0.07])
ylabel('Blood Flow Velocity (m/s)')
xlabel('Frequency (Hz)')
title('Blood Velocity Magnitude Spectrum')
legend('Full Signal', 'Zero-Padded, L = 400')
hold off

%zero padded L = 300
figure
plot(fFullBFV, mFullBFV)
hold on

L = 300;
adj_BFVdu = BFVdu(1:L);
zeropadding = [adj_BFVdu; zeros(L,1)];
[m300zeroBFV, ph300zeroBFV, f300zeroBFV] = fourier_dt(zeropadding, Fs, 'full');

plot(f300zeroBFV, m300zeroBFV)
xlim([-2 8])
ylim([0 0.07])
ylabel('Blood Flow Velocity (m/s)')
xlabel('Frequency (Hz)')
title('Blood Velocity Magnitude Spectrum')
legend('Full Signal', 'Zero-Padded, L = 300')
hold off

%zero padded L = 200
figure
plot(fFullBFV, mFullBFV)
hold on

L = 200;
adj_BFVdu = BFVdu(1:L);
zeropadding = [adj_BFVdu; zeros(L,1)];
[m200zeroBFV, ph200zeroBFV, f200zeroBFV] = fourier_dt(zeropadding, Fs, 'full');

plot(f200zeroBFV, m200zeroBFV)
xlim([-2 8])
ylim([0 0.07])
ylabel('Blood Flow Velocity (m/s)')
xlabel('Frequency (Hz)')
title('Blood Velocity Magnitude Spectrum')
legend('Full Signal', 'Zero-Padded, L = 200')
hold off

%% Bonus A
clc;
clear;

load BFVdata_assignment3.mat;

winlen = 60; % the desired length of windowed segments
overlap = 10; % the desired samples overlapping per window position
NFFT = 400;   % signal is zero-padded to this length; number of DFT points


%Spectrogram of Blood Velocity
figure
% spectrogram() uses NFFT sampling points to calculate discrete Fourier transform:
% s_EEG2: short-time Fourier transform of BFVdu
% f_EEG2: frequency of BFVdu
% t_EEG2: time instants of BFVdu

[s_BFVdu,f_BFVdu,t_BFVdu] = spectrogram(BFVdu,winlen,overlap,NFFT,Fs);
% Displaying image with scaled colours: 
imagesc(t_BFVdu,f_BFVdu,abs(s_BFVdu)/winlen)
axis xy
ylim([0 30])
title('BFV')
ylabel('f (Hz)')
cb1 = colorbar;
cb1.Label.String = '|BFV| (m/s)';