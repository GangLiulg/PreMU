%% Fig3
% please run Cal_GSWP3_2.m before running this code

load('D:\3_20\color_libraries-master\Matlab\colorscheme.mat')%IPCC color
color1=colorscheme_RGB.temperature_11_RGB;
color2=[color1([1,3,5],:);[0.8,0.8,0.8];[0.8,0.8,0.8];color1([7,9,11],:)];
color2=flipud(color2);

figure

axes_8=axes('position',[0.1203 0.0893 0.3547 0.457]);
%M=imagesc(Pre_compare_GSWP3_m10_1120);
%set(M,'alphadata',~isnan(Pre_p_ot_global.*Mask_land_05))
%caxis([-40,40]);
%colormap(axes_8,color2);

LAIC6t=Pre_compare_GSWP3_mglobal_1120;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,360);
long=linspace(-180,180,720);
[Plg,Plt]=meshgrid(long',lat');%b2

m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;


colormap(axes_8,color2);
caxis([-40,40])
title('Simple linear')

%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

axes_9=axes('position',[0.5803 0.0893 0.3547 0.457]);
%M=imagesc(Pre_compare_GSWP3_m10_1120);
%set(M,'alphadata',~isnan(Pre_p_ot_global.*Mask_land_05))
%caxis([-40,40]);
%colormap(axes_8,color2);

LAIC6t=Pre_compare_GSWP3_m10_1120;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,360);
long=linspace(-180,180,720);
[Plg,Plt]=meshgrid(long',lat');%b2

m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_9,color2);
caxis([-40,40])
title('PREMU')

%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

axes_10=axes('position',[1.1 0.9 0.001 0.001]);

colormap(axes_10,color2);
caxis([-40,40])

%colorbar('Ticks',[0:0.2:1]);
h1=colorbar('southoutside','ticks',[-40:10:40]);
set(h1,'position',[0.2,0.1,0.6,0.03])
h1.Label.String ='Error (%)';


axes_1=axes('position',[0.1300 0.5893 0.7347 0.3857]);
hold on

plot(1901:2016, [Pre_GSWP3_ts_7920_yr_past,Pre_GSWP3_ts_7920_yr],'k','linewidth',2)
plot(1901:2016,    [Pre_GSWP3_ts_mglobal_7920_yr_past,Pre_GSWP3_ts_mglobal_7920_yr],'b','linewidth',2)

%plot(1901:2016,   [ Pre_GSWP3_ts_m10_7920_yr_past,Pre_GSWP3_ts_m10_7920_yr],'r','linewidth',2)
plot(1901:2016,   [Pre_GSWP3_ts_m10_7920_yr_new_past,Pre_GSWP3_ts_m10_7920_yr_new],'r','linewidth',2)
plot([1950,1950],[800,1120],'k--')
set(gca,'xlim',[1900.5,2016.5],'ylim',[960,1070])

set(gca,'TickDir', 'out', 'YMinorTick', 'on')
ylabel('Precipitation (mm/yr)')
xlabel('Year')

text(1903,1112-44,'a','fontweight', 'bold')
text(1899,960-40,'b','fontweight', 'bold')
text(1972,960-40,'c','fontweight', 'bold')
text(1930,1112-44,'Calibration','fontsize', 10)
text(1955,1112-44,'Verification','fontsize', 10)

set(gca,'color','none')

%h1=legend({'GSWP3','Pred-glob','Pred-10','Pred-10-Cali'});
h1=legend({'GSWP3','Simple linear','PREMU'});

legend('boxoff')
set(h1,'position',[0.7177 0.5805 0.1596 0.1426]);
