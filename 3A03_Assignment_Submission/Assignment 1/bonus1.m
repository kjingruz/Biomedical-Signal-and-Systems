clc;
clear;

load("ECG.mat");
load("VerticalGroundReactionForce.mat");
n = 0:4999;

% System1 Linearity Testing With Physiological Signals
plotScaling(41,-12,ECG,n,@system1,"ECG Data",1,@plot);
plotScaling(41,-12,VerticalGroundReactionForce,n,@system1,"VGRF Data",1,@plot);
plotAdditivity(ECG,VerticalGroundReactionForce,n,@system1,"ECG Data","VGRF Data",1,@plot);

% System2 Linearity Testing With Physiological Signals
plotScaling(41,-12,ECG,n,@system2,"ECG Data",2,@plot);

% System3 Linearity Testing With Physiological Signals
plotScaling(41,-12,ECG,n,@system3,"ECG Data",3,@plot);
plotScaling(41,-12,VerticalGroundReactionForce,n,@system3,"VGRF Data",3,@plot);
plotAdditivity(ECG,VerticalGroundReactionForce,n,@system3,"ECG Data","VGRF Data",3,@plot);