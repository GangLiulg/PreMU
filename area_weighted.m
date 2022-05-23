function [ S ]=area_weighted(xx,yy)
R=6378.1*1000;
S=nan(xx,yy);
for x=1:xx
    lat2=90-(x-1)*(180/xx);
    lat1=90-x*(180/xx);
    a2=lat2*pi/180;
    a1=lat1*pi/180;
    S(x,:)=repmat(R*R*((360/yy)*pi/180)*(sin(a2)-sin(a1)),1,yy);
    clear lat2 lat1 a2 a2
end
end
