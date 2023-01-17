%% Fig 11
% please run Cal_GSWP3_2.m before running this code

Mask_N3090=nan(360,720);
Mask_N3090(1:120,:)=1;

Pre_GSWP3_ts_7920_lat(:,1)=squeeze(nansum(nansum(pre_GSWP3_rec_1.*Mask_land_05.*S1.*Mask_N3090)))/(nansum(nansum(S1.*Mask_land_05.*Mask_N3090)));
Pre_GSWP3_ts_7920_past_lat(:,1)=squeeze(nansum(nansum(pre_GSWP3_1.*Mask_land_05.*S1.*Mask_N3090)))/(nansum(nansum(S1.*Mask_land_05.*Mask_N3090)));

Pre_GSWP3_ts_m10_7920_new_lat(:,1)=squeeze(nansum(nansum(Pre_rec_GSWP3_m10.*Mask_land_05.*S1.*Mask_N3090))/(nansum(nansum(S1.*Mask_N3090.*Mask_land_05))));
Pre_GSWP3_ts_m10_7920_past_lat(:,1)=squeeze(nansum(nansum(Pre_past_GSWP3_m10.*Mask_land_05.*S1.*Mask_N3090))/(nansum(nansum(S1.*Mask_N3090.*Mask_land_05))));

Pre_GSWP3_ts_mglobal_7920_lat(:,1)= squeeze(nansum(nansum(Pre_rec_GSWP3_mglobal.*Mask_land_05.*S1.*Mask_N3090))/(nansum(nansum(S1.*Mask_N3090.*Mask_land_05))));
Pre_GSWP3_ts_mglobal_7920_past_lat(:,1)= squeeze(nansum(nansum(Pre_past_GSWP3_mglobal.*Mask_land_05.*S1.*Mask_N3090))/(nansum(nansum(S1.*Mask_N3090.*Mask_land_05))));


Mask_N0030=nan(360,720);
Mask_N0030(121:180,:)=1;

Pre_GSWP3_ts_7920_lat(:,2)=squeeze(nansum(nansum(pre_GSWP3_rec_1.*Mask_land_05.*S1.*Mask_N0030)))/(nansum(nansum(S1.*Mask_land_05.*Mask_N0030)));
Pre_GSWP3_ts_7920_past_lat(:,2)=squeeze(nansum(nansum(pre_GSWP3_1.*Mask_land_05.*S1.*Mask_N0030)))/(nansum(nansum(S1.*Mask_land_05.*Mask_N0030)));

Pre_GSWP3_ts_m10_7920_new_lat(:,2)=squeeze(nansum(nansum(Pre_rec_GSWP3_m10.*Mask_land_05.*S1.*Mask_N0030))/(nansum(nansum(S1.*Mask_N0030.*Mask_land_05))));
Pre_GSWP3_ts_m10_7920_past_lat(:,2)=squeeze(nansum(nansum(Pre_past_GSWP3_m10.*Mask_land_05.*S1.*Mask_N0030))/(nansum(nansum(S1.*Mask_N0030.*Mask_land_05))));

Pre_GSWP3_ts_mglobal_7920_lat(:,2)= squeeze(nansum(nansum(Pre_rec_GSWP3_mglobal.*Mask_land_05.*S1.*Mask_N0030))/(nansum(nansum(S1.*Mask_N0030.*Mask_land_05))));
Pre_GSWP3_ts_mglobal_7920_past_lat(:,2)= squeeze(nansum(nansum(Pre_past_GSWP3_mglobal.*Mask_land_05.*S1.*Mask_N0030))/(nansum(nansum(S1.*Mask_N0030.*Mask_land_05))));


Mask_S0030=nan(360,720);
Mask_S0030(181:240,:)=1;

Pre_GSWP3_ts_7920_lat(:,3)=squeeze(nansum(nansum(pre_GSWP3_rec_1.*Mask_land_05.*S1.*Mask_S0030)))/(nansum(nansum(S1.*Mask_land_05.*Mask_S0030)));
Pre_GSWP3_ts_7920_past_lat(:,3)=squeeze(nansum(nansum(pre_GSWP3_1.*Mask_land_05.*S1.*Mask_S0030)))/(nansum(nansum(S1.*Mask_land_05.*Mask_S0030)));

