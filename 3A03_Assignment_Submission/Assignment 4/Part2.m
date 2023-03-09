clc;
clear;

load VGRFdata_assignment4.mat
load Part2FIRFilter.mat
load VGRF_IIR_2.mat

[MVGRF,phVGRF,fVGRF] = fourier_dt(VGRF,Fs,"half");

IIRFilteredVGRF = filter(VGRF_IIR_Filter2,VGRF);
[MIIRFilteredVGRF,phIIRFilteredVGRF,fIIRFilteredVGRF] = fourier_dt(IIRFilteredVGRF,Fs,"half");

FIRFilteredVGRF = filter(Part2FIR,VGRF);
[MFIRFilteredVGRF,phFIRFilteredVGRF,fFIRFilteredVGRF] = fourier_dt(FIRFilteredVGRF,Fs,"half");

% Part 2 IIR Filter Below

figure
hold on
plot(VGRF)
plot(IIRFilteredVGRF)
hold off
title("VGRF Time Domain")
xlabel("Time")
ylabel("VGRF (N)")
legend("VGRF","IIR Filtered VGRF")

figure
hold on
plot(fVGRF,MVGRF)
plot(fIIRFilteredVGRF,MIIRFilteredVGRF)
hold off
title("VGRF frequency domain - Magnitude")
xlabel("Frequency (Hz)")
ylabel("VGRF (N)")
legend("VGRF","IIR Filtered VGRF")
ylim([0 2])

figure
hold on
plot(fVGRF,phVGRF)
plot(fIIRFilteredVGRF,phIIRFilteredVGRF)
hold off
title("VGRF frequency domain - Phase")
xlabel("Frequency (Hz)")
ylabel("VGRF (N)")
legend("VGRF","IIR Filtered VGRF")

figure
hold on
plot(VGRF)
plot(IIRFilteredVGRF)
hold off
title("VGRF Time Domain - Time Delay")
xlabel("Time")
ylabel("VGRF (N)")
legend("VGRF","IIR Filtered VGRF")
xlim([0 300])

% Part 2 FIR Filter Below

figure
hold on
plot(VGRF)
plot(FIRFilteredVGRF)
hold off
title("VGRF Time Domain")
xlabel("Time")
ylabel("VGRF")
legend("VGRF","FIR Filtered VGRF")

figure
hold on
plot(fVGRF,MVGRF)
plot(fFIRFilteredVGRF,MFIRFilteredVGRF)
hold off
title("VGRF frequency domain - Magnitude")
xlabel("Frequency (Hz)")
ylabel("VGRF (N)")
legend("VGRF","FIR Filtered VGRF")
ylim([0 2])

figure
hold on
plot(fVGRF,phVGRF)
plot(fFIRFilteredVGRF,phFIRFilteredVGRF)
hold off
title("VGRF frequency domain - Phase")
xlabel("Frequency (Hz)")
ylabel("VGRF (N)")
legend("VGRF","FIR Filtered VGRF")

figure
hold on
plot(VGRF)
plot(FIRFilteredVGRF)
hold off
title("VGRF Time Domain - Time Delay")
xlabel("Time")
ylabel("VGRF (N)")
legend("VGRF","FIR Filtered VGRF")
xlim([0 720])

figure
hold on
plot(VGRF)
plot(FIRFilteredVGRF(180:length(FIRFilteredVGRF)))
hold off
title("VGRF Time Domain - Corrected Time Delay")
xlabel("Time")
ylabel("VGRF (N)")
legend("VGRF","FIR Filtered VGRF")
xlim([0 150])