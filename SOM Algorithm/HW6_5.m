clear;
clc;
clear all;

load('combined.txt');        %Read in training Data
x = combined;                %Assing training data varialbe to x
x1(1,:) = x(:,1);                %need to format data for two input system
x2(1,:) = x(:,2);
x = [x1;x2];                     %input into the system
M = [8 8]                      %M x M Output
sigma = 5;                      %sigma value
N = 800                        %Number of Drawings
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