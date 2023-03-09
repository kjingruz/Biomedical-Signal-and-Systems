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
plotScaling(41,-12,VerticalGroundReactionForce,n,@system2,"VGRF Data",2,@plot);

% System3 Linearity Testing With Physiological Signals
plotScaling(41,-12,ECG,n,@system3,"ECG Data",3,@plot);
plotScaling(41,-12,VerticalGroundReactionForce,n,@system3,"VGRF Data",3,@plot);
plotAdditivity(ECG,VerticalGroundReactionForce,n,@system3,"ECG Data","VGRF Data",3,@plot);

%% Helper functions for checking linearity
function [comboFun, comboResp, respToComboFun] = plotAdditivity(inpFun1, inpFun2, n, system, inpFun1Name, inpFun2Name, systemNum, plotFun)
    % Sum of input functions: x1[n] + x2[n]
    comboFun = inpFun1 + inpFun2;

    % Sum of individual responses to input functions: y[x1[n]] + y[x2[n]]
    comboResp = system(n,inpFun1) + system(n,inpFun2);

    % Response to sum of input functions: y[x1[n] + x2[n]]
    respToComboFun = system(n,comboFun);

    % graphing impulse/unit step comination function, actual output, and expected output
    InputFunctionsCombination = figure;
    tiledlayout(3,1);

    nexttile
    plotFun(n,comboFun);
    title("Input: " + inpFun1Name + "/" + inpFun2Name + " Comination")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("x1[n]+x2[n]")
    grid("on")

    nexttile
    plotFun(n,respToComboFun);
    title("Actual Output: Response to " + inpFun1Name + "/" + inpFun2Name + " Comination")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[x1[n]+x2[n]")
    grid("on")

    nexttile
    plotFun(n,comboResp);
    title("Expected Output: " + inpFun1Name + "+" + inpFun2Name)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[x1[n]] + y[x2[n]]")
    grid("on")
end

function [posScaledInpFun, negScaledInpFun, resp, posScaledResp, negScaledResp, respToPosScaledInpFun, respToNegScaledInpFun] = plotScaling(posScalingFactor, negScalingFactor, inpFun, n, system, inpFunName, systemNum, plotFun)
    % Scaled input functions: a*x[n]
    posScaledInpFun = posScalingFactor * inpFun;
    negScaledInpFun = negScalingFactor * inpFun;
    
    % Response to original input function: y[x[n]]
    resp = system(n,inpFun);
    
    % Scaled response of original function a*y[x[n]]
    posScaledResp = posScalingFactor * resp;
    negScaledResp = negScalingFactor * resp;
    
    % Response to scaled input function: y[a*x[n]]
    respToPosScaledInpFun = system(n,posScaledInpFun);
    respToNegScaledInpFun = system(n,negScaledInpFun);

    % graphing input function and its response
    BasicInputFunction = figure;
    tiledlayout(2,1);

    nexttile
    plotFun(n,inpFun);
    title("Input: " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("x[n]")
    grid("on")

    nexttile
    plotFun(n,resp);
    title("Output: " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[x[n]]")
    grid("on")

    % graphing positively scaled input function, actual output, and expected output
    PositiveScaledInputFunction = figure;
    tiledlayout(3,1);

    nexttile
    plotFun(n,posScaledInpFun);
    title("Input: Positive Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("a*x[n]")
    grid("on")

    nexttile
    plotFun(n,respToPosScaledInpFun);
    title("Actual Output: Response to Positive Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[a*x[n]]")
    grid("on")

    nexttile
    plotFun(n,posScaledResp);
    title("Expected Output: Positive Scaled " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("a*y[x[n]]")
    grid("on")

    % graphing negatively scaled impulse function, actual output, and expected output
    NegativeScaledInputFunction = figure;
    tiledlayout(3,1);

    nexttile
    plotFun(n,negScaledInpFun);
    title("Input: Negative Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("-a*x[n]")
    grid("on")

    nexttile
    plotFun(n,respToNegScaledInpFun);
    title("Actual Output: Response to Negative Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[-a*x[n]]")
    grid("on")
    
    nexttile
    plotFun(n,negScaledResp);
    title("Expected Output: Negative Scaled " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("-a*y[x[n]]")
    grid("on")
end