function primitives = readMandatory(file_path)

%% (1) Number of primitives
fid = fopen(file_path);
tline = fgetl(fid);
while ischar(tline)
    
    %Check for new primitive:
    if contains(tline, 'Primitive')
        t = split(tline, [":", "e"]);
        num_primitives = str2num(t{2});
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