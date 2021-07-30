# Fit4CAD: A point cloud benchmark for fitting simple geometric primitives in CAD models

This folder gathers all the MATLAB files used for the evaluation of the methods in [1]. Note that small differences may appear (in the order of at most 10<sup>-3</sup>).

### TABLE 2
Values provided in Table 2 are obtained by the script "main_ClassificationMeasures.m". One needs to set the following parameters:
* model_number: it identifies one of the 35 point clouds from the test set (integer from 1 to 35).
* method: one of the two methods considered in the benchmark (either "PG" or "HT"); 
Optionally, one can check the classification measures for any patch by setting details to 1 (default value is 0).

###  FIGURES 9 AND 10
Boxplots are produced by using "main_Boxplots.m". There are no parameters to be set.

### TABLE 3
To evaluate the approximation accuracy:
* The MFE and the Hausdorff distance are produced by the script "main_MFE_Haus.m". It needs the files: 
    - "PCt.txt" in the folder "pointCloud"; 
    - "PCt_primitives.txt" in the folder "pointCloud_primitives_HT"; 
    - "PCt_parametric.txt" in the folder "pointCloud_parametric_HT". 
    You have to choose the value of the variable "t" to select the point cloud and the corresponding files.
* The parameter distances are produced by the script "main_d1.m". It needs the files: 
    - "PCt" in the folder "pointCloud"; 
    - "PCt_primitives.txt" in the folder "pointCloud_primitives"; 
    - "PCt_primitives.txt" in the box "pointCloud_primitives_HT"; 
    - "PCt_implicit.txt" in the folder "pointCloud_implicit"; 
    - "PCt_implicit.txt" in the folder "pointCloud_primitives_HT". 
    You have to choose the value of the variable "t" to select the point cloud PCt and the corresponding files.

### APPENDIX B
One needs to use the script "main_FiguresAppB.m". The following parameters are to be set:
* model_number: it identifies one of the 35 point clouds from the test set (integer from 1 to 35).
* method: one of the two methods considered in the benchmark (either "PG" or "HT"); 
Note that black identifies misclassified points, while other colours are randomly chosen from the file "boxplot_colors.txt". Please read the description at the beginning of the Matlab file for further details.


## References

[1] Romanengo, C, Raffo, A, Qie, Y, Anwer, N, Falcidieno, B. Fit4CAD: A point cloud benchmark for fitting simple geometric primitives in CAD models. CoRR 2021;URL: https://arxiv.org/abs/2105.06858.
