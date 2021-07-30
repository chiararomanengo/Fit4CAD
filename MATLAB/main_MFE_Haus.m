clc; clear; close all

t=1;
pointcloud_file = strcat('./pointCloud/PC', int2str(t) , '.txt');
mandatory_file = strcat('./pointCloud_primitives_HT/PC', int2str(t) , '_primitives.txt');
parametric_file = strcat('./pointCloud_parametric_HT/PC', int2str(t) , '_parametric.txt');

%%

primitives = readMandatory(mandatory_file);
pointcloud = readPointcloud(pointcloud_file);
% 
% figure
% hold on
% for i=1:length(primitives)
%     scatter3(...
%         pointcloud(primitives{i}, 1), ...
%         pointcloud(primitives{i}, 2), ...
%         pointcloud(primitives{i}, 3),'.', 'MarkerEdgeColor', randi([0, 255]/255, 1, 3));
%     
% end

xyz=pointcloud;

%%

[patch_type,parameters]=readMandatory2(parametric_file);
MFE=zeros(size(parameters,2),1);
Hausdorff=zeros(size(parameters,2),1);
Hausdorff2=zeros(size(parameters,2),1);

for i=1:size(patch_type,2)
    switch patch_type{1,i}
        case 'Plane'
            coeff=parameters{1,i};
            
            Xi=xyz(primitives{1,i},:);
            xMin=min(Xi(:,1));
            xMax=max(Xi(:,1));
            yMin=min(Xi(:,2));
            yMax=max(Xi(:,2));
            zMin=min(Xi(:,3));
            zMax=max(Xi(:,3));
            
            if abs(zMax-zMin)<0.02*abs(zMax) ||  abs(zMax-zMin)<0.9
                minU=1/coeff(1)*xMin-(coeff(4)/(coeff(5)*coeff(1)-coeff(2)*coeff(4)))*(yMin-coeff(2)/coeff(1)*xMin+(coeff(2)*coeff(7)/coeff(1))-coeff(8))-coeff(7)/coeff(1);
                maxU=1/coeff(1)*xMax-(coeff(4)/(coeff(5)*coeff(1)-coeff(2)*coeff(4)))*(yMax-coeff(2)/coeff(1)*xMax+(coeff(2)*coeff(7)/coeff(1))-coeff(8))-coeff(7)/coeff(1);
                
                minV=(coeff(1)/(coeff(5)*coeff(1)-coeff(2)*coeff(4)))*(yMin-coeff(2)/coeff(1)*xMin+coeff(2)*coeff(7)/coeff(1)-coeff(8));
                maxV=(coeff(1)/(coeff(5)*coeff(1)-coeff(2)*coeff(4)))*(yMax-coeff(2)/coeff(1)*xMax+coeff(2)*coeff(7)/coeff(1)-coeff(8));              

            else
                if abs(xMax-xMin)<0.02*abs(xMax) || abs(xMax-xMin)<0.7
                    minU=1/coeff(2)*yMin-(coeff(5)/(coeff(6)*coeff(2)-coeff(3)*coeff(5)))*(zMin-coeff(3)/coeff(2)*yMin-(coeff(3)*coeff(8)/coeff(2))-coeff(9))-coeff(8)/coeff(2);
                    maxU=1/coeff(2)*yMax-(coeff(5)/(coeff(6)*coeff(2)-coeff(3)*coeff(5)))*(zMax-coeff(3)/coeff(2)*yMax-(coeff(3)*coeff(8)/coeff(2))-coeff(9))-coeff(8)/coeff(2);
                
                    minV=(coeff(2)/(coeff(6)*coeff(2)-coeff(3)*coeff(5)))*(zMin-coeff(3)/coeff(2)*yMin-coeff(3)*coeff(8)/coeff(2)-coeff(9));
                    maxV=(coeff(2)/(coeff(6)*coeff(2)-coeff(3)*coeff(5)))*(zMax-coeff(3)/coeff(2)*yMax-coeff(3)*coeff(8)/coeff(2)-coeff(9));
                else
                    if abs(yMax-yMin)<0.02*abs(yMax) || abs(yMax-yMin)<0.8
                        minU=1/coeff(1)*xMin-(coeff(4)/(coeff(6)*coeff(1)-coeff(3)*coeff(4)))*(zMin-coeff(3)/coeff(1)*xMin+coeff(7)*coeff(3)/coeff(1)-coeff(9))-coeff(7)/coeff(1);
                        maxU=1/coeff(1)*xMax-(coeff(4)/(coeff(6)*coeff(1)-coeff(3)*coeff(4)))*(zMin-coeff(3)/coeff(1)*xMin+coeff(7)*coeff(3)/coeff(1)-coeff(9))-coeff(7)/coeff(1);
                        
                        minV=(coeff(1)/(coeff(6)*coeff(1)-coeff(3)*coeff(4)))*(zMin-coeff(3)/coeff(1)*xMin+coeff(7)*coeff(3)/coeff(1)-coeff(9));
                        maxV=(coeff(1)/(coeff(6)*coeff(1)-coeff(3)*coeff(4)))*(zMax-coeff(3)/coeff(1)*xMax+coeff(7)*coeff(3)/coeff(1)-coeff(9));
                    else
                        if coeff(2)~=0
                            minU=1/coeff(2)*yMin-(coeff(5)/(coeff(6)*coeff(2)-coeff(3)*coeff(5)))*(zMin-coeff(3)/coeff(2)*yMin-(coeff(3)*coeff(8)/coeff(2))-coeff(9))-coeff(8)/coeff(2);
                            maxU=1/coeff(2)*yMax-(coeff(5)/(coeff(6)*coeff(2)-coeff(3)*coeff(5)))*(zMax-coeff(3)/coeff(2)*yMax-(coeff(3)*coeff(8)/coeff(2))-coeff(9))-coeff(8)/coeff(2);
                            
                            minV=(coeff(2)/(coeff(6)*coeff(2)-coeff(3)*coeff(5)))*(zMin-coeff(3)/coeff(2)*yMin-coeff(3)*coeff(8)/coeff(2)-coeff(9));
                            maxV=(coeff(2)/(coeff(6)*coeff(2)-coeff(3)*coeff(5)))*(zMax-coeff(3)/coeff(2)*yMax-coeff(3)*coeff(8)/coeff(2)-coeff(9));
                        else
                            if coeff(1)~=0
                                minU=xMin/coeff(1)-(coeff(4)/coeff(1))*(yMin/coeff(5)-coeff(8)/coeff(5))-coeff(7)/coeff(1);
                                maxU=xMax/coeff(1)-(coeff(4)/coeff(1))*(yMax/coeff(5)-coeff(8)/coeff(5))-coeff(7)/coeff(1);
                                
                                minV=yMin/coeff(5)-coeff(8)/coeff(5);
                                maxV=yMax/coeff(5)-coeff(8)/coeff(5);
                            else
                                minU=zMin/coeff(3)-(coeff(6)/coeff(3))*(yMin/coeff(5)-coeff(8)/coeff(5))-coeff(9)/coeff(3);
                                maxU=zMax/coeff(6)-(coeff(6)/coeff(3))*(yMax/coeff(5)-coeff(8)/coeff(5))-coeff(9)/coeff(3);
                                
                                minV=yMin/coeff(5)-coeff(8)/coeff(5);
                                maxV=yMax/coeff(5)-coeff(8)/coeff(5);
                            end
                        end
                    end
                end
            end
            
            u=minU:(maxU-minU)/200:maxU;
            v=minV:(maxV-minV)/200:maxV;
            piano = zeros(length(u)*length(v),3);
            for s=1:length(u)
                for k=1:length(v)
                    piano( (s-1)*length(u)+k,1) = coeff(1)*u(s)+coeff(4)*v(k)+coeff(7);
                    piano( (s-1)*length(u)+k,2) = coeff(2)*u(s)+coeff(5)*v(k)+coeff(8);
                    piano( (s-1)*length(u)+k,3) = coeff(3)*u(s)+coeff(6)*v(k)+coeff(9);
                end
            end           
            
