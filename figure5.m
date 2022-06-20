%% plot Fig5
% please run Cal_ESMs_2.m before running this code

Mean_Pre_model_585_yr=mean(Pre_model_585_yr,2);
Mean_Pre_model_126_yr=mean(Pre_model_126_yr,2);
Mean_Pre_model_245_yr=mean(Pre_model_245_yr,2);
Mean_Pre_model_370_yr=mean(Pre_model_370_yr,2);
for i=1:86  
Std_Pre_model_585_yr(i)=std(Pre_model_585_yr(i,:)-mean(Pre_model_585_yr,1));

Std_Pre_model_126_yr(i)=std(Pre_model_126_yr(i,:)-mean(Pre_model_126_yr,1));
Std_Pre_model_245_yr(i)=std(Pre_model_245_yr(i,:)-mean(Pre_model_245_yr,1));
Std_Pre_model_370_yr(i)=std(Pre_model_370_yr(i,:)-mean(Pre_model_370_yr,1));

end
Max_Pre_model_585_yr=Mean_Pre_model_585_yr-mean(Mean_Pre_model_585_yr)+Std_Pre_model_585_yr';
Max_Pre_model_126_yr=Mean_Pre_model_126_yr-mean(Mean_Pre_model_126_yr)+Std_Pre_model_126_yr';
Max_Pre_model_245_yr=Mean_Pre_model_245_yr-mean(Mean_Pre_model_245_yr)+Std_Pre_model_245_yr';
Max_Pre_model_370_yr=Mean_Pre_model_370_yr-mean(Mean_Pre_model_370_yr)+Std_Pre_model_370_yr';
Min_Pre_model_585_yr=Mean_Pre_model_585_yr-mean(Mean_Pre_model_585_yr)-Std_Pre_model_585_yr';
Min_Pre_model_126_yr=Mean_Pre_model_126_yr-mean(Mean_Pre_model_126_yr)-Std_Pre_model_126_yr';
Min_Pre_model_245_yr=Mean_Pre_model_245_yr-mean(Mean_Pre_model_245_yr)-Std_Pre_model_245_yr';
Min_Pre_model_370_yr=Mean_Pre_model_370_yr-mean(Mean_Pre_model_370_yr)-Std_Pre_model_370_yr';



Mean_Pre_b585_585_m10_yr=mean(Pre_b585_585_m10_yr,2);
Mean_Pre_b585_126_m10_yr=mean(Pre_b585_126_m10_yr,2);
Mean_Pre_b585_245_m10_yr=mean(Pre_b585_245_m10_yr,2);
Mean_Pre_b585_370_m10_yr=mean(Pre_b585_370_m10_yr,2);
for i=1:86
Std_Pre_b585_585_m10_yr(i)=std(Pre_b585_585_m10_yr(i,:)-mean(Pre_b585_585_m10_yr));

Std_Pre_b585_126_m10_yr(i)=std(Pre_b585_126_m10_yr(i,:)-mean(Pre_b585_126_m10_yr));
Std_Pre_b585_245_m10_yr(i)=std(Pre_b585_245_m10_yr(i,:)-mean(Pre_b585_245_m10_yr));
Std_Pre_b585_370_m10_yr(i)=std(Pre_b585_370_m10_yr(i,:)-mean(Pre_b585_370_m10_yr));