Pre_GSWP3_ts_m10_7920_new_lat(:,3)=squeeze(nansum(nansum(Pre_rec_GSWP3_m10.*Mask_land_05.*S1.*Mask_S0030))/(nansum(nansum(S1.*Mask_S0030.*Mask_land_05))));
Pre_GSWP3_ts_m10_7920_past_lat(:,3)=squeeze(nansum(nansum(Pre_past_GSWP3_m10.*Mask_land_05.*S1.*Mask_S0030))/(nansum(nansum(S1.*Mask_S0030.*Mask_land_05))));

Pre_GSWP3_ts_mglobal_7920_lat(:,3)= squeeze(nansum(nansum(Pre_rec_GSWP3_mglobal.*Mask_land_05.*S1.*Mask_S0030))/(nansum(nansum(S1.*Mask_S0030.*Mask_land_05))));
Pre_GSWP3_ts_mglobal_7920_past_lat(:,3)= squeeze(nansum(nansum(Pre_past_GSWP3_mglobal.*Mask_land_05.*S1.*Mask_S0030))/(nansum(nansum(S1.*Mask_S0030.*Mask_land_05))));

Mask_S3090=nan(360,720);
Mask_S3090(241:360,:)=1;

Pre_GSWP3_ts_7920_lat(:,4)=squeeze(nansum(nansum(pre_GSWP3_rec_1.*Mask_land_05.*S1.*Mask_S3090)))/(nansum(nansum(S1.*Mask_land_05.*Mask_S3090)));
Pre_GSWP3_ts_7920_past_lat(:,4)=squeeze(nansum(nansum(pre_GSWP3_1.*Mask_land_05.*S1.*Mask_S3090)))/(nansum(nansum(S1.*Mask_land_05.*Mask_S3090)));

Pre_GSWP3_ts_m10_7920_new_lat(:,4)=squeeze(nansum(nansum(Pre_rec_GSWP3_m10.*Mask_land_05.*S1.*Mask_S3090))/(nansum(nansum(S1.*Mask_S3090.*Mask_land_05))));
Pre_GSWP3_ts_m10_7920_past_lat(:,4)=squeeze(nansum(nansum(Pre_past_GSWP3_m10.*Mask_land_05.*S1.*Mask_S3090))/(nansum(nansum(S1.*Mask_S3090.*Mask_land_05))));

Pre_GSWP3_ts_mglobal_7920_lat(:,4)= squeeze(nansum(nansum(Pre_rec_GSWP3_mglobal.*Mask_land_05.*S1.*Mask_S3090))/(nansum(nansum(S1.*Mask_S3090.*Mask_land_05))));
Pre_GSWP3_ts_mglobal_7920_past_lat(:,4)= squeeze(nansum(nansum(Pre_past_GSWP3_mglobal.*Mask_land_05.*S1.*Mask_S3090))/(nansum(nansum(S1.*Mask_S3090.*Mask_land_05))));


y_abcd=[75,250,220,75];
name_abcd={'a','b','c','d'};
title_name={'30\circ-90\circN','0\circ-30\circN','0\circ-30\circS','30\circ-90\circS'};

%temp1=[Pre_GSWP3_ts_7920_past',Pre_GSWP3_ts_7920'];
%temp2=[Pre_GSWP3_ts_m10_7920_new_past',Pre_GSWP3_ts_m10_7920_new'];
%temp3=[Pre_GSWP3_ts_mglobal_7920_past',Pre_GSWP3_ts_mglobal_7920'];
figure
set(gcf,'unit','centimeters','position',[2,2,14,12]);

