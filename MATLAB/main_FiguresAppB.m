clc; clear; close all;

                      %%% FIGURES APPENDICES B %%%

% Black points are misclassified points.
% NB. All colors but black might change, as they are randomly chosen; 
% patterns should be inaltered.
% NB2. Since colors are randomic, sometimes a segment could be colored in
% black even if not misclassified. Please run the code a couple of times to
% be check whether points are actually misclassified or not.

% The parameter "model_number" takes values from 1 to 35 
% (NB. there are 35 point clouds in the test set!)
model_number = 1;   %from 1 to 35

% Choose between the HT and the PG method:
method = "PG";

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

%(1.2) Associating a benchmark primitive to each participant's primitive 
%(not necessarily a 1-1 map!):
dictBench2Part = zeros(size(primitives_benchm));
for i=1:length(primitives_benchm)
    max_inters = 0;
    best = -1;
    for j=1:length(primitives_partic)
        if max_inters<length(intersect(primitives_partic{j}, primitives_benchm{i}))
            max_inters = length(intersect(primitives_partic{j}, primitives_benchm{i}));
            best = j;
        end
    end
    dictBench2Part(i) = best;
end

% (1.3) Misclassified colors are set to black; all other colors are
% randomly chosen.
colors=zeros(size(primitives_benchm,2),3);
for i=1:size(primitives_benchm,2)
    colors(i,:) = randi([1 255],[1,3])/255;
end
color_primitives=zeros(size(primitives_partic,2),1);
for i=1:size(primitives_partic,2)
    ind=find(dictBench2Part==i);
    if numel(ind)>0
        color_primitives(i)=max(ind);
    end
end

figure
hold on
axis equal
axis off
for i=1:size(primitives_partic,2)  
    if color_primitives(i)==0
       scatter3(...
           pointcloud(primitives_partic{i},1), ...
           pointcloud(primitives_partic{i},2), ...
           pointcloud(primitives_partic{i},3),'k.');
    else
       scatter3(...
           pointcloud(primitives_partic{i},1), ...
           pointcloud(primitives_partic{i},2), ...
           pointcloud(primitives_partic{i},3),1,colors(color_primitives(i),:),'*'); 
    end

end
title ("Method " + method + ", model number " + model_number);

