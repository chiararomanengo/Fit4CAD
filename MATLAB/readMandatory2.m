function [primitive_type, primitives] = readMandatory(file_path)

%% (1) Number of primitives
fid = fopen(file_path);
tline = fgetl(fid);

num_primitives = 0;
primitive_type = {};

while ischar(tline)
    
    %Check for new primitive:
    if contains(tline, 'Primitive')
        
        %Update number of primitives:
        num_primitives = num_primitives + 1;
        
        %Primitive type:
        if contains(tline, "Plane")
            primitive_type{num_primitives} = "Plane";
        elseif contains(tline, "Cylinder")
            primitive_type{num_primitives} = "Cylinder";
        elseif contains(tline, "Cone")
            primitive_type{num_primitives} = "Cone";
        elseif contains(tline, "Torus")
            primitive_type{num_primitives} = "Torus";
        elseif contains(tline, "Sphere")
            primitive_type{num_primitives} = "Sphere";
        elseif contains(tline, "Other")
            primitive_type{num_primitives} = "Other";
        end
    end
    
    %New line:
    tline = fgetl(fid);
end
fclose(fid);
clear t tline

%% (2) Reading primitives
primitives = cell(1, num_primitives);
n = 1;  %number of current primitive

fid = fopen(file_path);
tline = fgetl(fid);

labels = [];

while ischar(tline)
    
    %Split current line:
    t = split(tline, ["[", " " "]"]);
    for i=1:length(t)
        labels = [labels, str2num(t{i})];
    end
    
    %If the primitive ends, re-initialize and increase indices...
    if contains(tline, '];')
        primitives{n} = labels;
        n = n+1;
        labels = [];
    end
    
    %New line:
    tline = fgetl(fid);
end
fclose(fid);
clear t tline
end