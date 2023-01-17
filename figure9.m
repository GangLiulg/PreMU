
%% Fig9
% please run Cal_ESMs_2.m before running this code


Model_name={'UKESM1-0-LL','MPI-ESM1-2-LR','MIROC6','IPSL-CM6A-LR','GFDL-ESM4','EC-Earth3','CanESM5','CESM2','ACCESS-ESM1-5'};

load('D:\3_20\color_libraries-master\Matlab\colorscheme.mat')%IPCC color
color1=colorscheme_RGB.temperature_11_RGB;
color2=[color1([1,2,4],:);[0.85,0.85,0.85];[0.85,0.85,0.85];color1([8,10,11],:)];
color2=flipud(color2);

clear temp1 temp2
for k=1:9
    temp1=rot90(Pre_compare_b585_126_m10_9100(:,:,k));
    temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_compare_b585_126(:,:,k)=temp2;
end

figure
ax_po(1,:)=[0.0800 0.8093 0.2347 0.162];
ax_po(2,:)=[0.400 0.8093 0.2347 0.162];
ax_po(3,:)=[0.7200 0.8093 0.2347 0.162];
ax_po(4,:)=[0.0800 0.55093 0.2347 0.162];
ax_po(5,:)=[0.400 0.55093 0.2347 0.162];
ax_po(6,:)=[0.7200 0.55093 0.2347 0.162];
ax_po(7,:)=[0.0800 0.2993 0.2347 0.162];
ax_po(8,:)=[0.400 0.2993 0.2347 0.162];
ax_po(9,:)=[0.7200 0.2993 0.2347 0.162];

name_a={'a','b','c','d','e','f','g','h','i'};


set(gcf,'unit','centimeters','position',[2,2,15,12]);
for i=1:9
axes_1=axes('position',ax_po(i,:));
  LAIC6t=Mean_Pre_compare_b585_126(:,:,i);
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_1,color2);
caxis([-20,20])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  text(-3.6,2,name_a(i),'fontweight', 'bold')
title(Model_name{i})

end
axes_10=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_10,color2)
%colorbar('Ticks',[0:0.2:1]);
%caxis([-200,200])


h1=colorbar('southoutside','ticks',[0:0.25:1],'xticklabel',[-20:10:20]);
set(h1,'position',[0.225,0.225,0.55,0.022],'fontsize',7)
h1.Label.String ='Error (%)';
