%% Calibration and Validation
% please run Cal_GSWP3_1.m before running this code
clear
load('D:\RCMIP\Pre_GSWP3_1901_2016.mat') %1901-2016
load('D:\RCMIP\Tas_GSWP3_1901_2016.mat') %1901-2016
load('D:\RCMIP\score_0116_3mon.mat')
temp1=mean(Pre_GSWP3(:,:,948+1:1392),3)*12;
Pre_mean_116=temp1';
load('D:\RCMIP\Mask_land_05')
Mask_land_05(Pre_mean_116<200)=nan;
addpath('D:\RCMIP');
S1=area_weighted(360,720);
pre_GSWP3=Pre_GSWP3(:,:,1:1392); 
clear Pre_GSWP3
for i=1:600
    temp2=pre_GSWP3(:,:,i);
 temp1=Tas_GSWP3(:,:,i);
    pre_GSWP3_1(:,:,i)=temp2';
     tas_GSWP3_1(:,:,i)=temp1'; 
end

% regression coefficients
Pre_k_ot=nan(360,720,11,12); 
Pre_p_ot=nan(360,720,12);
Pre_R2_ot=nan(360,720,12);
for imon=1:12
score_1=score_0116_3mon(1:50,:,imon);
clear temp1 temp2
for i=1:360
    for j=1:720
        if ~isnan(pre_GSWP3_1(i,j,1))
        temp1(:)=pre_GSWP3_1(i,j,imon:12:600);
        [a,~,~,~,p]=regress(temp1',[score_1,ones(50,1)]);
        Pre_k_ot(i,j,:,imon)=a;
        Pre_p_ot(i,j,imon)=p(3);
        Pre_R2_ot(i,j,imon)=p(1);
        end
    end
end
end

% Simple linear regresssion coefficients

tmp_GSWP3_past_global=squeeze(sum(sum(tas_GSWP3_1.*S1)))/sum(sum(S1));
for k=1:50
    tmp_GSWP3_past_global_yr(k)=mean(tmp_GSWP3_past_global(k*12-11:k*12));
end

Pre_k_ot_global=nan(360,720,2,12); 
Pre_p_ot_global=nan(360,720,12);
Pre_R2_ot_global=nan(360,720,12);
clear temp1
for i=1:360
    for j=1:720
        
        
        if ~isnan(pre_GSWP3_1(i,j,1))
            for k=1:12
        temp1(:)=pre_GSWP3_1(i,j,k:12:600);
        [a,~,~,~,p]=regress(temp1',[tmp_GSWP3_past_global_yr',ones(600/12,1)]);
        Pre_k_ot_global(i,j,:,k)=a;
        Pre_p_ot_global(i,j,k)=p(3);
        Pre_R2_ot_global(i,j,k)=p(1);
            end
        end
        
    end
end

% validiation
for i=1:792
    temp2=pre_GSWP3(:,:,i+600);
    temp1=Tas_GSWP3(:,:,i+600);
    pre_GSWP3_rec_1(:,:,i)=temp2';
    tas_GSWP3_rec_1(:,:,i)=temp1';
end



Pre_rec_GSWP3_m10=nan(360,720,792); % predicted by PREMU
Pre_rec_GSWP3_mglobal=nan(360,720,792); % predicrted by simple linear method
for imon=1:12
  
score_rec_1=score_0116_3mon(51:116,:,imon);
score_1=score_0116_3mon(1:50,:,imon);

for i=1:360
    for j=1:720
 
Pre_rec_GSWP3_m10(i,j,imon:12:792)=max(squeeze(squeeze(Pre_k_ot(i,j,:,imon)))'*[score_rec_1,ones(66,1)]',0);
Pre_past_GSWP3_m10(i,j,imon:12:600)=max(squeeze(squeeze(Pre_k_ot(i,j,:,imon)))'*[score_1,ones(50,1)]',0);
    end
    
end
end
%tmp_GSWP3_rec_global=squeeze(mean(mean(tas_GSWP3_rec_1.*S1)))/mean(mean(S1));
tmp_GSWP3_rec_global=squeeze(sum(sum(tas_GSWP3_rec_1.*S1)))/sum(sum(S1));
for k=1:66
    tmp_GSWP3_rec_global_yr(k)=mean(tmp_GSWP3_rec_global(k*12-11:k*12));
end

for i=1:360
    for j=1:720
for k=1:12
Pre_rec_GSWP3_mglobal(i,j,k:12:792)=max(squeeze(squeeze(Pre_k_ot_global(i,j,:,k)))'*[tmp_GSWP3_rec_global_yr',ones(792/12,1)]',0);
Pre_past_GSWP3_mglobal(i,j,k:12:600)=max(squeeze(squeeze(Pre_k_ot_global(i,j,:,k)))'*[tmp_GSWP3_past_global_yr',ones(600/12,1)]',0);
end
    end
end

% calculate global average temperature
Pre_GSWP3_ts_7920=squeeze(nansum(nansum(pre_GSWP3_rec_1.*Mask_land_05.*S1)))/(nansum(nansum(S1.*Mask_land_05)));
Pre_GSWP3_ts_7920_past=squeeze(nansum(nansum(pre_GSWP3_1.*Mask_land_05.*S1)))/(nansum(nansum(S1.*Mask_land_05)));

