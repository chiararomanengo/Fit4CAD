clc; clear; close all;

                      %%% CLASSIFICATION MEASURES %%%
                      %%% Check Section 3.3.1 %%%

% The parameter "model_number" takes values from 1 to 35 
% (NB. there are 35 point clouds in the test set!)
model_number = 1;   %from 1 to 35

% Choose between the HT and the PG method:
method = "PG";

% Do you want to print the classification measures for each primitive?
% Default is 0 (only the averaged measures are returned).
details = 0;


%% (1) DATA LOADING AND PRE-PROCESSING

pointcloud_file = "./pointCloud/PC" + ...
    num2str(model_number) + ".txt";
benchmark_file = "./pointCloud_primitives/PC" + ...
    num2str(model_number) + "_primitives.txt";
participant_file = "./pointCloud_primitives_" + method + "/PC" + ...
    num2str(model_number) + "_primitives.txt";

%(1.1) Data loading:
primitives_benchm = readMandatory(benchmark_file);
primitives_partic = readMandatory(participant_file);
pointcloud = readPointcloud(pointcloud_file);

disp("MODEL " + num2str(model_number) + " IN THE TEST SET");
disp("Number of points is " + num2str(size(pointcloud,1)));
disp("Number of true primitives is " + num2str(length(primitives_benchm)));
disp("Number of predicted primitives is " + num2str(length(primitives_partic)));
disp(" ");

%(1.2) Labels in benchmark:
all_labels = [];
for i=1:length(primitives_benchm)
    all_labels = [all_labels, primitives_benchm{i}];
end
all_labels = sort(unique(all_labels));

%(1.3) Associating a benchmark primitive to each participant's primitive 
%(not necessarily a 1-1 map!):
dictBench2Part = zeros(size(primitives_benchm));
if details
    disp("For each predicted primitive, we associate the most overlapping" + ...
        "benchmark primitive:")
end
for i=1:length(primitives_benchm)
    max = 0;
    best = -1;
    for j=1:length(primitives_partic)
        if max<length(intersect(primitives_partic{j}, primitives_benchm{i}))
            max = length(intersect(primitives_partic{j}, primitives_benchm{i}));
            best = j;
        end
    end
    dictBench2Part(i) = best;
    if details
        disp("Primitive " + num2str(i) + " in the benchmark <-> primitive " + num2str(dictBench2Part(i)) + " in participant's; points in common: " + num2str(max));
    end
end

if details
    disp (" ");
end


%% (2) PERFORMANCE OF METHODS
sd = zeros(1,length(primitives_benchm));
prec = zeros(1,length(primitives_benchm));
rec = zeros(1,length(primitives_benchm));
spec = zeros(1,length(primitives_benchm));
ppv = zeros(1,length(primitives_benchm));
npv = zeros(1,length(primitives_benchm));
acc = zeros(1,length(primitives_benchm));
for i=1:length(primitives_benchm)
    
    %Sørensen-Dice index for patch participant patch number i:
    sd(i) = SorensenDice(primitives_benchm{i}, primitives_partic{dictBench2Part(i)});
    
    %Precision-recall, F1, specificity for patch participant patch number i:
    [prec(i), rec(i), spec(i), npv(i), acc(i)]= some_statistics(primitives_benchm{i}, primitives_partic{dictBench2Part(i)}, all_labels);
    
    if details
        disp("Primitive " + num2str(i) + " provided by the participant");
        disp("Sørensen-Dice index (or F1 score) = " + num2str(sd(i)));
        disp("Precision (or PPV) = " + num2str(prec(i)));
        disp("Recall (or sensitivity) = " + num2str(rec(i)));
        disp("Specificity = " + num2str(spec(i)));
        disp("NPV = " + num2str(npv(i)));
        disp("ACC = " + num2str(acc(i)));
        disp(" ");
    end
end

disp("AVERAGE CLASSIFICATION MEASURES");
disp("Sørensen-Dice index (or F1 score) = " + num2str(mean(sd)));
disp("Precision (or PPV) = " + num2str(mean(prec)));
disp("Recall (or sensitivity or TPR) = " + num2str(mean(rec)));
disp("Specificity (or TNR) = " + num2str(mean(spec)));
disp("NPV = " + num2str(mean(npv)));
disp("ACC = " + num2str(mean(acc)));
