%% Fig10
% please run Cal_ESMs_2.m before running this code
color2=colorscheme_RGB.precipitation_8_RGB;

Pre_b585_126_m10_change=squeeze(mean(Pre_rec_b585_126_m10(:,:,673:1032,:)-Pre_rec_b585_126_m10(:,:,1:12*30,:),3)*12);
Pre_b585_245_m10_change=squeeze(mean(Pre_rec_b585_245_m10(:,:,673:1032,:)-Pre_rec_b585_245_m10(:,:,1:12*30,:),3)*12);
Pre_b585_370_m10_change=squeeze(mean(Pre_rec_b585_370_m10(:,:,673:1032,:)-Pre_rec_b585_370_m10(:,:,1:12*30,:),3)*12);
Pre_b585_585_m10_change=squeeze(mean(Pre_rec_b585_585_m10(:,:,673:1032,:)-Pre_rec_b585_585_m10(:,:,1:12*30,:),3)*12);
for i=1:9
    temp1=rot90(squeeze(Pre_b585_126_m10_change(:,:,i)));
    temp2(:,1:72)=temp1(:,73:144);
    temp2(:,73:144)=temp1(:,1:72);
    Pre_b585_126_change(:,:,i)=temp2;
        temp1=rot90(squeeze(Pre_b585_245_m10_change(:,:,i)));
    temp2(:,1:72)=temp1(:,73:144);
    temp2(:,73:144)=temp1(:,1:72);
    Pre_b585_245_change(:,:,i)=temp2;
        temp1=rot90(squeeze(Pre_b585_370_m10_change(:,:,i)));
    temp2(:,1:72)=temp1(:,73:144);
    temp2(:,73:144)=temp1(:,1:72);
    Pre_b585_370_change(:,:,i)=temp2;
    
        temp1=rot90(squeeze(Pre_b585_585_m10_change(:,:,i)));
    temp2(:,1:72)=temp1(:,73:144);
    temp2(:,73:144)=temp1(:,1:72);
    Pre_b585_585_change(:,:,i)=temp2;
    
end
Pre_126_change=squeeze(mean(Pre_126(:,:,673:1032,:)-Pre_126(:,:,1:12*30,:),3)*12);
Pre_245_change=squeeze(mean(Pre_245(:,:,673:1032,:)-Pre_245(:,:,1:12*30,:),3)*12);
Pre_370_change=squeeze(mean(Pre_370(:,:,673:1032,:)-Pre_370(:,:,1:12*30,:),3)*12);
Pre_585_change=squeeze(mean(Pre_585(:,:,673:1032,:)-Pre_585(:,:,1:12*30,:),3)*12);
for i=1:9
    temp1=rot90(squeeze(Pre_126_change(:,:,i)));
    temp2(:,1:72)=temp1(:,73:144);
    temp2(:,73:144)=temp1(:,1:72);
    Pre_126_change_1(:,:,i)=temp2;
   temp1=rot90(squeeze(Pre_245_change(:,:,i)));
    temp2(:,1:72)=temp1(:,73:144);
    temp2(:,73:144)=temp1(:,1:72);
    Pre_245_change_1(:,:,i)=temp2;  
    
    temp1=rot90(squeeze(Pre_370_change(:,:,i)));
    temp2(:,1:72)=temp1(:,73:144);
    temp2(:,73:144)=temp1(:,1:72);
    Pre_370_change_1(:,:,i)=temp2;
    
       temp1=rot90(squeeze(Pre_585_change(:,:,i)));
    temp2(:,1:72)=temp1(:,73:144);
    temp2(:,73:144)=temp1(:,1:72);
    Pre_585_change_1(:,:,i)=temp2;
end

temp1=rot90(mean(Pre_245_change,3));
temp2(:,1:72)=temp1(:,73:144);
temp2(:,73:144)=temp1(:,1:72);
Mean_Pre_245_change=temp2;

% 先126

figure
name_a={'a','c','e','g','i','k','m','o','q'};
name_b={'b','d','f','h','j','l','n','p','r'};
for k=1:9

    subplot(5,4,k*2-1)
     LAIC6t=Pre_126_change_1(:,:,k);
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(gca,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  text(-3.6,2,name_a(k),'fontweight', 'bold')
title(Model_name{k})
end

for k=1:9
    
    subplot(5,4,k*2)
     LAIC6t=Pre_b585_126_change(:,:,k);
LATLIMS=[-90,90];
LONGLIMS=[-180,180];
lat=linspace(-90,90,72);
long=linspace(-180,180,144);
[Plg,Plt]=meshgrid(long',lat');%b2
m_proj('Robinson','long',LONGLIMS,'lat',LATLIMS);% ????????
    
m_pcolor(Plg,Plt,flipud(LAIC6t));

shading flat;

colormap(gca,color2);
caxis([-200,200])
%m_coast;
m_grid('xtick',[-90:90:90],'ytick',[-90:30:90],'fontsize',7,'xaxis','bottom');%grid设置

  text(-3.6,2,name_b(k),'fontweight', 'bold')
title(Model_name{k})
end
axes_11=axes('position',[1.1 0.9 0.001 0.001]);
colormap(axes_11,color2)
%colorbar('Ticks',[0:0.2:1]);
%caxis([-200,200])


h1=colorbar('southoutside','ticks',[0:0.25:1],'xticklabel',[-200:100:200]);
set(h1,'position',[0.585,0.155,0.25,0.025])
h1.Label.String ='Change in MAP (mm yr^-^1)';

        set(gcf,'unit','centimeters','position',[2,2,21.9,15.5]);

    
    

