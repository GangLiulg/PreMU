%% construct the PCA and getting the scores
clear
load('D:\RCMIP\Pre_GSWP3_1901_2016.mat') %1901-2016
load('D:\RCMIP\Tas_GSWP3_1901_2016.mat') %1901-2016

temp1=mean(Pre_GSWP3(:,:,948+1:1392),3)*12;
Pre_mean_116=temp1';

load('D:\RCMIP\Mask_land_05') % land mask
Mask_land_05(Pre_mean_116<200)=nan; %Eliminate arid areas

addpath('D:\RCMIP');
S1=area_weighted(360,720);
pre_GSWP3=Pre_GSWP3(:,:,1:1392); 
clear Pre_GSWP3
%
for i=1:600
    temp2=pre_GSWP3(:,:,i);
 temp1=Tas_GSWP3(:,:,i);
    pre_GSWP3_1(:,:,i)=temp2';
     tas_GSWP3_1(:,:,i)=temp1';  
end

k=1;
for i=1:72
    for j=1:144
       for  t=1:600
        temp1=tas_GSWP3_1(i*5-4:i*5,j*5-4:j*5,t);
        temp2=temp1(:);
        tmp_GSWP3_past_rd(k,t)=mean(temp2);
       end
    k=k+1;
    end
end

for i=1:792
    temp1=Tas_GSWP3(:,:,i+600);
    tas_GSWP3_rec_1(:,:,i)=temp1';  
end

k=1;
rand_2_2=floor(rand(1,90*180)*15)+1;
for i=1:72
    for j=1:144
       for  t=1:792
        temp1=tas_GSWP3_rec_1(i*5-4:i*5,j*5-4:j*5,t);
        temp2=temp1(:);
        tmp_GSWP3_rec_rd(k,t)=mean(temp2);
         
       end
    k=k+1;
    end
end
%
clear temp_tmp
temp_tmp(:,1,1)=tmp_GSWP3_past_rd(:,1);
temp_tmp(:,2,1)=mean(tmp_GSWP3_past_rd(:,1:2),2);
for k=1:49
    temp_tmp(:,1,k+1)=mean(tmp_GSWP3_past_rd(:,k*12-1:k*12+1),2);
    temp_tmp(:,2,k+1)=mean(tmp_GSWP3_past_rd(:,k*12:k*12+2),2);
end

for k=1:50
     for j=3:12
     temp_tmp(:,j,k)=mean(tmp_GSWP3_past_rd(:,k*12-12+j-2:k*12-12+j),2);
     end
end

%
temp_tmp(:,1,51)=(tmp_GSWP3_past_rd(:,599)+tmp_GSWP3_past_rd(:,600)+tmp_GSWP3_rec_rd(:,1))/3;
temp_tmp(:,2,51)=(tmp_GSWP3_past_rd(:,600)+tmp_GSWP3_rec_rd(:,1)+tmp_GSWP3_rec_rd(:,2))/3;
for k=1:65
    temp_tmp(:,1,k+51)=mean(tmp_GSWP3_rec_rd(:,k*12-1:k*12+1),2);
    temp_tmp(:,2,k+51)=mean(tmp_GSWP3_rec_rd(:,k*12:k*12+2),2);
end

for k=1:66
     for j=3:12
     temp_tmp(:,j,k+50)=mean(tmp_GSWP3_rec_rd(:,k*12-12+j-2:k*12-12+j),2);
     end
end

% PCA: using 1901-1950 to construct PCA coefficient and getting the scores for 1901-2016 
clear score_0116_3mon
for imon=1:12
    temp1=squeeze(temp_tmp(:,imon,:));
    [coeff,score,latent,tsquared,explained,mu] = pca(temp1(:,1:50)');
    score_0116_3mon(:,:,imon)=temp1'*coeff(:,1:10);
end
save('D:\RCMIP\score_0116_3mon.mat','score_0116_3mon','-v7.3')

