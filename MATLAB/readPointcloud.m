function pointcloud = readPointcloud(file_path)

fid = fopen(file_path);
tline = fgetl(fid);
tline = fgetl(fid);
pointcloud = [];
while ischar(tline)
    
    %Split current line:
    t = split(tline, ["[", "," "]"]);
    point = [];
    for i=1:length(t)
        if ~isnan(str2double(t(i)))
            point = [point, str2double(t(i))];
        end
    end
    
    pointcloud = [pointcloud; point];
    
    %New line:
    tline = fgetl(fid);
end
fclose(fid);
end
