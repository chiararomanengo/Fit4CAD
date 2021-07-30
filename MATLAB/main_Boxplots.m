clc; clear; close all;

                       %%% BOXPLOTS FIG. 9 AND 10 %%%
                         %%% Check Section 4.3 %%%


%% INPUT DATA        

M1 = [0.370 0.987 0.693 0.989 0.332 0.985 0.968 0.998 0.696 0.995 0.706 0.995];
M2 = [0.599 0.829 0.807 0.890 0.568 0.812 0.995 0.997 0.913 0.964 0.911 0.963];
M3 = [0.843 0.896 0.778 0.828 0.943 0.986 0.994 0.996 0.998 1.000 0.992 0.999];
M4 = [0.736 0.840 0.831 0.981 0.729 0.800 0.993 0.999 0.964 0.972 0.960 0.973];
M5 = [0.480 0.839 0.665 0.872 0.544 0.901 0.990 0.999 0.925 0.978 0.918 0.978];
M6 = [0.465 0.783 0.671 0.857 0.466 0.772 0.994 0.999 0.968 0.997 0.964 0.996];
M7 = [0.465 0.923 0.642 0.871 0.429 0.994 0.993 0.999 0.978 1.000 0.972 0.999];
M8 = [0.390 0.890 0.528 0.896 0.438 0.889 0.984 0.997 0.930 0.998 0.916 0.996];
M9 = [0.403 0.568 0.607 0.848 0.335 0.456 0.998 0.999 0.993 0.996 0.991 0.995];
M10 = [0.627 0.919 0.793 0.926 0.555 0.938 0.988 0.995 0.949 0.996 0.943 0.993];
M11 = [0.705 0.805 0.874 0.959 0.677 0.770 0.993 0.998 0.937 0.973 0.934 0.973];
M12 = [0.894 0.998 0.852 0.997 0.982 1.000 0.984 0.999 0.994 1.000 0.981 0.999];
M13 = [0.582 0.800 0.792 0.991 0.576 0.761 0.993 1.000 0.951 0.983 0.946 0.984];
M14 = [0.623 0.963 0.836 0.997 0.606 0.933 0.987 0.999 0.878 0.990 0.878 0.991];
M15 = [0.533 0.941 0.615 0.972 0.566 0.933 0.981 0.999 0.951 0.993 0.937 0.992];
M16 = [0.533 0.848 0.615 0.842 0.566 0.891 0.981 0.999 0.951 0.994 0.937 0.993];
M17 = [0.916 0.935 0.859 0.889 0.983 0.996 0.997 0.998 1.000 1.000 0.997 0.998];
M18 = [0.555 0.933 0.847 0.912 0.536 0.978 0.994 0.999 0.898 0.999 0.896 0.998];
M19 = [0.751 0.747 0.869 0.967 0.747 0.681 0.990 0.998 0.971 0.960 0.963 0.960];
M20 = [0.525 0.954 0.789 0.917 0.467 1.000 0.991 0.999 0.916 1.000 0.914 0.999];
M21 = [0.677 0.985 0.891 0.983 0.588 0.988 0.977 0.997 0.834 0.998 0.845 0.996];
M22 = [0.561 0.967 0.751 0.949 0.586 0.987 0.994 1.000 0.824 1.000 0.822 0.999];
M23 = [0.721 0.886 0.699 0.878 0.828 0.930 0.985 0.997 0.987 0.991 0.975 0.989];
M24 = [0.742 0.916 0.795 0.861 0.750 0.999 0.995 0.997 0.992 1.000 0.987 0.998];
M25 = [0.677 0.873 0.841 0.862 0.665 0.921 0.997 0.998 0.986 0.998 0.984 0.996];
M26 = [0.663 0.975 0.762 0.953 0.607 1.000 0.988 0.999 0.965 1.000 0.956 0.999];
M27 = [0.789 0.994 0.860 0.995 0.751 0.993 0.988 1.000 0.971 0.999 0.963 0.999];
M28 = [0.589 0.983 0.776 0.975 0.551 0.993 0.996 0.999 0.963 0.999 0.960 0.999];
M29 = [0.785 0.991 0.852 1.000 0.758 0.983 0.992 1.000 0.985 0.998 0.980 0.999];
M30 = [0.468 0.873 0.666 0.873 0.421 0.887 0.974 0.995 0.863 0.978 0.855 0.974];
M31 = [0.729 0.869 0.813 0.906 0.758 0.887 0.992 0.995 0.980 0.991 0.972 0.986];
M32 = [0.682 0.972 0.853 0.948 0.749 1.000 0.994 0.998 0.992 1.000 0.987 0.998];
M33 = [0.811 0.978 0.875 0.983 0.819 0.974 0.910 0.983 0.948 0.997 0.901 0.988];
M34 = [0.788 0.939 0.823 0.892 0.806 0.998 0.994 0.998 0.979 0.999 0.976 0.998];
M35 = [0.946 0.975 0.936 0.958 0.970 0.999 0.989 1.000 0.997 0.999 0.990 0.995];

