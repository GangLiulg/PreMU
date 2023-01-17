%% Fig7
% please run Cal_ESMs_2.m before running this code
load('D:\3_20\color_libraries-master\Matlab\colorscheme.mat')%IPCC color

color1=colorscheme_RGB.temperature_11_RGB;
color2=[color1([1,2,4],:);[0.85,0.85,0.85];[0.85,0.85,0.85];color1([8,10,11],:)];
color2=flipud(color2);

clear temp2
temp1=rot90(mean(Pre_b585_126_m10_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_b585_126=temp2;

temp1=rot90(mean(Pre_b585_245_m10_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_b585_245=temp2;

temp1=rot90(mean(Pre_b585_370_m10_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_b585_370=temp2;

temp1=rot90(mean(Pre_b585_585_m10_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_b585_585=temp2;

clear temp2
temp1=rot90(mean(Pre_model_126_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_126=temp2;

temp1=rot90(mean(Pre_model_245_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_245=temp2;

temp1=rot90(mean(Pre_model_370_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_370=temp2;

temp1=rot90(mean(Pre_model_585_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_585=temp2;


color_1=cbrewer('seq','PuBu',8);
color1=cbrewer('div','Spectral',10);
%color2=[color1([1,3,5],:);[0.8,0.8,0.8];[0.8,0.8,0.8];color1([6,8,10],:)];

figure
time1=2015:2100;
set(gcf,'unit','centimeters','position',[2,2,22.5,15]);

axes_1=axes('position',[0.0800 0.8093 0.2447 0.162]);
  LAIC6t=Mean_Pre_585;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_1,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置



  
  axes_2=axes('position',[0.3800 0.8093 0.2447 0.162]);
   LAIC6t=Mean_Pre_b585_585;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_2,color_1);
caxis([0,2400])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  axes_21=axes('position',[0.6800 0.8093 0.2447 0.162]);
   LAIC6t=Mean_Pre_b585_585-Mean_Pre_585;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_21,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置
 

axes_3=axes('position',[0.0800 0.5793 0.2447 0.162]);
  LAIC6t=Mean_Pre_126;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_3,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  axes_4=axes('position',[0.3800 0.5793 0.2447 0.162]);
   LAIC6t=Mean_Pre_b585_126;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_4,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  axes_41=axes('position',[0.6800 0.5793 0.2447 0.162]);
   LAIC6t=Mean_Pre_b585_126-Mean_Pre_126;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_41,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置
 


%m_coast;

  axes_5=axes('position',[0.0800 0.3493 0.2447 0.162]);
  LAIC6t=Mean_Pre_245;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_5,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  
  axes_6=axes('position',[0.3800 0.3493 0.2447 0.162]);
    LAIC6t=Mean_Pre_b585_245;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_6,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置


    axes_61=axes('position',[0.6800 0.3493 0.2447 0.162]);
   LAIC6t=Mean_Pre_b585_245-Mean_Pre_245;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_61,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置
 


  
  axes_8=axes('position',[0.3800 0.1193 0.2447 0.162]);
  LAIC6t=Mean_Pre_b585_370;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_8,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置



axes_12=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_12,color2)
%colorbar('Ticks',[0:0.2:1]);


h1=colorbar('southoutside','ticks',[0:0.25:1],'xticklabel',[-200:100:200]);
set(h1,'position',[0.695,0.065,0.2,0.015])
h1.Label.String ='Error in MAP (mm yr^-^1)';


axes_11=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_11,color_1)
%colorbar('Ticks',[0:0.2:1]);


h1=colorbar('southoutside','ticks',[0:0.25:1],'xticklabel',[0:600:2400]);
set(h1,'position',[0.155,0.065,0.4,0.015])
h1.Label.String ='MAP (mm yr^-^1)';


  axes_7=axes('position',[0.0800 0.1193 0.2447 0.162]);
  LAIC6t=Mean_Pre_370;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_7,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  



    text(-3.25,15.4,'a','fontweight', 'bold')
  text(-3.25,10.9,'d','fontweight', 'bold')
  text(-3.25,6.38,'g','fontweight', 'bold')

  text(-3.25,1.9,'j','fontweight', 'bold')

      text(5.6,15.4,'b','fontweight', 'bold')
  text(5.6,10.9,'e','fontweight', 'bold')
  text(5.6,6.38,'h','fontweight', 'bold')

  text(5.6,1.9,'k','fontweight', 'bold')
  %
     text(14.45,15.4,'c','fontweight', 'bold')
  text(14.45,10.9,'f','fontweight', 'bold')
  text(14.45,6.38,'i','fontweight', 'bold')

  text(14.45,1.9,'l','fontweight', 'bold')
  
  %
  
  l1=text(1985,395,'Calibration');
set(l1,'rotation',90)
l1=text(1985,108,'Verification');


 axes_81=axes('position',[0.6800 0.1193 0.2447 0.162]);
   LAIC6t=Mean_Pre_b585_370-Mean_Pre_370;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_81,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置
 
%% only two columns
figure
time1=2015:2100;
set(gcf,'unit','centimeters','position',[2,-3,16,18]);

axes_1=axes('position',[0.0900 0.8093 0.3647 0.162]);
  LAIC6t=Mean_Pre_585;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_1,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置



  
 

  axes_21=axes('position',[0.5500 0.8093 0.3647 0.162]);
   LAIC6t=Mean_Pre_b585_585-Mean_Pre_585;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_21,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置
 

axes_3=axes('position',[0.0900 0.5793 0.3647 0.162]);
  LAIC6t=Mean_Pre_126;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_3,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  axes_41=axes('position',[0.5500 0.5793 0.3647 0.162]);
   LAIC6t=Mean_Pre_b585_126-Mean_Pre_126;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_41,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置
 


%m_coast;

  axes_5=axes('position',[0.0900 0.3493 0.3647 0.162]);
  LAIC6t=Mean_Pre_245;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_5,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置


    axes_61=axes('position',[0.5500 0.3493 0.3647 0.162]);
   LAIC6t=Mean_Pre_b585_245-Mean_Pre_245;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_61,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置
 


  

axes_12=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_12,color2)
%colorbar('Ticks',[0:0.2:1]);


h1=colorbar('southoutside','ticks',[0:0.25:1],'xticklabel',[-200:100:200]);
set(h1,'position',[0.605,0.065,0.25,0.015])
h1.Label.String ='Error in MAP (mm yr^-^1)';


axes_11=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_11,color_1)
%colorbar('Ticks',[0:0.2:1]);


h1=colorbar('southoutside','ticks',[0:0.25:1],'xticklabel',[0:600:2400]);
set(h1,'position',[0.145,0.065,0.25,0.015])
h1.Label.String ='MAP (mm yr^-^1)';


  axes_7=axes('position',[0.0900 0.1193 0.3647 0.162]);
  LAIC6t=Mean_Pre_370;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_7,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  



    text(-2.9,15.4,'a','fontweight', 'bold')
  text(-2.9,10.9,'c','fontweight', 'bold')
  text(-2.9,6.38,'e','fontweight', 'bold')

  text(-2.9,1.9,'g','fontweight', 'bold')

      text(5.4,15.4,'b','fontweight', 'bold')
  text(5.4,10.9,'d','fontweight', 'bold')
  text(5.4,6.38,'f','fontweight', 'bold')

  text(5.4,1.9,'h','fontweight', 'bold')
  
  c1=text(-4.2,12.8,'Calibiration','Rotation',90);
    c2=text(-4.2,4,'Verification','Rotation',90);

  %
  %   text(14.45,15.4,'c','fontweight', 'bold')
  %text(14.45,10.9,'f','fontweight', 'bold')
  %text(14.45,6.38,'i','fontweight', 'bold')

  %text(14.45,1.9,'l','fontweight', 'bold')
  
  %
  
  l1=text(1985,395,'Calibration');
set(l1,'rotation',90)
l1=text(1985,108,'Verification');


 axes_81=axes('position',[0.5500 0.1193 0.3647 0.162]);
   LAIC6t=Mean_Pre_b585_370-Mean_Pre_370;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_81,color2);
caxis([-200,200])

m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置
 