end
Max_Pre_b585_585_m10_yr=Mean_Pre_b585_585_m10_yr-mean(Mean_Pre_b585_585_m10_yr)+Std_Pre_b585_585_m10_yr';
Max_Pre_b585_126_m10_yr=Mean_Pre_b585_126_m10_yr-mean(Mean_Pre_b585_126_m10_yr)+Std_Pre_b585_126_m10_yr';
Max_Pre_b585_245_m10_yr=Mean_Pre_b585_245_m10_yr-mean(Mean_Pre_b585_245_m10_yr)+Std_Pre_b585_245_m10_yr';
Max_Pre_b585_370_m10_yr=Mean_Pre_b585_370_m10_yr-mean(Mean_Pre_b585_370_m10_yr)+Std_Pre_b585_370_m10_yr';
Min_Pre_b585_585_m10_yr=Mean_Pre_b585_585_m10_yr-mean(Mean_Pre_b585_585_m10_yr)-Std_Pre_b585_585_m10_yr';
Min_Pre_b585_126_m10_yr=Mean_Pre_b585_126_m10_yr-mean(Mean_Pre_b585_126_m10_yr)-Std_Pre_b585_126_m10_yr';
Min_Pre_b585_245_m10_yr=Mean_Pre_b585_245_m10_yr-mean(Mean_Pre_b585_245_m10_yr)-Std_Pre_b585_245_m10_yr';
Min_Pre_b585_370_m10_yr=Mean_Pre_b585_370_m10_yr-mean(Mean_Pre_b585_370_m10_yr)-Std_Pre_b585_370_m10_yr';
clear temp2
temp1=rot90(mean(Pre_compare_b585_126_m10_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_compare_b585_126=temp2;

temp1=rot90(mean(Pre_compare_b585_245_m10_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_compare_b585_245=temp2;

temp1=rot90(mean(Pre_compare_b585_370_m10_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_compare_b585_370=temp2;

temp1=rot90(mean(Pre_compare_b585_585_m10_9100,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_compare_b585_585=temp2;

load('D:\3_20\color_libraries-master\Matlab\colorscheme.mat')%IPCC color
color1=colorscheme_RGB.temperature_11_RGB;
color2=[color1([1,3,5],:);[0.8,0.8,0.8];[0.8,0.8,0.8];color1([7,9,11],:)];
color2=flipud(color2);
n_title={'SSP5-8.5','SSP1-2.6','SSP2-4.5','SSP3-7.0'};
figure
time1=2015:2100;
set(gcf,'unit','centimeters','position',[2,2,12,15]);
axes_1=axes('position',[0.1300 0.8193 0.3347 0.152]);
hold on
plot(2015:2100,Mean_Pre_model_585_yr-mean(Mean_Pre_model_585_yr),'k','linewidth',1.5)
plot(2015:2100,Mean_Pre_b585_585_m10_yr-mean(Mean_Pre_b585_585_m10_yr),'r','linewidth',1.5)
patch([time1'; flipud(time1')], [Min_Pre_model_585_yr;flipud(Max_Pre_model_585_yr)], [150, 150, 150]/256,...
  'FaceAlpha', 0.4, 'EdgeColor', 'k', 'EdgeAlpha', 0)
%            errorbar(time1,Mean_Pre_b585_585_m10_yr-mean(Mean_Pre_b585_585_m10_yr),Std_Pre_b585_585_m10_yr,'r')
patch([time1'; flipud(time1')], [Min_Pre_b585_585_m10_yr;flipud(Max_Pre_b585_585_m10_yr)], [255, 0, 0]/256,...
  'FaceAlpha', 0.3, 'EdgeColor', 'k', 'EdgeAlpha', 0)

%  ylabel('Pre (mm yr^-^1)')
  set(gca,'xlim',[2014.5,2100.5],'ylim',[-60,60])
 set(gca,'TickDir', 'out', 'YMinorTick', 'on')
 % xlabel('Year')
  title(n_title{1})
  legend({'CMIP6(9)', 'PREMU'})
  legend('boxoff')
  
  
  axes_2=axes('position',[0.5800 0.8093 0.3347 0.162]);
  LAIC6t=Mean_Pre_compare_b585_585;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_2,color2);
caxis([-20,20])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  
axes_3=axes('position',[0.1300 0.5893 0.3347 0.152]);
hold on
plot(2015:2100,Mean_Pre_model_126_yr-mean(Mean_Pre_model_126_yr),'k','linewidth',1.5)
plot(2015:2100,Mean_Pre_b585_126_m10_yr-mean(Mean_Pre_b585_126_m10_yr),'r','linewidth',1.5)
patch([time1'; flipud(time1')], [Min_Pre_model_126_yr;flipud(Max_Pre_model_126_yr)], [150, 150, 150]/256,...
  'FaceAlpha', 0.4, 'EdgeColor', 'k', 'EdgeAlpha', 0)
%            errorbar(time1,Mean_Pre_b585_585_m10_yr-mean(Mean_Pre_b585_585_m10_yr),Std_Pre_b585_585_m10_yr,'r')
patch([time1'; flipud(time1')], [Min_Pre_b585_126_m10_yr;flipud(Max_Pre_b585_126_m10_yr)], [255, 0, 0]/256,...
  'FaceAlpha', 0.3, 'EdgeColor', 'k', 'EdgeAlpha', 0)

 % ylabel('Pre (mm yr^-^1)')
  set(gca,'xlim',[2014.5,2100.5],'ylim',[-40,40])
 set(gca,'TickDir', 'out', 'YMinorTick', 'on')
%  xlabel('Year')
  title(n_title{2})
 
  axes_4=axes('position',[0.5800 0.5793 0.3347 0.162]);
  LAIC6t=Mean_Pre_compare_b585_126;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_4,color2);
caxis([-20,20])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  axes_5=axes('position',[0.1300 0.3593 0.3347 0.152]);
hold on
plot(2015:2100,Mean_Pre_model_245_yr-mean(Mean_Pre_model_245_yr),'k','linewidth',1.5)
plot(2015:2100,Mean_Pre_b585_245_m10_yr-mean(Mean_Pre_b585_245_m10_yr),'r','linewidth',1.5)
patch([time1'; flipud(time1')], [Min_Pre_model_245_yr;flipud(Max_Pre_model_245_yr)], [150, 150, 150]/256,...
  'FaceAlpha', 0.4, 'EdgeColor', 'k', 'EdgeAlpha', 0)
%            errorbar(time1,Mean_Pre_b585_585_m10_yr-mean(Mean_Pre_b585_585_m10_yr),Std_Pre_b585_585_m10_yr,'r')
patch([time1'; flipud(time1')], [Min_Pre_b585_245_m10_yr;flipud(Max_Pre_b585_245_m10_yr)], [255, 0, 0]/256,...
  'FaceAlpha', 0.3, 'EdgeColor', 'k', 'EdgeAlpha', 0)

  %ylabel('Pre (mm yr^-^1)')
  set(gca,'xlim',[2014.5,2100.5],'ylim',[-50,50])
 set(gca,'TickDir', 'out', 'YMinorTick', 'on')
