%% Ciaran O'Brien - 6714221
%  Low-Thrust Trajectory Design for Satellite Mega-Constellation Deployment
%  Energy Optimal Transfer FSolver
clear
clc
close all
format longG

X_PSO = [0.130179208084042,0.321177356820258,0.002995143999867,0.631798049894216,0.339891364054469,0.912115536060091,0.745988707140902,0.612906951135930]';

[LambdaX,Lambda0] = XValues2Costate(X_PSO);

X0 = [LambdaX;Lambda0];

options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
[Cos_Opt,FVal,exitflag,output] = fsolve(@F_Solve_Function,X0(:),options);
XOpt = Cos_Opt';