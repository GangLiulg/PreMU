%%
clear
load('D:\RCMIP\Pre_GSWP3_1901_2016.mat') %1901-2016
temp1=mean(Pre_GSWP3(:,:,949:1392),3)*12;
Pre_mean_116=temp1';
clear Pre_GSWP3
load('D:\RCMIP\Mask_land_05')
load('D:\RCMIP\Mask_land_25')

%Mask_land_05(Pre_mean_116<250)=nan;
Mask_land_25_1=Mask_land_25;

for i=1:72
    for j=1:144
        temp1=Pre_mean_116(i*5-4:i*5,j*5-4:j*5);
        if mean(temp1(:))<200
            Mask_land_25_1(i,j)=nan;  %Eliminate arid areas
        end
        
    end
end

load('D:\RCMIP\Tas_all_new.mat')
%
Tas_ssp126=Tas_all(:,:,:,:,1);
Tas_ssp585=Tas_all(:,:,:,:,4);
Tas_ssp245=Tas_all(:,:,:,:,2);
Tas_ssp370=Tas_all(:,:,:,:,3);

%
  for m=1:9
      Tas_model_126=Tas_ssp126(:,:,:,m);
            Tas_model_245=Tas_ssp245(:,:,:,m);
      Tas_model_370=Tas_ssp370(:,:,:,m);
      Tas_model_585=Tas_ssp585(:,:,:,m);

    for j=1:1032
        temp1=Tas_model_126(:,:,j);
        Tas_model_126_1(:,j)=temp1(:);
        temp1=Tas_model_585(:,:,j);
        Tas_model_585_1(:,j)=temp1(:);
           temp1=Tas_model_245(:,:,j);
        Tas_model_245_1(:,j)=temp1(:);
        temp1=Tas_model_370(:,:,j);
        Tas_model_370_1(:,j)=temp1(:);
       
    end

  
temp_tmp585(:,1,1)=Tas_model_585_1(:,1);
temp_tmp585(:,2,1)=mean(Tas_model_585_1(:,1:2),2);
for k=1:85
    temp_tmp585(:,1,k+1)=mean(Tas_model_585_1(:,k*12-1:k*12+1),2);
    temp_tmp585(:,2,k+1)=mean(Tas_model_585_1(:,k*12:k*12+2),2);


 
end
for k=1:86
     for j=3:12
     temp_tmp585(:,j,k)=mean(Tas_model_585_1(:,k*12-12+j-2:k*12-12+j),2);
     end
end
for imon=1:12
      temp1=squeeze(temp_tmp585(:,imon,:));
[coeff_1,score,latent,tsquared,explained,mu] = pca(temp1');
score_1500_ssp585(:,:,imon,m)=temp1'*coeff_1(:,1:10);
end

temp_tmp126(:,1,1)=Tas_model_126_1(:,1);
temp_tmp126(:,2,1)=mean(Tas_model_126_1(:,1:2),2);
for k=1:85
    temp_tmp126(:,1,k+1)=mean(Tas_model_126_1(:,k*12-1:k*12+1),2);
    temp_tmp126(:,2,k+1)=mean(Tas_model_126_1(:,k*12:k*12+2),2);


 
end
for k=1:86
     for j=3:12
     temp_tmp126(:,j,k)=mean(Tas_model_126_1(:,k*12-12+j-2:k*12-12+j),2);
     end
end
for imon=1:12
      temp1=squeeze(temp_tmp585(:,imon,:));
[coeff_1,score,latent,tsquared,explained,mu] = pca(temp1');
      temp1=squeeze(temp_tmp126(:,imon,:));
[coeff,score,latent,tsquared,explained,mu] = pca(temp1');
score_1500_ssp126(:,:,imon,m)=temp1'*coeff_1(:,1:10);
end
temp_tmp245(:,1,1)=Tas_model_245_1(:,1);
temp_tmp245(:,2,1)=mean(Tas_model_245_1(:,1:2),2);
for k=1:85
    temp_tmp245(:,1,k+1)=mean(Tas_model_245_1(:,k*12-1:k*12+1),2);
    temp_tmp245(:,2,k+1)=mean(Tas_model_245_1(:,k*12:k*12+2),2);


 
end
for k=1:86
     for j=3:12
     temp_tmp245(:,j,k)=mean(Tas_model_245_1(:,k*12-12+j-2:k*12-12+j),2);
     end
end
for imon=1:12
      temp1=squeeze(temp_tmp585(:,imon,:));
[coeff_1,score,latent,tsquared,explained,mu] = pca(temp1');
      temp1=squeeze(temp_tmp245(:,imon,:));
[coeff,score,latent,tsquared,explained,mu] = pca(temp1');
score_1500_ssp245(:,:,imon,m)=temp1'*coeff_1(:,1:10);
end
temp_tmp370(:,1,1)=Tas_model_370_1(:,1);
temp_tmp370(:,2,1)=mean(Tas_model_370_1(:,1:2),2);
for k=1:85
    temp_tmp370(:,1,k+1)=mean(Tas_model_370_1(:,k*12-1:k*12+1),2);
    temp_tmp370(:,2,k+1)=mean(Tas_model_370_1(:,k*12:k*12+2),2);


 
end
for k=1:86
     for j=3:12
     temp_tmp370(:,j,k)=mean(Tas_model_370_1(:,k*12-12+j-2:k*12-12+j),2);
     end
end
for imon=1:12
      temp1=squeeze(temp_tmp585(:,imon,:));
[coeff_1,score,latent,tsquared,explained,mu] = pca(temp1');
      temp1=squeeze(temp_tmp370(:,imon,:));
[coeff,score,latent,tsquared,explained,mu] = pca(temp1');
score_1500_ssp370(:,:,imon,m)=temp1'*coeff_1(:,1:10);
end


  end

save('D:\RCMIP\score_1500_ssp_3mon_new.mat','score_1500_ssp126','-v7.3')
save('D:\RCMIP\score_1500_ssp_3mon_new.mat','score_1500_ssp245','-append')
save('D:\RCMIP\score_1500_ssp_3mon_new.mat','score_1500_ssp370','-append')
save('D:\RCMIP\score_1500_ssp_3mon_new.mat','score_1500_ssp585','-append')