%             figure
%             hold on
%             axis equal
%             plot3(Xi(:,1),Xi(:,2),Xi(:,3),'.k')
%             plot3(piano(:,1),piano(:,2),piano(:,3),'.r')
            
            base=max(Xi(:,1))-min(Xi(:,1));
            h=max(Xi(:,2))-min(Xi(:,2));
            diag=sqrt(base^2+h^2);
            h=max(Xi(:,3))-min(Xi(:,3));
            Fin=sqrt(diag^2+h^2);
            
            [I,dist] = knnsearch(piano,Xi);
            MFE(i)=mean(dist)/Fin;
            Hausdorff(i)=HausdorffDistanceDiretta(Xi,piano);
            Hausdorff2(i)=Hausdorff(i)/Fin;
            
        case 'Cylinder'
            
            coeff=parameters{1,i};
            Xi=xyz(primitives{1,i},:);
            
            l = coeff(10:12);
            
            x = coeff(1:3);
            y = coeff(4:6);
            z = coeff(7:9);
            
            if coeff(9)==1 %&& coeff(2)==1
                v = min(Xi(:,3)):(max(Xi(:,3))-min(Xi(:,3)))/300:max(Xi(:,3));
                v=v-coeff(12);
            else
                if coeff(7)==1 %&& coeff(3)==1
                    v = min(Xi(:,1)):(max(Xi(:,1))-min(Xi(:,1)))/300:max(Xi(:,1));
                    v=v-coeff(10);
                else
                    v = min(Xi(:,2)):(max(Xi(:,2))-min(Xi(:,2)))/300:max(Xi(:,2));
                    v=v-coeff(11);
                end
            end
            u = 0:2*pi/300:2*pi;
            
            cil = zeros(length(u)*length(v),3);

            for s=1:length(u)
                for k=1:length(v)
                    cil((s-1)*length(u)+k,1) = l(1) +cos(u(s))*x(1) + sin(u(s))*y(1) + v(k)*z(1);
                    cil((s-1)*length(u)+k,2) = l(2) +cos(u(s))*x(2) + sin(u(s))*y(2) + v(k)*z(2);
                    cil((s-1)*length(u)+k,3) = l(3) +cos(u(s))*x(3) + sin(u(s))*y(3) + v(k)*z(3);
                end
            end
            
