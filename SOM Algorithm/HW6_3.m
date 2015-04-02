clear;
clc;
clear all;

load('TrainingData.txt');        %Read in training Data
x = TrainingData;                %Assing training data varialbe to x
x1(1,:) = x(:,1);                %need to format data for two input system
x2(1,:) = x(:,2);
x = [x1;x2];                     %input into the system
M = [8 8]                      %M x M Output
sigma = 100;                      %sigma value
N = 5000                        %Number of Drawings
net = selforgmap(M, N,sigma)
net = train(net,x)              %Now train the network 
view(net)
y = net(x);                      %show the network
plotsomtop(net);
hold
plotsomnc(net);
hold 
plotsomnd(net);
hold
plotsomplanes(net);
hold 
plotsomhits(net);
hold
plotsompos(net);
hold
%classes = vec2ind(y);            