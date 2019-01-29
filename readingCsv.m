
datIMU= csvread('1503510449718_IMU_fork.csv');
[r,c]=size(datIMU);

datIMU_1=datIMU(:,1);
datIMU_2=datIMU(:,2);
datIMU_3=datIMU(:,3);
datIMU_4=datIMU(:,4);
datIMU_5=datIMU(:,5);
datIMU_6=datIMU(:,6);
datIMU_7=datIMU(:,7);
datIMU_8=datIMU(:,8);
datIMU_9=datIMU(:,9);
datIMU_10=datIMU(:,10);
datIMU_11=datIMU(:,11);
[rtemp,ctemp]=size(datIMU_11);
temp_extraIMU=zeros(12353,1);

datIMU_new=horzcat(datIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU);

datEMG=csvread('1503510449718_EMG_fork.csv');

[r1,c1]=size(datEMG);

datEMG_1=datEMG(:,1);
datEMG_2=datEMG(:,2);
datEMG_3=datEMG(:,3);
datEMG_4=datEMG(:,4);
datEMG_5=datEMG(:,5);
datEMG_6=datEMG(:,6);
datEMG_7=datEMG(:,7);
datEMG_8=datEMG(:,8);
datEMG_9=datEMG(:,9);

[rtempEMG,ctempEMG]=size(datEMG_9);
temp_extra1EMG=zeros(25323,1);

datEMG_new=horzcat(datEMG_1, temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,datEMG_2,datEMG_3,datEMG_4,datEMG_5,datEMG_6,datEMG_7,datEMG_8,datEMG_9);

dat_IMU_EMG_new=vertcat(datIMU_new, datEMG_new);

dat_IMU_EMG_sorted=sortrows(dat_IMU_EMG_new);

[rdat_IMU_EMG_sorted, cdat_IMU_EMG_sorted]=size(dat_IMU_EMG_sorted);

datGT=csvread('1503510449718_groundTruth_fork.csv');

[rGT, cGT]=size(datGT);
fulleating=[];
for i= 1:rGT
    
    fr=datGT(i,1);
    to=datGT(i,2);
    eating=fr:1:to;
    eating=transpose(eating);
    fulleating=vertcat(fulleating,eating);
    
end
[rfullEating, cfullEating]=size(fulleating);

for i = 1:rfullEating
    fulleating(i)=floor(fulleating(i)*1.667);
end

annotations=[];

eatingMat=[];
noneatingMat=[];

for i= 1:rdat_IMU_EMG_sorted
   
    if ismember(i,fulleating)
        eatingMat=vertcat(eatingMat,dat_IMU_EMG_sorted(i,:));
        annotations(i)=1;
    else
        noneatingMat=vertcat(noneatingMat,dat_IMU_EMG_sorted(i,:));
        annotations(i)=0;
    end
