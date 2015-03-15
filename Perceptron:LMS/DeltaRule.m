clc
clear               %clear the previous data from the first problem and graphing

%load data from perceptronclass training files to matricies
Delta_C1_Train = load('DeltaRuleClass1Training.txt');
Delta_C2_Train = load('DeltaRuleClass2Training.txt');

%load data from PDR class testing files to matricies
PDR_C1_Test = load('PDRClass1Testing.txt');
PDR_C2_Test = load('PDRClass2Testing.txt');

%assign variables to hold error info
Error = [];
error_1 = 0;
LMS_testing_error = [];   %empty matrix

%variables for calculations learning rate etc

v=[4,-2,1];         %vary this
i = 0;              %iterator
j = 0;              %need another itorator in for loop
counter = 0;        %counter
e = 0;              %
n = .1;             %rate
sum = 0;             %keep the running some for LMS
x1 = 0;             %store 2nd colum
x2 = 0;             %store 3rd column
x3 = 0;             %store 4th column
minimum = 1000;     %store minimum
temp_1 = 0;           
temp_2 = 0; 


%check to see if size of matricies are corect
size1 = size(Delta_C1_Train);
size2 = size(Delta_C2_Train);
size3 = size(PDR_C1_Test);
size4 = size(PDR_C2_Test);

%size check
display(size1);
display(size2);
display(size3);
display(size4);

%set size variables back to 0
size1 = 0;
size2 = 0;
size3 = 0;
size4 = 0;

%add 4th collumn full of 1s for calculations
Delta_C1_Train(:,4) = 1;
Delta_C1_Train(:,4) = 1;
PDR_C1_Test(:,4) = 1;
PDR_C2_Test(:,4) = 1;

%check to see if matricies are what I want
size1 = size(Delta_C1_Train);
size2 = size(Delta_C1_Train);
size3 = size(PDR_C1_Test);
size4 = size(PDR_C2_Test);

%display sizes for error checking
display(size1);
display(size2);
display(size3);
display(size4);

for j=1:500 
    
    x1 = 0;             %store 2nd colum
    x2 = 0;             %store 3rd column
    x3 = 0;             %store 4th column
    sum = 0;            %running sum
    
    
        for i=1:length(Delta_C1_Train)                  %iterate through class 1
            e=1-(v(end,:)*(Delta_C1_Train(i,[2,3,4])'));
            x1=x1+e*Delta_C1_Train(i,2);
            x2=x2+e*Delta_C1_Train(i,3);
            x3=x3+e*Delta_C1_Train(i,4);
            sum=sum+(e*e);
        end
    
        for i=1:length(Delta_C2_Train)                  %iterate through class 2
            e=-1-(v(end,:)*(Delta_C2_Train(i,[2,3,4])'));
            x1=x1+e*Delta_C2_Train(i,2);
            x2=x2+e*Delta_C2_Train(i,3);
            x3=x3+e*Delta_C2_Train(i,4);
            sum=sum+(e*e);
        end
        
    Error(j)=sum;                                   %note warning ok, size of Error changes with loop
    
        if j>=2                                     %make sure loop has gone at least once
            if abs(Error(j)-Error(j-1))<0.1         %break away if error is good eough
                break
            end
        end
        
   v(end+1,:)=[v(end,1)+n*2*x1,v(end,2)+n2*2*x2,v(end,3)+n*2*x3];
    
   temp_1 = 0;          %tep variavles to store info for LMS testing error        
   temp_2 = 0; 
   temp_3 = 0;

        
   for k=1:length(PercepClass2Training) 
        if v(end,:)*PDR_C1_Test(k,[2,3,4])'<0
            temp_3=temp_3+1;
            temp_1=temp_1+1;
        end  
        
        if v(end,:)*PDR_C2_Test(k,[2,3,4])'>0
            temp_3=temp_3+1;
            temp_2=temp_2+1;
        end
   end
   
   LMS_testing_error(j,1)=(temp_3/2000)*100;                %note warning ok, size of Error changes with loop
        if (LMS_testing_error(j,1)<min)
            min=LMS_testing_error(end,1); 
        end  
end 




size1 = size(LMS_testing_error);
size2 = size(Delta_C2_Train);
size3 = size(v);
%scatter plot/plot to plot functions
%svmplotsvs to plot boundary