%             figure
%             hold on
%             axis equal
%             plot3(Xi(:,1),Xi(:,2),Xi(:,3),'.k')
%             plot3(cil(:,1),cil(:,2),cil(:,3),'.r')
            
            if size(Xi,1)>10^(3)
                p = randperm(size(Xi,1));
                p = p(1:size(Xi,1)/2)';
                Xi = Xi(p,:);
            end
            
            base=max(Xi(:,1))-min(Xi(:,1));
            h=max(Xi(:,2))-min(Xi(:,2));
            diag=sqrt(base^2+h^2);
            h=max(Xi(:,3))-min(Xi(:,3));
            Fin=sqrt(diag^2+h^2);
            
            [I,dist] = knnsearch(cil,Xi);
            MFE(i)=mean(dist)/Fin;
            Hausdorff(i)=HausdorffDistanceDiretta(Xi,cil);
            Hausdorff2(i)=Hausdorff(i)/Fin;
            
        case 'Cone'
            stamp=parameters{1,i};
            
            Xi=xyz(primitives{1,i},:);
            
            if stamp(7)~=0 && stamp(11)~=0
                %v = min(Xi(:,3))/stamp(15):(max(Xi(:,3))/stamp(15)-min(Xi(:,3))/stamp(15))/500:max(Xi(:,3))/stamp(15);
                maxV=(max(Xi(:,1))-stamp(16)-stamp(1))/(stamp(7)+stamp(13));
                v = min(Xi(:,3))/stamp(15):(maxV-min(Xi(:,3))/stamp(15))/300:maxV;
            else
                if stamp(7)~=0 && stamp(12)~=0
                    maxV=(max(Xi(:,1))-stamp(16)-stamp(1))/(stamp(7)+stamp(13));
                    %v = min(Xi(:,2)):(max(Xi(:,2))-min(Xi(:,2)))/300:max(Xi(:,2));
                    v = min(Xi(:,2))/stamp(14):(maxV-min(Xi(:,2))/stamp(14))/300:maxV;
                else
                   % v = min(Xi(:,1)):(max(Xi(:,1))-min(Xi(:,1)))/300:max(Xi(:,1));
                    maxV=(max(Xi(:,2))-stamp(17)-stamp(2))/(stamp(8)+stamp(14));
                    v = min(Xi(:,1))/stamp(13):(maxV-min(Xi(:,1))/stamp(13))/300:maxV;
                end
            end
            
            u = 0:2*pi/300:2*pi;
            cono = zeros(length(u)*length(v),3);

            for s=1:length(u)
                for k=1:length(v)
                    cono((s-1)*length(u)+k,1) =stamp(16) +stamp(1)*cos(u(s))+stamp(4)*sin(u(s))+stamp(7)*v(k)*cos(u(s))+stamp(10)*v(k)*sin(u(s))+v(k)*stamp(13);
                    cono((s-1)*length(u)+k,2) =stamp(17) +stamp(2)*cos(u(s))+stamp(5)*sin(u(s))+stamp(8)*v(k)*cos(u(s))+stamp(11)*v(k)*sin(u(s))+v(k)*stamp(14);
                    cono((s-1)*length(u)+k,3) =stamp(18) +stamp(3)*cos(u(s))+stamp(6)*sin(u(s))+stamp(9)*v(k)*cos(u(s))+stamp(12)*v(k)*sin(u(s))+v(k)*stamp(15);
                end
            end
            