M = [M1; M2; M3; M4; M5; M6; M7; M8; M9; M10; M11; M12; M13; M14; M15; M16; M17; M18; M19; M20; M21; M22; M23; M24; M25; M26; M27; M28; M29; M30; M31; M32; M33; M34; M35];

DSC_PG = M(:,1);
DSC_HT = M(:,2);
PPV_PG = M(:,3);
PPV_HT = M(:,4);
TPR_PG = M(:,5);
TPR_HT = M(:,6);
TNR_PG = M(:,7);
TNR_HT = M(:,8);
NPV_PG = M(:,9);
NPV_HT = M(:,10);
ACC_PG = M(:,11);
ACC_HT = M(:,12);


group = [ones(size(DSC_PG)); 2 * ones(size(DSC_HT)); ...
    3 * ones(size(PPV_PG)); 4 * ones(size(PPV_HT)); ...
    5 * ones(size(TPR_PG)); 6 * ones(size(TPR_HT)); ...
    7 * ones(size(TNR_PG)); 8 * ones(size(TNR_HT)); ...
    9 * ones(size(NPV_PG)); 10 * ones(size(NPV_HT)); ...
    11 * ones(size(ACC_PG)); 12 * ones(size(ACC_HT))];
h = boxplot([DSC_PG; DSC_HT; PPV_PG; PPV_HT; TPR_PG; TPR_HT; TNR_PG; TNR_HT; NPV_PG; NPV_HT; ACC_PG; ACC_HT], group, 'Labels', {'DSC PG','DSC HT', 'PPV PG','PPV HT', 'TPR PG', 'TPR HT', 'TNR PG', 'TNR HT', 'NPV PG', 'NPV HT', 'ACC PG', 'ACC HT'});
ylim([0 1.1])

colors = load("boxplot_colors.txt");

h = findobj(gca,'Tag','Box'); 
for j=1:length(h) 
patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end 

xtickangle(45)
set(gcf,'Position',[100 100 1000 250])
title("Figure 9");





%% MISSING DATA
M0 = M(setdiff(1:35,[15, 19, 22, 30, 32]), :); % no missing data
M1 = M([15, 19, 22, 30, 32], :); %missing data

DSC_PG_NOMD = M0(:,1);
DSC_HT_NOMD = M0(:,2);
PPV_PG_NOMD = M0(:,3);
PPV_HT_NOMD = M0(:,4);
TPR_PG_NOMD = M0(:,5);
TPR_HT_NOMD = M0(:,6);
TNR_PG_NOMD = M0(:,7);
TNR_HT_NOMD = M0(:,8);
NPV_PG_NOMD = M0(:,9);
NPV_HT_NOMD = M0(:,10);
ACC_PG_NOMD = M0(:,11);
ACC_HT_NOMD = M0(:,12);
DSC_PG_MD = M1(:,1);
DSC_HT_MD = M1(:,2);
PPV_PG_MD = M1(:,3);
PPV_HT_MD = M1(:,4);
TPR_PG_MD = M1(:,5);
TPR_HT_MD = M1(:,6);
TNR_PG_MD = M1(:,7);
TNR_HT_MD = M1(:,8);
NPV_PG_MD = M1(:,9);
NPV_HT_MD = M1(:,10);
ACC_PG_MD = M1(:,11);
ACC_HT_MD = M1(:,12);


