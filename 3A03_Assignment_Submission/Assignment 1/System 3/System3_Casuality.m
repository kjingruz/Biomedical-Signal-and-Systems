% Code from Kevin Zhang (400319666) for Casuality 

%Test Case 1
 
%sets up the discrete steps (n) and the inputs (x)
n1 = 0:6;
x1 = [0,1,2,3,2,1,0];
 
%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n1,x1)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')
 
%inputs the inputs(x) into the system and assign it to output(y)
y1 = system3(n1,x1);
 
%Plots the output values
figure
stem(n1,y1)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')


%%

%Test Case 2

%sets up the discrete steps (n) and the inputs (x)
n2 = -5:5;
x2 = [0,4,-1,-3,-5,-2,3,1,1,1,2];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n2,x2)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y2 = system3(n2,x2);

%Plots the output values
figure
stem(n2,y2)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%%
%Test Case 3

%sets up the discrete steps (n) and the inputs (x)
n3 = -6:6;
x3 = [0, 0, 0, 0, 0, 0, 2, 1, 3, 2, 2, 2, 2];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n3,x3)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y3 = system3(n3,x3);

%Plots the output values
figure
stem(n3,y3)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')


