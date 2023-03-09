clc;
clear;

load EEGdata_assignment4.mat
load part1IIR.mat
load part1FIR.mat

[MEEG,phEEG,fEEG] = fourier_dt(EEGa4,Fs,"half");

IIRFilteredEEG = filter(part1IIR,EEGa4);
[MIIRFilteredEEG,phIIRFilteredEEG,fIIRFilteredEEG] = fourier_dt(IIRFilteredEEG,Fs,"half");

FIRFilteredEEG = filter(part1FIR,EEGa4);
[MFIRFilteredEEG,phFIRFilteredEEG,fFIRFilteredEEG] = fourier_dt(FIRFilteredEEG,Fs,"half");

% Part 1 IIR Filter Below

figure
hold on
plot(EEGa4)
plot(IIRFilteredEEG)
hold off
title("EEG Time Domain")
xlabel("Time")
ylabel("EEG")
legend("EEG","IIR Filtered EEG")

figure
hold on
plot(fEEG,MEEG)
plot(fIIRFilteredEEG,MIIRFilteredEEG)
hold off
title("EEG frequency domain - Magnitude")
xlabel("Frequency")
ylabel("EEG")
legend("EEG","IIR Filtered EEG")
ylim([0 2])

figure
hold on
plot(fEEG,phEEG)
plot(fIIRFilteredEEG,phIIRFilteredEEG)
hold off
title("EEG frequency domain - Phase")
xlabel("Frequency")
ylabel("EEG")
legend("EEG","IIR Filtered EEG")

figure
hold on
plot(EEGa4)
plot(IIRFilteredEEG)
hold off
title("EEG Time Domain - Time Delay")
xlabel("Time")
ylabel("EEG")
legend("EEG","IIR Filtered EEG")
xlim([0 75])

% Part 1 FIR Filter Below

figure
hold on
plot(EEGa4)
plot(FIRFilteredEEG)
hold off
title("EEG Time Domain")
xlabel("Time")
ylabel("EEG")
legend("EEG","FIR Filtered EEG")

figure
hold on
plot(fEEG,MEEG)
plot(fFIRFilteredEEG,MFIRFilteredEEG)
hold off
title("EEG frequency domain - Magnitude")
xlabel("Frequency")
ylabel("EEG")
legend("EEG","FIR Filtered EEG")
ylim([0 2])

figure
hold on
plot(fEEG,phEEG)
plot(fFIRFilteredEEG,phFIRFilteredEEG)
hold off
title("EEG frequency domain - Phase")
xlabel("Frequency")
ylabel("EEG")
legend("EEG","FIR Filtered EEG")

figure
hold on
plot(EEGa4)
plot(FIRFilteredEEG)
hold off
title("EEG Time Domain - Time Delay")
xlabel("Time")
ylabel("EEG")
legend("EEG","FIR Filtered EEG")
xlim([0 150])

figure
hold on
plot(EEGa4)
plot(FIRFilteredEEG(97:length(FIRFilteredEEG)))
hold off
title("EEG Time Domain - Corrected Time Delay")
xlabel("Time")
ylabel("EEG")
legend("EEG","FIR Filtered EEG")
xlim([0 150])