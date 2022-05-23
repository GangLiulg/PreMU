%%  
% please run Cal_ESMs_1.m before running this code

clear
load('D:\RCMIP\Pre_GSWP3_1901_2016.mat') %1901-2016
temp1=mean(Pre_GSWP3(:,:,949:1392),3)*12;
Pre_mean_116=temp1';
load('D:\RCMIP\score_1500_ssp_3mon_new.mat')
clear Pre_GSWP3
load('D:\RCMIP\Mask_land_05')
load('D:\RCMIP\Mask_land_25')

Mask_land_25_1=Mask_land_25;

for i=1:72
    for j=1:144
        temp1=Pre_mean_116(i*5-4:i*5,j*5-4:j*5);
        if mean(temp1(:))<200
            Mask_land_25_1(i,j)=nan;
        end
        
    end
end

load('D:\RCMIP\Tas_all_new.mat')

Tas_ssp126=Tas_all(:,:,:,:,1);
Tas_ssp585=Tas_all(:,:,:,:,4);
Tas_ssp245=Tas_all(:,:,:,:,2);
Tas_ssp370=Tas_all(:,:,:,:,3);
clear Tas_all
load('D:\RCMIP\Pre_all_new.mat')
Pre_ssp126=Pre_all(:,:,:,:,1)*3600*24*30;
Pre_ssp585=Pre_all(:,:,:,:,4)*3600*24*30;
Pre_ssp245=Pre_all(:,:,:,:,2)*3600*24*30;
Pre_ssp370=Pre_all(:,:,:,:,3)*3600*24*30;
clear Pre_all
load('D:\RCMIP\Mask_land_25.mat')
Mask_1=rot90(rot90(rot90(Mask_land_25_1)));
Mask_2(1:72,:)=Mask_1(73:144,:);
Mask_2(73:144,:)=Mask_1(1:72,:);
S0=rot90(rot90(rot90(area_weighted(72,144))));
S1(1:72,:)=S0(73:144,:);
S1(73:144,:)=S0(1:72,:);


%

