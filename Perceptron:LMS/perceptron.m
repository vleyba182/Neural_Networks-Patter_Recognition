%load data from perceptronclass training files to matricies
Per_C1_Train = load('PercepClass1Training.txt');
Per_C2_Train = load('PercepClass2Training.txt');

%load data from PDR class testing files to matricies
PDR_C1_Test = load('PDRClass1Testing.txt');
PDR_C2_Test = load('PDRClass2Testing.txt');

%assign variables to fold error info
error_1 = 1111;     %set to arbitrary value for now  DONE
perceptron_training_error = [];       %empty matrix, filled later on
perceptron_testing_error = [];
error_3 = 0;
total_error = [];   %empty matrix

%variables for calculations learning rate etc

v=[1,1,1];         %vary this
i = 0;              %iterator
counter =   0;        %counter
n = .1;             %rate
x1 = 0;             %store 2nd colum
x2 = 0;             %store 3rd column
x3 = 0;             %store 4th column
temp_1 = 0;
temp_2 = 0;

%check to see if size of matricies are corect
size1 = size(Per_C1_Train);
size2 = size(Per_C2_Train);
size3 = size(PDR_C1_Test);
size4 = size(PDR_C2_Test);

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
Per_C1_Train(:,4) = 1;
Per_C2_Train(:,4) = 1;
PDR_C1_Test(:,4) = 1;
PDR_C2_Test(:,4) = 1;

%check to see if matricies are what I want
size1 = size(Per_C1_Train);
size2 = size(Per_C2_Train);
size3 = size(PDR_C1_Test);
size4 = size(PDR_C2_Test);

%display sizes for error checking
display(size1);
display(size2);
display(size3);
display(size4);

Per_C2_Train(:,[2,3,4]) = -1 * Per_C2_Train(:,[2,3,4]); %negate class 2

while error_1~=0             %continue until error is !=0
    counter = counter + 1;   %increase counter
    error_1 = 0;         
    x1 = 0;                  %store 2nd colum
    x2 = 0;                  %store 3rd column
    x3 = 0;                  %store 4th column
    
    for i=1:length(Per_C2_Train)            %iterate through legnth of file
        
        if v(end,:)*Per_C1_Train(i,[2,3,4])'<0          %do math
            x1=x1+Per_C1_Train(i,2);
            x2=x2+Per_C1_Train(i,3);
            x3=x3+Per_C1_Train(i,4);
            error_1 = error_1 + 1;
        end
        
        if v(end,:)*Per_C2_Train(i,[2,3,4])'<0          %do the same thing for class2
            x1=x1+Per_C2_Train(i,2);
            x2=x2+Per_C2_Train(i,3);
            x3=x3+Per_C2_Train(i,4);
            error_1 = error_1 + 1;
        end 
    end
    
    v(end+1,:)=[v(end,1)+n*x1,v(end,2)+n*x2,v(end,3)+n*x3];
    perceptron_training_error(end+1)=error_1;
       
    for i=1:length(PercepClass2Training)                                %test
        
        if a(end,:)*PDRClass1Testing(i,[2,3,4])'<0
            error_3=error_3+1;
            temp_1=temp_1+1;
        end 
        
        if a(end,:)*PDRClass2Testing(i,[2,3,4])'>0
            error_3=error_3+1;
            temp_2=temp_2+1;
        end
      perceptron_testing_error(counter,1)=(error_3/2000)*100;           %calculate test error
    end
end

%scatter plot/plot to plot functions
%svmplotsvs to plot boundary