for k=1:12
    temp1=squeeze(Pre_GSWP3_ts_7920_past(k:12:600));
    score_1=score_0116_3mon(1:50,:,k);
    [a,~,~,~,p]=regress(temp1,[score_1,ones(50,1)]);
    Pre_predict_global(k:12:1392)=[score_0116_3mon(:,:,k),ones(116,1)]*a;
end
    
    Pre_GSWP3_ts_m10_7920=squeeze(nansum(nansum(Pre_rec_GSWP3_m10.*Mask_land_05.*S1))/(nansum(nansum(S1.*Mask_land_05))));
Pre_GSWP3_ts_m10_7920_past=squeeze(nansum(nansum(Pre_past_GSWP3_m10.*Mask_land_05.*S1))/(nansum(nansum(S1.*Mask_land_05))));

% scale gridded precipitation
for i=1:600
    Pre_past_GSWP3_m10(:,:,i)=Pre_past_GSWP3_m10(:,:,i)*Pre_predict_global(i)/Pre_GSWP3_ts_m10_7920_past(i);
end
for i=1:792
    Pre_rec_GSWP3_m10(:,:,i)=Pre_rec_GSWP3_m10(:,:,i)*Pre_predict_global(i+600)/Pre_GSWP3_ts_m10_7920(i);
end




% calculate for figure
Pre_GSWP3_ts_7920=squeeze(nansum(nansum(pre_GSWP3_rec_1.*Mask_land_05.*S1)))/(nansum(nansum(S1.*Mask_land_05)));
Pre_GSWP3_ts_7920_past=squeeze(nansum(nansum(pre_GSWP3_1.*Mask_land_05.*S1)))/(nansum(nansum(S1.*Mask_land_05)));

Pre_GSWP3_ts_m10_7920=squeeze(nansum(nansum(Pre_rec_GSWP3_m10.*Mask_land_05.*S1))/(nansum(nansum(S1.*Mask_land_05))));
Pre_GSWP3_ts_m10_7920_past=squeeze(nansum(nansum(Pre_past_GSWP3_m10.*Mask_land_05.*S1))/(nansum(nansum(S1.*Mask_land_05))));

Pre_GSWP3_ts_mglobal_7920= squeeze(nansum(nansum(Pre_rec_GSWP3_mglobal.*Mask_land_05.*S1))/(nansum(nansum(S1.*Mask_land_05))));
Pre_GSWP3_ts_mglobal_7920_past= squeeze(nansum(nansum(Pre_past_GSWP3_mglobal.*Mask_land_05.*S1))/(nansum(nansum(S1.*Mask_land_05))));

for i=1:792/12
    Pre_GSWP3_ts_7920_yr(i)=sum(Pre_GSWP3_ts_7920(i*12-11:i*12));
    Pre_GSWP3_ts_m10_7920_yr(i)=sum(Pre_GSWP3_ts_m10_7920(i*12-11:i*12));
        Pre_GSWP3_ts_mglobal_7920_yr(i)=sum(Pre_GSWP3_ts_mglobal_7920(i*12-11:i*12));
        
        
end

for i=1:600/12
        Pre_GSWP3_ts_7920_yr_past(i)=sum(Pre_GSWP3_ts_7920_past(i*12-11:i*12));

    Pre_GSWP3_ts_m10_7920_yr_past(i)=sum(Pre_GSWP3_ts_m10_7920_past(i*12-11:i*12));
        Pre_GSWP3_ts_mglobal_7920_yr_past(i)=sum(Pre_GSWP3_ts_mglobal_7920_past(i*12-11:i*12));
       
        
end

Pre_GSWP3_1120=mean(pre_GSWP3_rec_1(:,:,433:504+288).*Mask_land_05,3)*12;
Pre_GSWP3_m10_1120=mean(Pre_rec_GSWP3_m10(:,:,433:504+288).*Mask_land_05,3)*12;
%Pre_GSWP3_m10_1120_past=mean(Pre_past_GSWP3_m10_1(:,:,385+288:504+288).*Mask_land_05,3)*12;

Pre_GSWP3_mglobal_1120=mean(Pre_rec_GSWP3_mglobal(:,:,433:504+288).*Mask_land_05,3)*12;
Pre_compare_GSWP3_m10_1120=(Pre_GSWP3_m10_1120-Pre_GSWP3_1120)./Pre_GSWP3_1120*100;
Pre_compare_GSWP3_mglobal_1120=(Pre_GSWP3_mglobal_1120-Pre_GSWP3_1120)./Pre_GSWP3_1120*100;

Pre_GSWP3_ts_m10_7920_new=squeeze(nansum(nansum(Pre_rec_GSWP3_m10.*Mask_land_05.*S1))/(nansum(nansum(S1.*Mask_land_05))));
Pre_GSWP3_ts_m10_7920_new_past=squeeze(nansum(nansum(Pre_past_GSWP3_m10.*Mask_land_05.*S1))/(nansum(nansum(S1.*Mask_land_05))));

for i=1:792/12
    Pre_GSWP3_ts_m10_7920_yr_new(i)=sum(Pre_GSWP3_ts_m10_7920_new(i*12-11:i*12));

end
for i=1:600/12
    Pre_GSWP3_ts_m10_7920_yr_new_past(i)=sum(Pre_GSWP3_ts_m10_7920_new_past(i*12-11:i*12));

end