for k=1:4
    temp1=[Pre_GSWP3_ts_7920_lat(:,k)'];
temp2=[Pre_GSWP3_ts_m10_7920_new_lat(:,k)'];
temp3=[Pre_GSWP3_ts_mglobal_7920_lat(:,k)'];

for i=1:12
    Pre_GSWP3_ts_mglobal_sc(i)=mean(temp3(432+i:12:792));
        Pre_GSWP3_ts_m10_sc(i)=mean(temp2(432+i:12:792));
            Pre_GSWP3_ts_sc(i)=mean(temp1(432+i:12:792));
end

for i=1:66
    Pre_GSWP3_ts_seasonal(i,1)=mean(temp1(i*12-11:i*12-9));
        Pre_GSWP3_ts_m10_seasonal(i,1)=mean(temp2(i*12-11:i*12-9));
    Pre_GSWP3_ts_mglobal_seasonal(i,1)=mean(temp3(i*12-11:i*12-9));
    
  Pre_GSWP3_ts_seasonal(i,2)=mean(temp1(i*12-8:i*12-6));
        Pre_GSWP3_ts_m10_seasonal(i,2)=mean(temp2(i*12-8:i*12-6));
    Pre_GSWP3_ts_mglobal_seasonal(i,2)=mean(temp3(i*12-8:i*12-6));
    
  Pre_GSWP3_ts_seasonal(i,3)=mean(temp1(i*12-5:i*12-3));
        Pre_GSWP3_ts_m10_seasonal(i,3)=mean(temp2(i*12-5:i*12-3));
    Pre_GSWP3_ts_mglobal_seasonal(i,3)=mean(temp3(i*12-5:i*12-3));
    
  Pre_GSWP3_ts_seasonal(i,4)=mean(temp1(i*12-2:i*12-0));
        Pre_GSWP3_ts_m10_seasonal(i,4)=mean(temp2(i*12-2:i*12-0));
    Pre_GSWP3_ts_mglobal_seasonal(i,4)=mean(temp3(i*12-2:i*12-0));
end

subplot(2,2,k)
hold on
plot(1:12,   Pre_GSWP3_ts_sc,'k','linewidth',2)
plot(1:12,    [  Pre_GSWP3_ts_mglobal_sc],'b','linewidth',2)

plot(1:12,   [   Pre_GSWP3_ts_m10_sc],'r','linewidth',2)
set(gca,'xlim',[0.5,12.5])
set(gca,'xtick',[1:12],'xticklabel',{'Jan','','','Apr','','','Jul','','','Oct','',''})
text(1,y_abcd(k),name_abcd(k),'fontweight', 'bold')
%ltitle(title_name(k))
set(gca,'TickDir', 'out', 'YMinorTick', 'on')
if k==1
    t1=text(-2.2,20,'Precipitation (mm yr^-^1)');
    set(t1,'rotation',90)
    t2=text(13,-15.5,'Month')
    
end

%ylabel('Pre (mm month^-^1)')
%xlabel('Month')
if k==4
h1=legend({'GSWP3','Simple Linear','This study'});

legend('boxoff')

set(h1,'position',[0.624 0.7805 0.1296 0.1026]);
end
y11=[80,80,90,75];
y22=[60,65,70,60];
t11={'b','c','d','e'};
%{
for i=1:4
subplot(3,2,i+2)
hold on
plot(1901:2016,Pre_GSWP3_ts_seasonal(:,i),'k','linewidth',2)
plot(1901:2016,   Pre_GSWP3_ts_mglobal_seasonal(:,i),'b','linewidth',2)

plot(1901:2016,    Pre_GSWP3_ts_m10_seasonal(:,i),'r','linewidth',2)
plot([1950,1950],[y22(i),y11(i)],'k--')

set(gca,'xlim',[1900.5,2016.5])


set(gca,'TickDir', 'out', 'YMinorTick', 'on')
ylabel('Pre (mm month^-^1)')
xlabel('Year')
text(1904,y11(i),t11{i},'fontweight', 'bold')

end
%}
if k==3
    set(gca,'ylim',[38,220])
end
if k==1
    set(gca,'ylim',[40,75])
end
title(title_name(k))
end