end
annotations=transpose(annotations);
dat_IMU_EMG_sorted=horzcat(dat_IMU_EMG_sorted,annotations);
disp(dat_IMU_EMG_sorted);


 OriXData = dat_IMU_EMG_sorted(:,2);
 OriXDataNorm = ( OriXData  - min( OriXData  ) ) / ( max(OriXData) - min(OriXData) );
 res=rms(OriXDataNorm);
 disp(res)

 %Normalization for eating matrix column by column
 
 Col2 = eatingMat(:,2);
 Col2Norm = (Col2-min(Col2)) / (max(Col2)-min(Col2));
 resCol2=rms(Col2Norm)

  Col3 = eatingMat(:,3);
 Col3Norm = (Col3-min(Col3)) / (max(Col3)-min(Col3));
 resCol3=rms(Col3Norm)
 
  Col4 = eatingMat(:,4);
 Col4Norm = (Col4-min(Col4)) / (max(Col4)-min(Col4));
 resCol4=rms(Col4Norm)
 
  Col5 = eatingMat(:,5);
 Col5Norm = (Col5-min(Col5)) / (max(Col5)-min(Col5));
 resCol5=rms(Col5Norm)
 
  Col6 = eatingMat(:,6);
 Col6Norm = (Col6-min(Col6)) / (max(Col6)-min(Col6));
 resCol6=rms(Col6Norm)
 
  Col7 = eatingMat(:,7);
 Col7Norm = (Col7-min(Col7)) / (max(Col7)-min(Col7));
 resCol7=rms(Col7Norm)
 
  Col8 = eatingMat(:,8);
 Col8Norm = (Col8-min(Col8)) / (max(Col8)-min(Col8));
 resCol8=rms(Col8Norm)
 
  Col9 = eatingMat(:,9);
 Col9Norm = (Col9-min(Col9)) / (max(Col9)-min(Col9));
 resCol9=rms(Col9Norm)
 
  Col10 = eatingMat(:,10);
 Col10Norm = (Col10-min(Col10)) / (max(Col10)-min(Col10));
 resCol10=rms(Col10Norm)
 
  Col11 = eatingMat(:,11);
 Col11Norm = (Col11-min(Col11)) / (max(Col11)-min(Col11));
 resCol11=rms(Col11Norm)
 
  Col12 = eatingMat(:,12);
 Col12Norm = (Col12-min(Col12)) / (max(Col12)-min(Col12));
 resCol12=rms(Col12Norm)
 
  Col13 = eatingMat(:,13);
 Col13Norm = (Col13-min(Col13)) / (max(Col13)-min(Col13));
 resCol13=rms(Col13Norm)
 
  Col14 = eatingMat(:,14);
 Col14Norm = (Col14-min(Col14)) / (max(Col14)-min(Col14));
 resCol14=rms(Col14Norm)
 
  Col15 = eatingMat(:,15);
 Col15Norm = (Col15-min(Col15)) / (max(Col15)-min(Col15));
 resCol15=rms(Col15Norm)
 
  Col16 = eatingMat(:,16);
 Col16Norm = (Col16-min(Col16)) / (max(Col16)-min(Col16));
 resCol16=rms(Col16Norm)
 
  Col17 = eatingMat(:,17);
 Col17Norm = (Col17-min(Col17)) / (max(Col17)-min(Col17));
 resCol17=rms(Col17Norm)
 
  Col18 = eatingMat(:,18);
 Col18Norm = (Col18-min(Col18)) / (max(Col18)-min(Col18));
 resCol18=rms(Col18Norm)
 

 
 %Non eating:
  Col2_ne = noneatingMat(:,2);
 Col2Norm_ne = (Col2_ne-min(Col2_ne)) / (max(Col2_ne)-min(Col2_ne));
 resCol2_ne=rms(Col2Norm_ne)

  Col3_ne = noneatingMat(:,3);
 Col3Norm_ne = (Col3_ne-min(Col3_ne)) / (max(Col3_ne)-min(Col3_ne));
 resCol3_ne=rms(Col3Norm_ne)
 
  Col4_ne = noneatingMat(:,4);
 Col4Norm_ne = (Col4_ne-min(Col4_ne)) / (max(Col4_ne)-min(Col4_ne));
 resCol4_ne=rms(Col4Norm_ne)
 
  Col5_ne = noneatingMat(:,5);
 Col5Norm_ne = (Col5_ne-min(Col5_ne)) / (max(Col5_ne)-min(Col5_ne));
 resCol5_ne=rms(Col5Norm_ne)
 
  Col6_ne = noneatingMat(:,6);
 Col6Norm_ne = (Col6_ne-min(Col6_ne)) / (max(Col6_ne)-min(Col6_ne));
 resCol6_ne=rms(Col6Norm_ne)
 
  Col7_ne = noneatingMat(:,7);
 Col7Norm_ne = (Col7_ne-min(Col7_ne)) / (max(Col7_ne)-min(Col7_ne));
 resCol7_ne=rms(Col7Norm_ne)
 
  Col8_ne = noneatingMat(:,8);
 Col8Norm_ne = (Col8_ne-min(Col8_ne)) / (max(Col8_ne)-min(Col8_ne));
 resCol8_ne=rms(Col8Norm_ne)
 
  Col9_ne = noneatingMat(:,9);
 Col9Norm_ne = (Col9_ne-min(Col9_ne)) / (max(Col9_ne)-min(Col9_ne));
 resCol9_ne=rms(Col9Norm_ne)
 
  Col10_ne = noneatingMat(:,10);
 Col10Norm_ne = (Col10_ne-min(Col10_ne)) / (max(Col10_ne)-min(Col10_ne));
 resCol10_ne=rms(Col10Norm_ne)
 
  Col11_ne = noneatingMat(:,11);
 Col11Norm_ne = (Col11_ne-min(Col11_ne)) / (max(Col11_ne)-min(Col11_ne));
 resCol11_ne=rms(Col11Norm_ne)
 
  Col12_ne = noneatingMat(:,12);
 Col12Norm_ne = (Col12_ne-min(Col12_ne)) / (max(Col12_ne)-min(Col12_ne));
 resCol12_ne=rms(Col12Norm_ne)
 
  Col13_ne = noneatingMat(:,13);
 Col13Norm_ne = (Col13_ne-min(Col13_ne)) / (max(Col13_ne)-min(Col13_ne));
 resCol13_ne=rms(Col13Norm_ne)
 
  Col14_ne = eatingMat(:,14);
 Col14Norm_ne = (Col14_ne-min(Col14_ne)) / (max(Col14_ne)-min(Col14_ne));
 resCol14_ne=rms(Col14Norm_ne)
 
  Col15_ne = noneatingMat(:,15);
 Col15Norm_ne = (Col15_ne-min(Col15_ne)) / (max(Col15_ne)-min(Col15_ne));
 resCol15_ne=rms(Col15Norm_ne)
 
  Col16_ne = noneatingMat(:,16);
 Col16Norm_ne = (Col16_ne-min(Col16_ne)) / (max(Col16_ne)-min(Col16_ne));
 resCol16_ne=rms(Col16Norm_ne)
 
  Col17_ne = noneatingMat(:,17);
 Col17Norm_ne = (Col17_ne-min(Col17_ne)) / (max(Col17_ne)-min(Col17_ne));
 resCol17_ne=rms(Col17Norm_ne)
 
  Col18_ne = noneatingMat(:,18);
 Col18Norm_ne = (Col18_ne-min(Col18_ne)) / (max(Col18_ne)-min(Col18_ne));
 resCol18_ne=rms(Col18Norm_ne)

 %For eating graph rms:
 
 X_eating=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
 Y_eating=[resCol2,resCol3,resCol4,resCol5,resCol6,resCol7,resCol8,resCol9,resCol10,resCol11,resCol12,resCol13,resCol14,resCol15,resCol16,resCol17,resCol18];
 plot(X_eating, Y_eating);

 X_noneating=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
 Y_noneating=[resCol2_ne,resCol3_ne,resCol4_ne,resCol5_ne,resCol6_ne,resCol7_ne,resCol8_ne,resCol9_ne,resCol10_ne,resCol11_ne,resCol12_ne,resCol13_ne,resCol14_ne,resCol15_ne,resCol16_ne,resCol17_ne,resCol18_ne,];
 plot(X_eating, Y_eating);
 hold on
 plot(X_noneating, Y_noneating);
 hold off
