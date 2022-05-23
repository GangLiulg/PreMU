%% Fig8
% please run Cal_ESMs_2.m before running this code

Pre_b585_126_m10_change=squeeze(mean(Pre_rec_b585_126_m10(:,:,673:1032,:)-Pre_rec_b585_126_m10(:,:,1:12*30,:),3));
Pre_b585_245_m10_change=squeeze(mean(Pre_rec_b585_245_m10(:,:,673:1032,:)-Pre_rec_b585_245_m10(:,:,1:12*30,:),3));
Pre_b585_370_m10_change=squeeze(mean(Pre_rec_b585_370_m10(:,:,673:1032,:)-Pre_rec_b585_370_m10(:,:,1:12*30,:),3));
Pre_b585_585_m10_change=squeeze(mean(Pre_rec_b585_585_m10(:,:,673:1032,:)-Pre_rec_b585_585_m10(:,:,1:12*30,:),3));

Pre_126_change=squeeze(mean(Pre_126(:,:,673:1032,:)-Pre_126(:,:,1:12*30,:),3)*12);
Pre_245_change=squeeze(mean(Pre_245(:,:,673:1032,:)-Pre_245(:,:,1:12*30,:),3)*12);
Pre_370_change=squeeze(mean(Pre_370(:,:,673:1032,:)-Pre_370(:,:,1:12*30,:),3)*12);
Pre_585_change=squeeze(mean(Pre_585(:,:,673:1032,:)-Pre_585(:,:,1:12*30,:),3)*12);
load('D:\3_20\color_libraries-master\Matlab\colorscheme.mat')

color_1=cbrewer('seq','PuBu',8);
%color1=cbrewer('div','Spectral',10);
%color2=[color1([1,3,5],:);[0.8,0.8,0.8];[0.8,0.8,0.8];color1([6,8,10],:)];
color2=colorscheme_RGB.precipitation_8_RGB;

clear temp2
temp1=rot90(mean(Pre_b585_126_m10_change*12,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_b585_126_change=temp2;

temp1=rot90(mean(Pre_b585_245_m10_change*12,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_b585_245_change=temp2;


temp1=rot90(mean(Pre_b585_370_m10_change*12,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_b585_370_change=temp2;

temp1=rot90(mean(Pre_b585_585_m10_change*12,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_b585_585_change=temp2;

temp1=rot90(mean(Pre_126_change,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_126_change=temp2;

temp1=rot90(mean(Pre_245_change,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_245_change=temp2;

temp1=rot90(mean(Pre_370_change,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_370_change=temp2;

temp1=rot90(mean(Pre_585_change,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_585_change=temp2;

%color_1=cbrewer('seq','PuBu',8);
%color1=cbrewer('div','Spectral',10);
%color2=[color1([1,3,5],:);[0.8,0.8,0.8];[0.8,0.8,0.8];color1([6,8,10],:)];

figure
time1=2015:2100;
set(gcf,'unit','centimeters','position',[2,2,15,15]);
axes_1=axes('position',[0.1300 0.8093 0.3347 0.162]);
  LAIC6t=Mean_Pre_585_change;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_1,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置



  
  axes_2=axes('position',[0.5800 0.8093 0.3347 0.162]);
   LAIC6t=Mean_Pre_b585_585_change;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_2,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  
axes_3=axes('position',[0.1300 0.5793 0.3347 0.162]);
  LAIC6t=Mean_Pre_126_change;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_3,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  axes_4=axes('position',[0.5800 0.5793 0.3347 0.162]);
   LAIC6t=Mean_Pre_b585_126_change;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_4,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置


%m_coast;

  axes_5=axes('position',[0.1300 0.3493 0.3347 0.162]);
  LAIC6t=Mean_Pre_245_change;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_5,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  
  axes_6=axes('position',[0.5800 0.3493 0.3347 0.162]);
    LAIC6t=Mean_Pre_b585_245_change;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_6,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置


  

  
  axes_8=axes('position',[0.5800 0.1193 0.3347 0.162]);
  LAIC6t=Mean_Pre_b585_370_change;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_8,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置


axes_11=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_11,color2)
%colorbar('Ticks',[0:0.2:1]);
%caxis([-200,200])


h1=colorbar('southoutside','ticks',[0:0.25:1],'xticklabel',[-200:100:200]);
set(h1,'position',[0.225,0.065,0.55,0.015])
h1.Label.String ='Change in MAP (mm yr^-^1)';

  axes_7=axes('position',[0.1300 0.1193 0.3347 0.162]);
  LAIC6t=Mean_Pre_370_change;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_7,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  
     text(-3.25,15.4,'a','fontweight', 'bold')
  text(-3.25,10.9,'c','fontweight', 'bold')
  text(-3.25,6.38,'e','fontweight', 'bold')

  text(-3.25,1.9,'g','fontweight', 'bold')

      text(5.6,15.4,'b','fontweight', 'bold')
  text(5.6,10.9,'d','fontweight', 'bold')
  text(5.6,6.38,'f','fontweight', 'bold')

  text(5.6,1.9,'h','fontweight', 'bold')
l1=text(1985,395,'Calibration');
set(l1,'rotation',90)
l1=text(1985,108,'Verification');