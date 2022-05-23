%% Fig4
% please run Cal_GSWP3_2.m before running this code

load('D:\3_20\color_libraries-master\Matlab\colorscheme.mat')
color_1=cbrewer('seq','PuBu',8);
color2=colorscheme_RGB.precipitation_8_RGB;
Pre_GSWP3_1120=mean(pre_GSWP3_rec_1(:,:,433:504+288).*Mask_land_05,3)*12;
Pre_GSWP3_m10_1120=mean(Pre_rec_GSWP3_m10(:,:,433:504+288).*Mask_land_05,3)*12;

Pre_GSWP3_mglobal_1120=mean(Pre_rec_GSWP3_mglobal(:,:,433:504+288).*Mask_land_05,3)*12;

Pre_GSWP3_0110=mean(pre_GSWP3_rec_1(:,:,1:360).*Mask_land_05,3)*12;
Pre_GSWP3_m10_0110=mean(Pre_rec_GSWP3_m10(:,:,1:360).*Mask_land_05,3)*12;

Pre_GSWP3_mglobal_0110=mean(Pre_rec_GSWP3_mglobal(:,:,1:360).*Mask_land_05,3)*12;
Pre_GSWP3_dif=Pre_GSWP3_1120-Pre_GSWP3_0110;
Pre_GSWP3_m10_dif=Pre_GSWP3_m10_1120-Pre_GSWP3_m10_0110;
Pre_GSWP3_mglobal_dif=Pre_GSWP3_mglobal_1120-Pre_GSWP3_mglobal_0110;
Pre_GSWP3_dif_1=(Pre_GSWP3_m10_dif-Pre_GSWP3_dif)./Pre_GSWP3_dif*100;

figure
set(gcf,'unit','centimeters','position',[2,2,15,12]);
axes_1=axes('position',[0.1300 0.7293 0.3347 0.257]);

LAIC6t=Pre_GSWP3_1120;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,360);
long=linspace(-180,180,720);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_1,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

text(-2.95,1.8,'a','fontweight', 'bold')
text(4.6,1.8,'b','fontweight', 'bold')

text(-2.95,-2.4,'c','fontweight', 'bold')
text(4.6,-2.4,'d','fontweight', 'bold')

text(-2.95,-6.6,'e','fontweight', 'bold')
text(4.6,-6.6,'f','fontweight', 'bold')

axes_2=axes('position',[0.1300 0.4493 0.3347 0.257]);

LAIC6t=Pre_GSWP3_mglobal_1120;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,360);
long=linspace(-180,180,720);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_2,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置


axes_3=axes('position',[0.1300 0.1693 0.3347 0.257]);

LAIC6t=Pre_GSWP3_m10_1120;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,360);
long=linspace(-180,180,720);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_3,color_1);
caxis([0,2400])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

axes_4=axes('position',[0.5300 0.7293 0.3347 0.257]);

LAIC6t=Pre_GSWP3_dif;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,360);
long=linspace(-180,180,720);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_4,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

axes_5=axes('position',[0.5300 0.4493 0.3347 0.257]);

LAIC6t=Pre_GSWP3_mglobal_dif;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,360);
long=linspace(-180,180,720);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_5,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置


axes_6=axes('position',[0.5300 0.1693 0.3347 0.257]);

LAIC6t=Pre_GSWP3_m10_dif;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,360);
long=linspace(-180,180,720);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_6,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

axes_10=axes('position',[1.1 0.9 0.001 0.001]);

colormap(axes_10,color2);
caxis([-200,200])

%colorbar('Ticks',[0:0.2:1]);
h1=colorbar('southoutside','ticks',[-200:100:200]);
set(h1,'position',[0.55,0.12,0.3,0.03])
h1.Label.String ='Change in MAP (mm yr^-^1)';


axes_11=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_11,color_1)
%colorbar('Ticks',[0:0.2:1]);
h1=colorbar('southoutside','ticks',[0:0.25:1],'xticklabel',[0:600:2400]);
set(h1,'position',[0.15,0.12,0.3,0.03])
h1.Label.String ='MAP (mm yr^-^1)';
