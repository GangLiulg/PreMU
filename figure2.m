
%% Fig 2
% please run Cal_GSWP3_1.m before

clear score_0116_3mon
for imon=7
    temp1=squeeze(temp_tmp(:,imon,:));
    [coeff,score,latent,tsquared,explained,mu] = pca(temp1(:,1:50)');
   % score_0116_3mon(:,:,imon)=temp1'*coeff(:,1:10);
end

sum(explained(1:10))
coeff_1=coeff(:,1:10); 
score_1=tmp_GSWP3_past_rd'*coeff_1;



k=1;
for i=1:72
    for j=1:144
       PCA_coeff(i,j,:)=coeff_1(k,1:10);
    k=k+1;
    end
end
%%
% figure
figure
subplot(4,3,1)
for i=1:10
    s_exp(i)=sum(explained(1:i));
end
set(gcf,'unit','centimeters','position',[2,2,18,16]);
plot(s_exp,'linewidth',2,'color',[153,0,2]/255)
hold on
l1_1=scatter(1:10,s_exp(1:10),'Marker','o','Markerfacecolor',[153,0,2]/255,'Markeredgecolor',[153,0,2]/255,'SizeData', 75/2);
set(gca,'xlim',[0.5,10.5],'ylim',[0,80],'xtick',[1:10],'xticklabel',{'',2,'',4,'',6,'',8,'',10})
 set(gca,'TickDir', 'out', 'YMinorTick', 'on')
 set(gca,'box','off')
 ylabel('Variance explained (%)')
 xlabel('Principle component')
 text(1,79,'a','fontweight', 'bold')
  text(13,74,'b','fontweight', 'bold')
  text(27.1,74,'c','fontweight', 'bold')

   text(-0.4,-50.8,'d','fontweight', 'bold')
  text(13.75,-50.8,'e','fontweight', 'bold')
  text(27.5,-50.8,'f','fontweight', 'bold')

     text(-0.4,-165.8,'g','fontweight', 'bold')
  text(13.75,-165.8,'h','fontweight', 'bold')
  text(27.5,-165.8,'i','fontweight', 'bold')

     text(-0.4,-271,'j','fontweight', 'bold')
  text(13.75,-271,'k','fontweight', 'bold')
%ax_2=axes('position',[0.58 0.0850 0.4025 0.7550]);
AX_po(:,1)= [0.4108 0.6473 0.244 0.377];
AX_po(:,2)=[0.708 0.6473 0.244 0.377];
AX_po(:,3)=[0.118 0.4273 0.244 0.377];
AX_po(:,4)=[0.418 0.4273 0.244 0.377];
AX_po(:,5)=[0.708 0.4273 0.244 0.377];
AX_po(:,6)=[0.118 0.2273 0.244 0.377];
AX_po(:,7)=[0.418 0.2373 0.244 0.377];
AX_po(:,8)=[0.708 0.2373 0.244 0.377];
AX_po(:,9)=[0.118 0.0473 0.244 0.377];
AX_po(:,10)=[0.418 0.0473 0.244 0.377];

for i=2:11
%subplot(4,3,i)
axes_1=axes('position',AX_po(:,i-1));
load coastlines

LAIC6t=PCA_coeff(:,:,i-1);
LATLIMS=[-90,90];
LONGLIMS=[-179.5,179.5];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;
load('D:\3_20\color_libraries-master\Matlab\colorscheme.mat')%IPCC color
color1=colorscheme_RGB.temperature_11_RGB;
color2=[color1([2:5],:);[0.9,0.9,0.9];[0.9,0.9,0.9];color1([7:10],:)];
color=flipud(color2);

colormap(color);
caxis([-0.025,0.025])
m_coast('color',[0.3,0.3,0.3]);
%m_grid('xtick',[-90:90:90],'ytick',[-60:30:60],'fontsize',7,'xaxis','middle');%grid设置
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

%m_grid
%hold on
%Xin=coastlat;
%Yin=coastlon;
%m_plot(Xin,Yin,'k');



%hco=colorbar(gca,'southoutside');
%hco.Label.String={'Change in zonal wind (m s^-^1)'};
%hco.Label.FontSize=12;
%ylabel('Pressure (hPa)') 

%set(gca,'xtick',[0,120,240,360,480,600,720],'xticklabel',{'90S','60S','30S','0','30N','60N','90N'})
%set(gca,'xtick',[0,120,240,360],'xticklabel',{'0','30N','60N','90N'})

%set(gca,'ytick',[0:200:1000],'yticklabel',[0:200:1000])
%m_grid('tickdir','in','fontsize',12);

%m_plot(coastlon,coastlat,'k','linewidth',0.7)
%m_grid('tickdir','in','fontsize',12);hold on

%axis equal;axis tight;grid on;

%title('ERA5 modeled circulation','fontsize',12)
end
axes_10=axes('position',[1.1 0.9 0.001 0.001]);

colormap(axes_10,color);
caxis([-0.025,0.025])

%colorbar('Ticks',[0:0.2:1]);
h1=colorbar('southoutside','ticks',[-0.02:0.01:0.02]);
set(h1,'position',[0.25,0.1,0.6,0.03])
h1.Label.String ='Coefficient of principal component';