for imodel=1:9
    imodel
    Tas_model_126=Tas_ssp126(:,:,:,imodel);
    Tas_model_585=Tas_ssp585(:,:,:,imodel);
    Tas_model_245=Tas_ssp245(:,:,:,imodel);
    Tas_model_370=Tas_ssp370(:,:,:,imodel);
    
     Pre_model_126=Pre_ssp126(:,:,:,imodel);
    Pre_model_585=Pre_ssp585(:,:,:,imodel);
    Pre_model_245=Pre_ssp245(:,:,:,imodel);
    Pre_model_370=Pre_ssp370(:,:,:,imodel);
    for iyr=1:86
          Pre_model_126_yr(iyr,imodel)=nansum(nansum(nansum(Pre_model_126(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
 Pre_model_245_yr(iyr,imodel)=nansum(nansum(nansum(Pre_model_245(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
 Pre_model_370_yr(iyr,imodel)=nansum(nansum(nansum(Pre_model_370(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
           Pre_model_585_yr(iyr,imodel)=nansum(nansum(nansum(Pre_model_585(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
    end
    
    for j=1:1032
        temp1=Tas_model_126(:,:,j);
        Tas_model_126_1(:,j)=temp1(:);
        temp1=Tas_model_585(:,:,j);
        Tas_model_585_1(:,j)=temp1(:);
        
          temp1=Pre_model_126(:,:,j);
        Pre_model_126_1(:,j)=temp1(:);
        temp1=Pre_model_585(:,:,j);
        Pre_model_585_1(:,j)=temp1(:);
    end

score_2=score_1500_ssp585(:,:,:,imodel);

clear temp1 temp2


Pre_k_585=nan(144,72,11,12); %61个系数
Pre_p_585=nan(144,72);
Pre_R2_585=nan(144,72);
for i=1:144
    for j=1:72
        for imon=1:12
     
            temp1(:)=Pre_model_585(i,j,imon:12:1032);
        [a,~,~,~,p]=regress(temp1',[score_2(:,1:10,imon),ones(86,1)]);
        Pre_k_585(i,j,:,imon)=a;
        Pre_p_585(i,j)=p(3);
        Pre_R2_585(i,j)=p(1);
        end
        
    end
end





score_b585_245=score_1500_ssp245(:,:,:,imodel);
score_b585_370=score_1500_ssp370(:,:,:,imodel);
score_b585_126=score_1500_ssp126(:,:,:,imodel);
score_b585_585=score_1500_ssp585(:,:,:,imodel);

for i=1:144
    for j=1:72
        for imon=1:12

Pre_b585_585_m10(i,j,imon:12:1032)=squeeze(squeeze(Pre_k_585(i,j,:,imon)))'*[score_b585_585(:,1:10,imon),ones(86,1)]';

Pre_b585_245_m10(i,j,imon:12:1032)=squeeze(squeeze(Pre_k_585(i,j,:,imon)))'*[score_b585_245(:,1:10,imon),ones(86,1)]';
Pre_b585_370_m10(i,j,imon:12:1032)=squeeze(squeeze(Pre_k_585(i,j,:,imon)))'*[score_b585_370(:,1:10,imon),ones(86,1)]';
Pre_b585_126_m10(i,j,imon:12:1032)=squeeze(squeeze(Pre_k_585(i,j,:,imon)))'*[score_b585_126(:,1:10,imon),ones(86,1)]';
        end
    end
end

Pre_b585_245_m10(Pre_b585_245_m10<0)=0;
Pre_b585_370_m10(Pre_b585_370_m10<0)=0;
Pre_b585_126_m10(Pre_b585_126_m10<0)=0;
Pre_b585_585_m10(Pre_b585_585_m10<0)=0;

 for iyr=1:86

  Pre_b585_245_m10_yr(iyr,imodel)=nansum(nansum(nansum(Pre_b585_245_m10(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
  Pre_b585_370_m10_yr(iyr,imodel)=nansum(nansum(nansum(Pre_b585_370_m10(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
  Pre_b585_126_m10_yr(iyr,imodel)=nansum(nansum(nansum(Pre_b585_126_m10(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
    Pre_b585_585_m10_yr(iyr,imodel)=nansum(nansum(nansum(Pre_b585_585_m10(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));

  
 
 end

 
  for iyr=1:1032
          Pre_model_126_imon(iyr,imodel)=nansum(nansum(nansum(Pre_model_126(:,:,iyr).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
 Pre_model_245_imon(iyr,imodel)=nansum(nansum(Pre_model_245(:,:,iyr).*Mask_2.*S1))/nansum(nansum(S1.*Mask_2));
 Pre_model_370_imon(iyr,imodel)=nansum(nansum(Pre_model_370(:,:,iyr).*Mask_2.*S1))/nansum(nansum(S1.*Mask_2));
           Pre_model_585_imon(iyr,imodel)=nansum(nansum(Pre_model_585(:,:,iyr).*Mask_2.*S1))/nansum(nansum(S1.*Mask_2));
  end
 
     
  for iyr=1:1032
       Pre_b585_126_m10_imon(iyr,imodel)=nansum(nansum(Pre_b585_126_m10(:,:,iyr).*Mask_2.*S1))/nansum(nansum(S1.*Mask_2));
 Pre_b585_245_m10_imon(iyr,imodel)=nansum(nansum(Pre_b585_245_m10(:,:,iyr).*Mask_2.*S1))/nansum(nansum(S1.*Mask_2));
Pre_b585_370_m10_imon(iyr,imodel)=nansum(nansum(Pre_b585_370_m10(:,:,iyr).*Mask_2.*S1))/nansum(nansum(S1.*Mask_2));
        Pre_b585_585_m10_imon(iyr,imodel)=nansum(nansum(Pre_b585_585_m10(:,:,iyr).*Mask_2.*S1))/nansum(nansum(S1.*Mask_2));
  end
 temp1=nan(86,1);
  for k=1:12
    temp1(:)=squeeze(Pre_model_585_imon(k:12:1032,imodel));
    score_1=score_1500_ssp585(:,:,k,imodel);
    [a,~,~,~,p]=regress(temp1,[score_1,ones(86,1)]);
    Pre_predict_global_ssp585(k:12:1032)=[score_1500_ssp585(:,:,k,imodel),ones(86,1)]*a;
    Pre_predict_global_ssp126(k:12:1032)=[score_1500_ssp126(:,:,k,imodel),ones(86,1)]*a;
    Pre_predict_global_ssp245(k:12:1032)=[score_1500_ssp245(:,:,k,imodel),ones(86,1)]*a;
    Pre_predict_global_ssp370(k:12:1032)=[score_1500_ssp370(:,:,k,imodel),ones(86,1)]*a;
  end
  
 
 
   c_b585(:,1)=Pre_b585_126_m10_imon(:,imodel)./Pre_predict_global_ssp126';
 c_b585(:,2)=Pre_b585_245_m10_imon(:,imodel)./ Pre_predict_global_ssp245';
  c_b585(:,3)=Pre_b585_370_m10_imon(:,imodel)./ Pre_predict_global_ssp370';
    c_b585(:,4)=Pre_b585_585_m10_imon(:,imodel)./ Pre_predict_global_ssp585';

for i=1:72
    for j=1:144
        for iyr=1:86
            for imon=1:12
    
       Pre_b585_126_m10(j,i,iyr*12-12+imon)=  Pre_b585_126_m10(j,i,iyr*12-12+imon)/c_b585(iyr*12-12+imon,1);
       Pre_b585_245_m10(j,i,iyr*12-12+imon)=  Pre_b585_245_m10(j,i,iyr*12-12+imon)/c_b585(iyr*12-12+imon,2);
       Pre_b585_370_m10(j,i,iyr*12-12+imon)=  Pre_b585_370_m10(j,i,iyr*12-12+imon)/c_b585(iyr*12-12+imon,3);
        Pre_b585_585_m10(j,i,iyr*12-12+imon)=  Pre_b585_585_m10(j,i,iyr*12-12+imon)/c_b585(iyr*12-12+imon,3);

            end
        end
    end
end

  
 

      for iyr=1:86
  
  Pre_b585_245_m10_yr(iyr,imodel)=nansum(nansum(nansum(Pre_b585_245_m10(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
  Pre_b585_370_m10_yr(iyr,imodel)=nansum(nansum(nansum(Pre_b585_370_m10(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
  Pre_b585_126_m10_yr(iyr,imodel)=nansum(nansum(nansum(Pre_b585_126_m10(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));
    Pre_b585_585_m10_yr(iyr,imodel)=nansum(nansum(nansum(Pre_b585_585_m10(:,:,iyr*12-11:iyr*12).*Mask_2.*S1)))/nansum(nansum(S1.*Mask_2));

  
 
 end


Pre_model_126_9100=mean(Pre_model_126(:,:,1032-360+1:1032).*Mask_2,3)*12;
Pre_model_245_9100=mean(Pre_model_245(:,:,1032-360+1:1032).*Mask_2,3)*12;
Pre_model_370_9100=mean(Pre_model_370(:,:,1032-360+1:1032).*Mask_2,3)*12;
Pre_model_585_9100=mean(Pre_model_585(:,:,1032-360+1:1032).*Mask_2,3)*12;


Pre_b585_245_m10_9100=mean(Pre_b585_245_m10(:,:,1032-360+1:1032).*Mask_2,3)*12;
Pre_b585_370_m10_9100=mean(Pre_b585_370_m10(:,:,1032-360+1:1032).*Mask_2,3)*12;
Pre_b585_126_m10_9100=mean(Pre_b585_126_m10(:,:,1032-360+1:1032).*Mask_2,3)*12;
Pre_b585_585_m10_9100=mean(Pre_b585_585_m10(:,:,1032-360+1:1032).*Mask_2,3)*12;



Pre_compare_b585_245_m10_9100(:,:,imodel)=(Pre_b585_245_m10_9100-Pre_model_245_9100)./Pre_model_245_9100*100;
Pre_compare_b585_370_m10_9100(:,:,imodel)=(Pre_b585_370_m10_9100-Pre_model_370_9100)./Pre_model_370_9100*100;
Pre_compare_b585_126_m10_9100(:,:,imodel)=(Pre_b585_126_m10_9100-Pre_model_126_9100)./Pre_model_126_9100*100;
Pre_compare_b585_585_m10_9100(:,:,imodel)=(Pre_b585_585_m10_9100-Pre_model_585_9100)./Pre_model_585_9100*100;




Pre_rec_b585_245_m10(:,:,:,imodel)=Pre_b585_245_m10.*Mask_2;
Pre_rec_b585_370_m10(:,:,:,imodel)=Pre_b585_370_m10.*Mask_2;
Pre_rec_b585_126_m10(:,:,:,imodel)=Pre_b585_126_m10.*Mask_2;
Pre_rec_b585_585_m10(:,:,:,imodel)=Pre_b585_585_m10.*Mask_2;

Pre_126(:,:,:,imodel)=Pre_model_126.*Mask_2;
Pre_245(:,:,:,imodel)=Pre_model_245.*Mask_2;
Pre_370(:,:,:,imodel)=Pre_model_370.*Mask_2;
Pre_585(:,:,:,imodel)=Pre_model_585.*Mask_2;


end





%%
clear Cor
for i=1:9
temp1=corr(Pre_model_126_yr(:,i),Pre_b585_126_m10_yr(:,i));
Cor(i,1)=temp1;
temp1=corr(Pre_model_245_yr(:,i),Pre_b585_245_m10_yr(:,i));
Cor(i,2)=temp1;
temp1=corr(Pre_model_370_yr(:,i),Pre_b585_370_m10_yr(:,i));
Cor(i,3)=temp1;
temp1=corr(Pre_model_585_yr(:,i),Pre_b585_585_m10_yr(:,i));
Cor(i,4)=temp1;

end

clear STD_1
for i=1:9
temp1=std(Pre_b585_126_m10_yr(:,i));
STD_1(i,1)=temp1;
temp1=std(Pre_b585_245_m10_yr(:,i));
STD_1(i,2)=temp1;
temp1=std(Pre_b585_370_m10_yr(:,i));
STD_1(i,3)=temp1;
temp1=std(Pre_b585_585_m10_yr(:,i));
STD_1(i,4)=temp1;

end

clear STD_0
for i=1:9
temp1=std(Pre_model_126_yr(:,i));
STD_0(i,1)=temp1;
temp1=std(Pre_model_245_yr(:,i));
STD_0(i,2)=temp1;
temp1=std(Pre_model_370_yr(:,i));
STD_0(i,3)=temp1;
temp1=std(Pre_model_585_yr(:,i));
STD_0(i,4)=temp1;

end