figure
group = [ones(size(DSC_PG_NOMD)); 2 * ones(size(DSC_PG_MD)); ...
    3 * ones(size(PPV_PG_NOMD)); 4 * ones(size(PPV_PG_MD)); ...
    5 * ones(size(TPR_PG_NOMD)); 6 * ones(size(TPR_PG_MD)); ...
    7 * ones(size(TNR_PG_NOMD)); 8 * ones(size(TNR_PG_MD)); ...
    9 * ones(size(NPV_PG_NOMD)); 10 * ones(size(NPV_PG_MD)); ...
    11 * ones(size(ACC_PG_NOMD)); 12 * ones(size(ACC_PG_MD))];
h = boxplot([DSC_PG_NOMD; DSC_PG_MD; PPV_PG_NOMD; PPV_PG_MD; TPR_PG_NOMD; TPR_PG_MD; TNR_PG_NOMD; TNR_PG_MD; NPV_PG_NOMD; NPV_PG_MD; ACC_PG_NOMD; ACC_PG_MD], group, 'Labels', {'DSC, complete','DSC, missing data', 'PPV, complete','PPV, missing data', 'TPR, complete', 'TPR, missing data', 'TNR, complete', 'TNR, missing data', 'NPV, complete', 'NPV, missing data', 'ACC, complete', 'ACC, missing data'});
ylim([0 1.1])
%color = [([0.55 0.71 0]); ([0.55 0.71 0]); ([1 0.5 0]); ([1 0.5 0]); ([0.4 0.4 0.5]); ([0.4 0.4 0.5]); ([0.6 0.8 1]); ([0.6 0.8 1]); ([0.78 0.26 0.46]); ([0.78 0.26 0.46]); ([1.00 0.00 0.00]); ([1.00 0.00 0.00]);]; 

% colors = rand(6, 3);
% Colors = zeros(12,3);
% Colors(1:2:12,:) = colors;
% Colors(2:2:12,:) = colors;
% colors = Colors;
% clear Colors
colors = load("boxplot_colors.txt");

h = findobj(gca,'Tag','Box'); 
for j=1:length(h) 
patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end 

xtickangle(45)
set(gcf,'Position',[100 100 1000 250])
title ("PG-based method (figure 10)")




figure
group = [ones(size(DSC_HT_NOMD)); 2 * ones(size(DSC_HT_MD)); ...
    3 * ones(size(PPV_HT_NOMD)); 4 * ones(size(PPV_HT_MD)); ...
    5 * ones(size(TPR_HT_NOMD)); 6 * ones(size(TPR_HT_MD)); ...
    7 * ones(size(TNR_HT_NOMD)); 8 * ones(size(TNR_HT_MD)); ...
    9 * ones(size(NPV_HT_NOMD)); 10 * ones(size(NPV_HT_MD)); ...
    11 * ones(size(ACC_HT_NOMD)); 12 * ones(size(ACC_HT_MD))];
h = boxplot([DSC_HT_NOMD; DSC_HT_MD; PPV_HT_NOMD; PPV_HT_MD; TPR_HT_NOMD; TPR_HT_MD; TNR_HT_NOMD; TNR_HT_MD; NPV_HT_NOMD; NPV_HT_MD; ACC_HT_NOMD; ACC_HT_MD], group, 'Labels', {'DSC, complete','DSC, missing data', 'PPV, complete','PPV, missing data', 'TPR, complete', 'TPR, missing data', 'TNR, complete', 'TNR, missing data', 'NPV, complete', 'NPV, missing data', 'ACC, complete', 'ACC, missing data'});
ylim([0 1.1])
%color = [([0.55 0.71 0]); ([0.55 0.71 0]); ([1 0.5 0]); ([1 0.5 0]); ([0.4 0.4 0.5]); ([0.4 0.4 0.5]); ([0.6 0.8 1]); ([0.6 0.8 1]); ([0.78 0.26 0.46]); ([0.78 0.26 0.46]); ([1.00 0.00 0.00]); ([1.00 0.00 0.00]);]; 

% colors = rand(6, 3);
% Colors = zeros(12,3);
% Colors(1:2:12,:) = colors;
% Colors(2:2:12,:) = colors;
% colors = Colors;
% clear Colors
colors = load("boxplot_colors.txt");

h = findobj(gca,'Tag','Box'); 
for j=1:length(h) 
patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end 

xtickangle(45)
set(gcf,'Position',[100 100 1000 250])
title ("HT-based method (figure 10)")
