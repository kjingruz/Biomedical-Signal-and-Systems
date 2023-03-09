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