%  xlabel('Year')
 title(n_title{3})
 
  axes_6=axes('position',[0.5800 0.3493 0.3347 0.162]);
  LAIC6t=Mean_Pre_compare_b585_245;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_6,color2);
caxis([-20,20])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  

  
  axes_6=axes('position',[0.5800 0.1193 0.3347 0.162]);
  LAIC6t=Mean_Pre_compare_b585_370;
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(axes_6,color2);
caxis([-20,20])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

axes_11=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_11,color2)
%colorbar('Ticks',[0:0.2:1]);

caxis([-20,20])

h1=colorbar('southoutside','ticks',[-20:10:20]);
set(h1,'position',[0.625,0.088,0.25,0.015])
h1.Label.String ='Error (%)';

  axes_5=axes('position',[0.1300 0.1293 0.3347 0.152]);
hold on
plot(2015:2100,Mean_Pre_model_370_yr-mean(Mean_Pre_model_370_yr),'k','linewidth',1.5)
plot(2015:2100,Mean_Pre_b585_370_m10_yr-mean(Mean_Pre_b585_370_m10_yr),'r','linewidth',1.5)
patch([time1'; flipud(time1')], [Min_Pre_model_370_yr;flipud(Max_Pre_model_370_yr)], [150, 150, 150]/256,...
  'FaceAlpha', 0.4, 'EdgeColor', 'k', 'EdgeAlpha', 0)
%            errorbar(time1,Mean_Pre_b585_585_m10_yr-mean(Mean_Pre_b585_585_m10_yr),Std_Pre_b585_585_m10_yr,'r')
patch([time1'; flipud(time1')], [Min_Pre_b585_370_m10_yr;flipud(Max_Pre_b585_370_m10_yr)], [255, 0, 0]/256,...
  'FaceAlpha', 0.3, 'EdgeColor', 'k', 'EdgeAlpha', 0)

  %ylabel('Pre (mm yr^-^1)')
  set(gca,'xlim',[2014.5,2100.5],'ylim',[-50,50])
 set(gca,'TickDir', 'out', 'YMinorTick', 'on')
  xlabel('Year')
 title(n_title{4})
  
    text(2017,505,'a','fontweight', 'bold')
  text(2017,355,'c','fontweight', 'bold')
  text(2017,202,'e','fontweight', 'bold')

  text(2017,50,'g','fontweight', 'bold')

      text(2120,505,'b','fontweight', 'bold')
  text(2120,355,'d','fontweight', 'bold')
  text(2120,202,'f','fontweight', 'bold')
t1=text(1995,172,'Precipitation (mm yr^-^1)');
set(t1,'rotation',90)
  text(2120,50,'h','fontweight', 'bold')
  % 手动加一条虚线
l1=text(1985,395+25,'Calibration');
set(l1,'rotation',90)
l1=text(1985,128,'Verification');
set(l1,'rotation',90)