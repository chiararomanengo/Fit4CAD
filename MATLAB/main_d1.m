clc; clear; close all;

t=1;
pointcloud_file = strcat('./pointCloud/PC', int2str(t) , '.txt');
benchmark_file = strcat('./pointCloud_primitives/PC', int2str(t) , '_primitives.txt');
participant_file = strcat('./pointCloud_primitives_HT/PC', int2str(t) , '_primitives.txt');
 

%% (1) DATA LOADING AND PRE-PROCESSING

%(1.1) Data loading:
primitives_benchm = readMandatory(benchmark_file);
primitives_partic = readMandatory(participant_file);
pointcloud = readPointcloud(pointcloud_file);

%(1.2) Labels in benchmark:
% all_labels = [];
% for i=1:length(primitives_benchm)
%     all_labels = [all_labels, primitives_benchm{i}];
% end

%(1.3) Checking labels start from 1:
% all_labels = sort(unique(all_labels));
% if (all_labels(end)~=length(all_labels))
%     %É assunto che i label vadano da 1 a #labels, se partono da 0 vanno aggiustati...
%     error("Something looks wrong in here...");
% end


%(1.5) Associating a benchmark primitive to each participant's primitive 
%(not necessarily a 1-1 map!):
dictPart2Bench = zeros(size(primitives_partic));
for i=1:length(primitives_partic)
    max = 0;
    best = -1;
    for j=1:length(primitives_benchm)
        if max<length(intersect(primitives_partic{i}, primitives_benchm{j}))
            max = length(intersect(primitives_partic{i}, primitives_benchm{j}));
            best = j;
        end
    end
    dictPart2Bench(i) = best;
%     disp("Primitive " + num2str(i) + " in the participant <-> primitive " + num2str(dictPart2Bench(i)) + " in benchmark; points in common: " + num2str(max));
end
% disp (" ");


 %% (2) PERFORMANCE OF METHODS

implicit_fileP = strcat('./pointCloud_implicit_HT/PC', int2str(t) , '_implicit.txt');
implicit_fileB = strcat('./pointCloud_implicit/PC', int2str(t) , '_implicit.txt');

[patch_typeImplicitP,parametersImplicitP]=readMandatory2(implicit_fileP);

[patch_typeImplicitB,parametersImplicitB]=readMandatory2(implicit_fileB);

d_impl = zeros(1,length(primitives_benchm));

ind=[];
for i=1:length(parametersImplicitP)
    parametersImplicitP{i}=parametersImplicitP{i}/norm(parametersImplicitP{i});
    parametersImplicitB{dictPart2Bench(i)}=parametersImplicitB{dictPart2Bench(i)}/norm(parametersImplicitB{dictPart2Bench(i)});
    if dictPart2Bench(i)<=size(parametersImplicitB,2)
        if numel(parametersImplicitP{i})==numel(parametersImplicitB{dictPart2Bench(i)})
            aus1=parametersImplicitP{i};
            aus2=parametersImplicitB{dictPart2Bench(i)};
            aus=0;
            for j=1:numel(parametersImplicitP{i})
                if aus1(j)*aus2(j)<0 %&& aus1(j)>=10^(-3)
                   aus=1;
                end
            end  
            if aus==1
                parametersImplicitP{i}=-parametersImplicitP{i};
            end
            d_impl(i)=norm(parametersImplicitP{i}-parametersImplicitB{dictPart2Bench(i)},1);
        else
            ind=[ind; i];
        end
    end
end

d_impl(ind)=[];
disp('d1 Impl')
round(mean(d_impl),3)


