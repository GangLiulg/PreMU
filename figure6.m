%% Fig6
% please run Cal_ESMs_2.m before running this code
Model_name={'UKESM1-0-LL','MPI-ESM1-2-LR','MIROC6','IPSL-CM6A-LR','GFDL-ESM4','EC-Earth3','CanESM5','CESM2','ACCESS-ESM1-5'};
figure
set(gcf,'unit','centimeters','position',[2,2,15,12]);
name_ai={'a','b','c','d','e','f','g','h','i'};
for i=1:9
    subplot(3,3,i)
    hold on
    plot(2015:2100,Pre_model_126_yr(:,i)-mean(Pre_model_126_yr(:,i)),'k','linewidth',1.5)
    plot(2015:2100,Pre_b585_126_m10_yr(:,i)-mean(Pre_b585_126_m10_yr(:,i)),'r','linewidth',1.5)
  set(gca,'xlim',[2014.5,2100.5],'ylim',[-52,52],'xtick',[2020:40:2100])
text(2017,52,name_ai(i),'fontweight', 'bold')
if i==1
  legend({'ESM', 'PREMU'})
  legend('boxoff')
  
  
end
%ylabel('Pre (mm yr^-^1)')
if i==8
xlabel('Year')
end
if i==4
    t1=text(1990,-70,'Precipitation (mm yr^-^1)');
    set(t1,'rotation',90)
end

title(Model_name{i})

end
