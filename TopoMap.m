function [Topomap,distance] = TopoMap(altitude,water)
Topo = zeros(size(altitude,1),size(altitude,1),3);
for i =1:size(altitude,1)
    for j = 1:size(altitude,2)
    if(water(i,j)==1)
        Topo(i,j,3)=255;
        Topo(i,j,1:2)=0;
    elseif(altitude(i,j)<0)
        Topo(i,j,:)=0;
    elseif(altitude(i,j)>=0 &&altitude(i,j)<=1000 )
        Topo(i,j,2)=255;
        Topo(i,j,3)=0;
        Topo(i,j,1)=0;
    elseif(altitude(i,j)<=2000 &&altitude(i,j)>1000)
        Topo(i,j,1:2)=255;
        Topo(i,j,3)=0;
    elseif(altitude(i,j)<3000 && altitude(i,j)>2000)
        Topo(i,j,1)=255;
         Topo(i,j,2)=100;
         Topo(i,j,3)=0;
    elseif(altitude(i,j)<=4000 && altitude(i,j)>3000)
        Topo(i,j,1)=255;
        Topo(i,j,2:3)=0;
    elseif(altitude(i,j)>4000)
        Topo(i,j,:)=255;
    end
    
    end
end
Minalt=min(altitude(water(:,:)~=1));
Maxalt=max(altitude,[],'all');
[x1,y1]=find(altitude==Minalt)
[x2,y2]=find(altitude==Maxalt)
distance =10*sqrt(((x1-x2)^2) + ((y1-y2)^2));
Topo(x2,y2,1)=255;
Topo(x2,y2,2)=0;
Topo(x2,y2,3)=255;

Topo(x1,y1,1)=170;
Topo(x1,y1,2)=0;
Topo(x1,y1,3)=255;
Topo= uint8(Topo);
Topomap = image(Topo);
end