%             figure
%             hold on
%             axis equal
%             plot3(Xi(:,1),Xi(:,2),Xi(:,3),'.k')
%             plot3(cono(:,1),cono(:,2),cono(:,3),'.r')
            
            base=max(Xi(:,1))-min(Xi(:,1));
            h=max(Xi(:,2))-min(Xi(:,2));
            diag=sqrt(base^2+h^2);
            h=max(Xi(:,3))-min(Xi(:,3));
            Fin=sqrt(diag^2+h^2);
            
            [I,dist] = knnsearch(cono,Xi);
            MFE(i)=mean(dist)/Fin;
            Hausdorff(i)=HausdorffDistanceDiretta(Xi,cono);
            Hausdorff2(i)=Hausdorff(i)/Fin;
            
        case 'Sphere'
            stamp=parameters{1,i};
            
            u = 0:2*pi/300:2*pi;
            v = 0:2*pi/300:2*pi;
            
            Xi=xyz(primitives{1,i},:);
            sfera = zeros(length(u)*length(v),3);

            for s=1:length(u)
                for k=1:length(v)
                    sfera((s-1)*length(u)+k,1) =stamp(10) +stamp(1)*cos(u(s))*cos(v(k))+stamp(4)*sin(u(s))*cos(v(k))+stamp(7)*sin(v(k));
                    sfera((s-1)*length(u)+k,2) =stamp(11) +stamp(2)*cos(u(s))*cos(v(k))+stamp(5)*sin(u(s))*cos(v(k))+stamp(8)*sin(v(k));
                    sfera((s-1)*length(u)+k,3) =stamp(12) +stamp(3)*cos(u(s))*cos(v(k))+stamp(6)*sin(u(s))*cos(v(k))+stamp(9)*sin(v(k));
                end
            end
            
%             figure
%             hold on
%             axis equal
%             plot3(Xi(:,1),Xi(:,2),Xi(:,3),'.k')
%             plot3(sfera(:,1),sfera(:,2),sfera(:,3),'.r')
            
            if size(Xi,1)>10^(3)
                p = randperm(size(Xi,1));
                p = p(1:size(Xi,1)/2)';
                Xi = Xi(p,:);
            end

            base=max(Xi(:,1))-min(Xi(:,1));
            h=max(Xi(:,2))-min(Xi(:,2));
            diag=sqrt(base^2+h^2);
            h=max(Xi(:,3))-min(Xi(:,3));
            Fin=sqrt(diag^2+h^2);
            
            [I,dist] = knnsearch(sfera,Xi);
            MFE(i)=mean(dist)/Fin;
            Hausdorff(i)=HausdorffDistanceDiretta(Xi,sfera);
            Hausdorff2(i)=Hausdorff(i)/Fin;
            
        case 'Torus'
            stamp=parameters{1,i};
            
            u = 0:2*pi/300:2*pi;
            v = 0:2*pi/300:2*pi;
            
            Xi=xyz(primitives{1,i},:);
            toro = zeros(length(u)*length(v),3);
            
            for s=1:length(u)
                for k=1:length(v)
                    toro((s-1)*length(u)+k,1) =stamp(16) +stamp(1)*cos(u(s))+stamp(4)*sin(u(s))+stamp(7)*cos(v(k))*cos(u(s))+stamp(10)*cos(v(k))*sin(u(s))+stamp(13)*sin(v(k));
                    toro((s-1)*length(u)+k,2) =stamp(17) +stamp(2)*cos(u(s))+stamp(5)*sin(u(s))+stamp(8)*cos(v(k))*cos(u(s))+stamp(11)*cos(v(k))*sin(u(s))+stamp(14)*sin(v(k));
                    toro((s-1)*length(u)+k,3) =stamp(18) +stamp(3)*cos(u(s))+stamp(6)*sin(u(s))+stamp(9)*cos(v(k))*cos(u(s))+stamp(12)*cos(v(k))*sin(u(s))+stamp(15)*sin(v(k));
                end
            end
            
%             figure
%             hold on
%             axis equal
%             plot3(Xi(:,1),Xi(:,2),Xi(:,3),'.k')
%             plot3(toro(:,1),toro(:,2),toro(:,3),'.r')
            
             base=max(Xi(:,1))-min(Xi(:,1));
            h=max(Xi(:,2))-min(Xi(:,2));
            diag=sqrt(base^2+h^2);
            h=max(Xi(:,3))-min(Xi(:,3));
            Fin=sqrt(diag^2+h^2);
            
            [I,dist] = knnsearch(toro,Xi);
            MFE(i)=mean(dist)/Fin;
            Hausdorff(i)=HausdorffDistanceDiretta(Xi,toro);
            Hausdorff2(i)=Hausdorff(i)/Fin;
        otherwise
            disp('Other!')
    end
     
end

disp('mean(MFE)')
round(mean(MFE),3)

% disp('mean(Haus)')
% mean(Hausdorff)

disp('mean(Haus)')
round(mean(Hausdorff2),3)

