clear
clc
clear all

output_1(1,:) = load('out_1.txt');
output_2(1,:) = load('out_2.txt');
output_3(1,:) = load('out_3.txt');
output_4(1,:) = load('out_4.txt');

TrainingDatax1 = load('TrainingDatax1.txt');
TrainingDatax2 = load('TrainingDatax2.txt');
x1(1,:) = TrainingDatax1(:,1);
x2(1,:) = TrainingDatax2(:,1);

net = feedforwardnet(50);
net = configure(net,[x1;x2],[output_1;output_2;output_3;output_4]);
net.initFcn ='initlay';
net.trainFcn = 'trainrp';
net.layers{1}.transferFcn = 'tansig'; 
net.layers{2}.transferFcn = 'purelin';
net.layers{1}.initFcn ='initwb';
net.layers{2}.initFcn ='initwb';
net.biases{1}.initFcn = 'initzero';
net.biases{2}.initFcn = 'initzero';        %bias values between -1 to 1
net.inputweights{1}.initFcn='initzero';
net.inputweights{2}.initFcn='initzero';
net.trainParam.lr = 0.1;
net.trainParam.epochs = 10000;
net.trainParam.max_fail = 10000;
[trainInd,valInd,testInd] = divideind(1600,1:800,801:1600,801:1600);
net = train(net,[x1;x2],[output_1;output_2;output_3;output_4]);
simpleclassOutputs = sim(net,[x1;x2]);
plotconfusion([output_1;output_2;output_3;output_4],simpleclassOutputs);
[c,cm] = confusion([output_1;output_2;output_3;output_4],simpleclassOutputs);
fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
%plotroc([output_1;output_2;output_3;output_4],simpleclassOutputs);
view(net);


%Percentage Correct Classification   : 86.500000%
%Percentage Incorrect Classification : 13.500000%