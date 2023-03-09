clc;
clear;

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

% Linearity Testing for System1 %
% Scaling Testing
plotScaling(positiveScalingFactor, negativeScalingFactor, impulseFunction, n, @system1, "Impulse Function", 1, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, unitStepFunction, n, @system1, "Unit Step Function", 1, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, unitRampFunction, n, @system1, "Unit Ramp Function", 1,@stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, sinusoidalFunction, n, @system1, "Sinusoidal Function", 1, @stem);

% Additivity Testing
plotAdditivity(impulseFunction, unitStepFunction, n, @system1, "Impulse Function", "Unit Step Function", 1, @stem);
plotAdditivity(unitRampFunction, sinusoidalFunction, n, @system1, "Unit Ramp Function", "Sinusoidal Function", 1, @stem);

% Linearity Testing for System2 %
% Scaling Testing
plotScaling(positiveScalingFactor, negativeScalingFactor, impulseFunction, n, @system2, "Impulse Function", 2, @stem);

% Linearity Testing for System3 %
% Scaling Testing
plotScaling(positiveScalingFactor, negativeScalingFactor, impulseFunction, n, @system3, "Impulse Function", 3, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, unitStepFunction, n, @system3, "Unit Step Function", 3, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, unitRampFunction, n, @system3, "Unit Ramp Function", 3, @stem);
plotScaling(positiveScalingFactor, negativeScalingFactor, sinusoidalFunction, n, @system3, "Sinusoidal Function", 3, @stem);

% Additivity Testing
plotAdditivity(impulseFunction, unitStepFunction, n, @system3, "Impulse Function", "Unit Step Function", 3,@stem);
plotAdditivity(unitRampFunction, sinusoidalFunction, n, @system3, "Unit Ramp Function", "Sinusoidal Function", 3, @stem);
