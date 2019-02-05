fileNames_EMG=["1503510449718_EMG.csv","1503512024740_EMG.csv","1503513662628_EMG.csv"	,"1503515171349_EMG.csv"	,"1503523593605_EMG.csv"	,"1503525230880_EMG.txt","1503600471339_EMG.txt"	,"1503601791851_EMG.txt"	,"1503604387983_EMG.txt"	,"1503610324174_EMG.txt"	,"1503612761276_EMG.txt"	,"1503614529248_EMG.txt"	,"1503616371604_EMG.txt","1503618071641_EMG.txt"	,"1503683563307_EMG.txt"	,"1503685368577_EMG.txt","1503686805336_EMG.txt"	,"1503688257359_EMG.txt","1503695352765_EMG.txt"	,"1503697313323_EMG.txt"	,"1503698678322_EMG.txt"	,"1503701484723_EMG.txt"	,"1503702810845_EMG.txt","1503704008775_EMG.txt"	,"1503944237832_EMG.txt","1503945980566_EMG.txt"	,"1503948467876_EMG.txt"	,"1503955687111_EMG.txt","1503957322493_EMG.txt","1503959170110_EMG.txt"	

];

fileNames_IMU=["1503510449718_IMU.csv","1503512024740_IMU.csv","1503513662628_IMU.csv"	,"1503515171349_IMU.csv"	,"1503523593605_IMU.csv"	,"1503525230880_IMU.txt","1503600471339_IMU.txt"	,"1503601791851_IMU.txt"	,"1503604387983_IMU.txt"	,"1503610324174_IMU.txt"	,"1503612761276_IMU.txt"	,"1503614529248_IMU.txt"	,"1503616371604_IMU.txt","1503618071641_IMU.txt"	,"1503683563307_IMU.txt"	,"1503685368577_IMU.txt","1503686805336_IMU.txt"	,"1503688257359_IMU.txt"	,"1503695352765_IMU.txt"	,"1503697313323_IMU.txt"	,"1503698678322_IMU.txt"	,"1503701484723_IMU.txt"	,"1503702810845_IMU.txt","1503704008775_IMU.txt"	,"1503944237832_IMU.txt","1503945980566_IMU.txt"	,"1503948467876_IMU.txt"	,"1503955687111_IMU.txt","1503957322493_IMU.txt","1503959170110_IMU.txt"	

];

fileNames_gT=["1503510449718.csv","1503512024740.csv","1503513662628.csv"	,"1503515171349.csv"	,"1503523593605.csv"	,"1503525230880.txt","1503600471339.txt"	,"1503601791851.txt"	,"1503604387983.txt"	,"1503610324174.txt"	,"1503612761276.txt"	,"1503614529248.txt"	,"1503616371604.txt","1503618071641.txt"	,"1503683563307.txt"	,"1503685368577.txt","1503686805336.txt"	,"1503688257359.txt"	,"1503695352765.txt"	,"1503697313323.txt"	,"1503698678322.txt"	,"1503701484723.txt"	,"1503702810845.txt","1503704008775.txt"	,"1503944237832.txt","1503945980566.txt"	,"1503948467876.txt"	,"1503955687111.txt","1503957322493.txt","1503959170110.txt"	

];

graphNames=[];

resFileNames_eating=["eatingVals_1503510449718.csv","eatingVals_1503512024740.csv","eatingVals_1503513662628.csv"	,"eatingVals_1503515171349.csv"	,"eatingVals_1503523593605.csv"];
resFileNames_noneating=["noneatingVals_1503510449718.csv","noneatingVals_1503512024740.csv","noneatingVals_1503513662628.csv"	,"noneatingVals_1503515171349.csv"	,"noneatingVals_1503523593605.csv"];



it=4;

%datIMU= csvread('1503512024740_IMU.csv');
disp(fileNames_IMU(it));
datIMU=csvread(fileNames_IMU(it));
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
paddingVal=rtemp;
temp_extraIMU=zeros(paddingVal,1);

datIMU_new=horzcat(datIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU);

%datEMG=csvread('1503512024740_EMG.csv');
datEMG=csvread(fileNames_EMG(it));
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
paddingValEmg=rtempEMG;
temp_extra1EMG=zeros(rtempEMG,1);

datEMG_new=horzcat(datEMG_1, temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,datEMG_2,datEMG_3,datEMG_4,datEMG_5,datEMG_6,datEMG_7,datEMG_8,datEMG_9);

dat_IMU_EMG_new=vertcat(datIMU_new, datEMG_new);

dat_IMU_EMG_sorted=sortrows(dat_IMU_EMG_new);

[rdat_IMU_EMG_sorted, cdat_IMU_EMG_sorted]=size(dat_IMU_EMG_sorted);

%datGT=csvread('1503512024740.csv');
datGT=csvread(fileNames_gT(it));
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
 rmsCol2=rms(Col2Norm);
 stdCol2=std(Col2Norm);
 meanCol2=mean(Col2Norm);
 maxCol2=max(Col2Norm);
 fftCol2=max(abs(fft(Col2Norm))) ;
 %fftCol2=mean(fftCol2temp);
 entropyCol2=entropy(Col2Norm);
 disp("Disp fft:");
 disp(entropyCol2);

  Col3 = eatingMat(:,3);
 Col3Norm = (Col3-min(Col3)) / (max(Col3)-min(Col3));
 rmsCol3=rms(Col3Norm);
 stdCol3=std(Col3Norm);
 meanCol3=mean(Col3Norm);
 fftCol3=max(abs(fft(Col3Norm))) ;
 maxCol3=max(Col3Norm);
  entropyCol3=entropy(Col3Norm);

 
  Col4 = eatingMat(:,4);
 Col4Norm = (Col4-min(Col4)) / (max(Col4)-min(Col4));
 rmsCol4=rms(Col4Norm);
 stdCol4=std(Col4Norm);
 meanCol4=mean(Col4Norm);
 fftCol4=max(abs(fft(Col4Norm))) ;
 maxCol4=max(Col4Norm);
  entropyCol4=entropy(Col4Norm);

 
  Col5 = eatingMat(:,5);
 Col5Norm = (Col5-min(Col5)) / (max(Col5)-min(Col5));
 rmsCol5=rms(Col5Norm);
 stdCol5=std(Col5Norm);
 meanCol5=mean(Col5Norm);
 fftCol5=max(abs(fft(Col5Norm))) ;
 maxCol5=max(Col5Norm);
 entropyCol5=entropy(Col5Norm);

 
  Col6 = eatingMat(:,6);
 Col6Norm = (Col6-min(Col6)) / (max(Col6)-min(Col6));
 rmsCol6=rms(Col6Norm);
 stdCol6=std(Col6Norm);
 meanCol6=mean(Col6Norm);
 fftCol6=max(abs(fft(Col6Norm))) ;
 maxCol6=max(Col6Norm);
  entropyCol6=entropy(Col6Norm);

  Col7 = eatingMat(:,7);
 Col7Norm = (Col7-min(Col7)) / (max(Col7)-min(Col7));
 rmsCol7=rms(Col7Norm);
 stdCol7=std(Col7Norm);
 meanCol7=mean(Col7Norm);
 fftCol7=max(abs(fft(Col7Norm))) ;
 maxCol7=max(Col7Norm);
  entropyCol7=entropy(Col7Norm);

  Col8 = eatingMat(:,8);
 Col8Norm = (Col8-min(Col8)) / (max(Col8)-min(Col8));
 rmsCol8=rms(Col8Norm);
 stdCol8=std(Col8Norm);
 meanCol8=mean(Col8Norm);
 fftCol8=max(abs(fft(Col8Norm))) ;
 maxCol8=max(Col8Norm);
  entropyCol8=entropy(Col8Norm);

 
  Col9 = eatingMat(:,9);
 Col9Norm = (Col9-min(Col9)) / (max(Col9)-min(Col9));
 rmsCol9=rms(Col9Norm);
 stdCol9=std(Col9Norm);
 meanCol9=mean(Col9Norm);
 fftCol9=max(abs(fft(Col9Norm))) ;
 maxCol9=max(Col9Norm);
  entropyCol9=entropy(Col9Norm);

 
  Col10 = eatingMat(:,10);
 Col10Norm = (Col10-min(Col10)) / (max(Col10)-min(Col10));
 rmsCol10=rms(Col10Norm);
 stdCol10=std(Col10Norm);
 meanCol10=mean(Col10Norm);
 fftCol10=max(abs(fft(Col10Norm))) ;
 maxCol10=max(Col10Norm);
  entropyCol10=entropy(Col10Norm);

 
  Col11 = eatingMat(:,11);
 Col11Norm = (Col11-min(Col11)) / (max(Col11)-min(Col11));
 rmsCol11=rms(Col11Norm);
 stdCol11=std(Col11Norm);
 meanCol11=mean(Col11Norm);
 fftCol11=max(abs(fft(Col11Norm))) ;
 maxCol11=max(Col11Norm);
  entropyCol11=entropy(Col11Norm);
  

 
  Col12 = eatingMat(:,12);
 Col12Norm = (Col12-min(Col12)) / (max(Col12)-min(Col12));
 rmsCol12=rms(Col12Norm);
 stdCol12=std(Col12Norm);
 meanCol12=mean(Col12Norm);
 fftCol12=max(abs(fft(Col12Norm))) ;
 maxCol12=max(Col12Norm);
  entropyCol12=entropy(Col12Norm);

  Col13 = eatingMat(:,13);
 Col13Norm = (Col13-min(Col13)) / (max(Col13)-min(Col13));
 rmsCol13=rms(Col13Norm);
 stdCol13=std(Col13Norm);
 meanCol13=mean(Col13Norm);
 fftCol13=max(abs(fft(Col13Norm))) ;
 maxCol13=max(Col13Norm);
  entropyCol13=entropy(Col13Norm);

  Col14 = eatingMat(:,14);
 Col14Norm = (Col14-min(Col14)) / (max(Col14)-min(Col14));
 rmsCol14=rms(Col14Norm);
 stdCol14=std(Col14Norm);
 meanCol14=mean(Col14Norm);
 fftCol14=max(abs(fft(Col14Norm))) ;
 maxCol14=max(Col14Norm);
  entropyCol14=entropy(Col14Norm);

 
  Col15 = eatingMat(:,15);
 Col15Norm = (Col15-min(Col15)) / (max(Col15)-min(Col15));
 rmsCol15=rms(Col15Norm);
 stdCol15=std(Col15Norm);
 meanCol15=mean(Col15Norm);
 fftCol15=max(abs(fft(Col15Norm))) ;
 maxCol15=max(Col15Norm);
  entropyCol15=entropy(Col15Norm);

 
  Col16 = eatingMat(:,16);
 Col16Norm = (Col16-min(Col16)) / (max(Col16)-min(Col16));
 rmsCol16=rms(Col16Norm);
 stdCol16=std(Col16Norm);
 meanCol16=mean(Col16Norm);
 fftCol16=max(abs(fft(Col16Norm))) ;
 maxCol16=max(Col16Norm);
  entropyCol16=entropy(Col16Norm);

 
  Col17 = eatingMat(:,17);
 Col17Norm = (Col17-min(Col17)) / (max(Col17)-min(Col17));
 rmsCol17=rms(Col17Norm);
 stdCol17=std(Col17Norm);
 meanCol17=mean(Col17Norm);
 fftCol17=max(abs(fft(Col17Norm))) ;
 maxCol17=max(Col17Norm);
  entropyCol17=entropy(Col17Norm);

 
  Col18 = eatingMat(:,18);
 Col18Norm = (Col18-min(Col18)) / (max(Col18)-min(Col18));
 rmsCol18=rms(Col18Norm);
 stdCol18=std(Col18Norm);
 meanCol18=mean(Col18Norm);
 fftCol18=max(abs(fft(Col18Norm))) ;
 maxCol18=max(Col18Norm);
  entropyCol18=entropy(Col18Norm);

 

 
 %Non eating:
  Col2_ne = noneatingMat(:,2);
 Col2Norm_ne = (Col2_ne-min(Col2_ne)) / (max(Col2_ne)-min(Col2_ne));
 rmsCol2_ne=rms(Col2Norm_ne)
 stdCol2_ne=std(Col2Norm_ne)
 meanCol2_ne=mean(Col2Norm_ne);
 fftCol2_ne=max(abs(fft(Col2Norm_ne)));
 maxCol2_ne=max(Col2Norm_ne);
 entropyCol2_ne=entropy(Col2Norm_ne);

  Col3_ne = noneatingMat(:,3);
 Col3Norm_ne = (Col3_ne-min(Col3_ne)) / (max(Col3_ne)-min(Col3_ne));
 rmsCol3_ne=rms(Col3Norm_ne)
 stdCol3_ne=std(Col3Norm_ne)
 meanCol3_ne=mean(Col3Norm_ne);
 fftCol3_ne=max(abs(fft(Col3Norm_ne)));
 maxCol3_ne=max(Col3Norm_ne);
  entropyCol3_ne=entropy(Col3Norm_ne);

 
 
  Col4_ne = noneatingMat(:,4);
 Col4Norm_ne = (Col4_ne-min(Col4_ne)) / (max(Col4_ne)-min(Col4_ne));
 rmsCol4_ne=rms(Col4Norm_ne)
 stdCol4_ne=std(Col4Norm_ne)
 meanCol4_ne=mean(Col4Norm_ne);
 fftCol4_ne=max(abs(fft(Col4Norm_ne)));
 maxCol4_ne=max(Col4Norm_ne);
  entropyCol4_ne=entropy(Col4Norm_ne);

 
  Col5_ne = noneatingMat(:,5);
 Col5Norm_ne = (Col5_ne-min(Col5_ne)) / (max(Col5_ne)-min(Col5_ne));
 rmsCol5_ne=rms(Col5Norm_ne)
 stdCol5_ne=std(Col5Norm_ne)
 meanCol5_ne=mean(Col5Norm_ne);
 fftCol5_ne=max(abs(fft(Col5Norm_ne)));
 maxCol5_ne=max(Col5Norm_ne);
  entropyCol5_ne=entropy(Col5Norm_ne);

 
  Col6_ne = noneatingMat(:,6);
 Col6Norm_ne = (Col6_ne-min(Col6_ne)) / (max(Col6_ne)-min(Col6_ne));
 rmsCol6_ne=rms(Col6Norm_ne)
 stdCol6_ne=std(Col6Norm_ne)
 meanCol6_ne=mean(Col6Norm_ne);
 fftCol6_ne=max(abs(fft(Col6Norm_ne)));
 maxCol6_ne=max(Col6Norm_ne);
  entropyCol6_ne=entropy(Col6Norm_ne);

  Col7_ne = noneatingMat(:,7);
 Col7Norm_ne = (Col7_ne-min(Col7_ne)) / (max(Col7_ne)-min(Col7_ne));
 rmsCol7_ne=rms(Col7Norm_ne)
 stdCol7_ne=std(Col7Norm_ne)
 meanCol7_ne=mean(Col7Norm_ne);
 fftCol7_ne=max(abs(fft(Col7Norm_ne)));
 maxCol7_ne=max(Col7Norm_ne);
  entropyCol7_ne=entropy(Col7Norm_ne);

 
  Col8_ne = noneatingMat(:,8);
 Col8Norm_ne = (Col8_ne-min(Col8_ne)) / (max(Col8_ne)-min(Col8_ne));
 rmsCol8_ne=rms(Col8Norm_ne)
 stdCol8_ne=std(Col8Norm_ne)
 meanCol8_ne=mean(Col8Norm_ne);
 fftCol8_ne=max(abs(fft(Col8Norm_ne)));
 maxCol8_ne=max(Col8Norm_ne);
  entropyCol8_ne=entropy(Col8Norm_ne);

 
  Col9_ne = noneatingMat(:,9);
 Col9Norm_ne = (Col9_ne-min(Col9_ne)) / (max(Col9_ne)-min(Col9_ne));
 rmsCol9_ne=rms(Col9Norm_ne)
 stdCol9_ne=std(Col9Norm_ne)
 meanCol9_ne=mean(Col9Norm_ne);
 fftCol9_ne=max(abs(fft(Col9Norm_ne)));
 maxCol9_ne=max(Col9Norm_ne);
  entropyCol9_ne=entropy(Col9Norm_ne);

 
  Col10_ne = noneatingMat(:,10);
 Col10Norm_ne = (Col10_ne-min(Col10_ne)) / (max(Col10_ne)-min(Col10_ne));
 rmsCol10_ne=rms(Col10Norm_ne)
 stdCol10_ne=std(Col10Norm_ne)
 meanCol10_ne=mean(Col10Norm_ne);
 fftCol10_ne=max(abs(fft(Col10Norm_ne)));
 maxCol10_ne=max(Col10Norm_ne);
  entropyCol10_ne=entropy(Col10Norm_ne);

  Col11_ne = noneatingMat(:,11);
 Col11Norm_ne = (Col11_ne-min(Col11_ne)) / (max(Col11_ne)-min(Col11_ne));
 rmsCol11_ne=rms(Col11Norm_ne)
 stdCol11_ne=std(Col11Norm_ne)
 meanCol11_ne=mean(Col11Norm_ne);
 fftCol11_ne=max(abs(fft(Col11Norm_ne)));
 maxCol11_ne=max(Col11Norm_ne);
  entropyCol11_ne=entropy(Col11Norm_ne);

 
  Col12_ne = noneatingMat(:,12);
 Col12Norm_ne = (Col12_ne-min(Col12_ne)) / (max(Col12_ne)-min(Col12_ne));
 rmsCol12_ne=rms(Col12Norm_ne)
 stdCol12_ne=std(Col12Norm_ne)
 meanCol12_ne=mean(Col12Norm_ne);
 fftCol12_ne=max(abs(fft(Col12Norm_ne)));
 maxCol12_ne=max(Col12Norm_ne);
  entropyCol12_ne=entropy(Col12Norm_ne);

  Col13_ne = noneatingMat(:,13);
 Col13Norm_ne = (Col13_ne-min(Col13_ne)) / (max(Col13_ne)-min(Col13_ne));
 rmsCol13_ne=rms(Col13Norm_ne)
 stdCol13_ne=std(Col13Norm_ne)
 meanCol13_ne=mean(Col13Norm_ne);
 fftCol13_ne=max(abs(fft(Col13Norm_ne)));
 maxCol13_ne=max(Col13Norm_ne);
  entropyCol13_ne=entropy(Col13Norm_ne);

  Col14_ne = eatingMat(:,14);
 Col14Norm_ne = (Col14_ne-min(Col14_ne)) / (max(Col14_ne)-min(Col14_ne));
 rmsCol14_ne=rms(Col14Norm_ne)
 stdCol14_ne=std(Col14Norm_ne)
 meanCol14_ne=mean(Col14Norm_ne);
 fftCol14_ne=max(abs(fft(Col14Norm_ne)));
 maxCol14_ne=max(Col14Norm_ne);
  entropyCol14_ne=entropy(Col14Norm_ne);
 
 
  Col15_ne = noneatingMat(:,15);
 Col15Norm_ne = (Col15_ne-min(Col15_ne)) / (max(Col15_ne)-min(Col15_ne));
 rmsCol15_ne=rms(Col15Norm_ne)
 stdCol15_ne=std(Col15Norm_ne)
 meanCol15_ne=mean(Col15Norm_ne);
 fftCol15_ne=max(abs(fft(Col15Norm_ne)));
 maxCol15_ne=max(Col15Norm_ne);
  entropyCol15_ne=entropy(Col15Norm_ne);

 
  Col16_ne = noneatingMat(:,16);
 Col16Norm_ne = (Col16_ne-min(Col16_ne)) / (max(Col16_ne)-min(Col16_ne));
 rmsCol16_ne=rms(Col16Norm_ne)
 stdCol16_ne=std(Col16Norm_ne)
 meanCol16_ne=mean(Col16Norm_ne);
 fftCol16_ne=max(abs(fft(Col16Norm_ne)));
 maxCol16_ne=max(Col16Norm_ne);
  entropyCol16_ne=entropy(Col16Norm_ne);

 
  Col17_ne = noneatingMat(:,17);
 Col17Norm_ne = (Col17_ne-min(Col17_ne)) / (max(Col17_ne)-min(Col17_ne));
 rmsCol17_ne=rms(Col17Norm_ne)
 stdCol17_ne=std(Col17Norm_ne)
 meanCol17_ne=mean(Col17Norm_ne);
 fftCol17_ne=max(abs(fft(Col17Norm_ne)));
 maxCol17_ne=max(Col17Norm_ne);
  entropyCol17_ne=entropy(Col17Norm_ne);

 
  Col18_ne = noneatingMat(:,18);
 Col18Norm_ne = (Col18_ne-min(Col18_ne)) / (max(Col18_ne)-min(Col18_ne));
 rmsCol18_ne=rms(Col18Norm_ne)
 stdCol18_ne=std(Col18Norm_ne)
 meanCol18_ne=mean(Col18Norm_ne);
 fftCol18_ne=max(abs(fft(Col18Norm_ne)));
 maxCol18_ne=max(Col18Norm_ne);
  entropyCol18_ne=entropy(Col18Norm_ne);


 %For eating graph rms:
 X_eating=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
 Y_eating_rms=[rmsCol2,rmsCol3,rmsCol4,rmsCol5,rmsCol6,rmsCol7,rmsCol8,rmsCol9,rmsCol10,rmsCol11,rmsCol12,rmsCol13,rmsCol14,rmsCol15,rmsCol16,rmsCol17,rmsCol18];
 Y_eating_std=[stdCol2,stdCol3,stdCol4,stdCol5,stdCol6,stdCol7,stdCol8,stdCol9,stdCol10,stdCol11,stdCol12,stdCol13,stdCol14,stdCol15,stdCol16,stdCol17,stdCol18];
 Y_eating_mean=[meanCol2,meanCol3,meanCol4,meanCol5,meanCol6,meanCol7,meanCol8,meanCol9,meanCol10,meanCol11,meanCol12,meanCol13,meanCol14,meanCol15,meanCol16,meanCol17,meanCol18];
 Y_eating_fft=[fftCol2,fftCol3,fftCol4,fftCol5,fftCol6,fftCol7,fftCol8,fftCol9,fftCol10,fftCol11,fftCol12,fftCol13,fftCol14,fftCol15,fftCol16,fftCol17,fftCol18];
 Y_eating_max=[maxCol2,maxCol3,maxCol4,maxCol5,maxCol6,maxCol7,maxCol8,maxCol9,maxCol10,maxCol11,maxCol12,maxCol13,maxCol14,maxCol15,maxCol16,maxCol17,maxCol18];
 Y_eating_entropy=[entropyCol2,entropyCol3,entropyCol4,entropyCol5,entropyCol6,entropyCol7,entropyCol8,entropyCol9,entropyCol10,entropyCol11,entropyCol12,entropyCol13,entropyCol14,entropyCol15,entropyCol16,entropyCol17,entropyCol18];
 %plot(X_eating, Y_eating);
 
 
 Y_eatingVals=vertcat(X_eating, Y_eating_rms, Y_eating_std, Y_eating_mean, Y_eating_fft, Y_eating_max);
% csvwrite('eatingVals_1503510449718_IMU_fork.csv',Y_eatingVals);
 %csvwrite(resFileNames_eating(it),Y_eatingVals);
 %For non eating graph rms:
 X_noneating=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
 Y_noneating_rms=[rmsCol2_ne,rmsCol3_ne,rmsCol4_ne,rmsCol5_ne,rmsCol6_ne,rmsCol7_ne,rmsCol8_ne,rmsCol9_ne,rmsCol10_ne,rmsCol11_ne,rmsCol12_ne,rmsCol13_ne,rmsCol14_ne,rmsCol15_ne,rmsCol16_ne,rmsCol17_ne,rmsCol18_ne];
 Y_noneating_std=[stdCol2_ne,stdCol3_ne,stdCol4_ne,stdCol5_ne,stdCol6_ne,stdCol7_ne,stdCol8_ne,stdCol9_ne,stdCol10_ne,stdCol11_ne,stdCol12_ne,stdCol13_ne,stdCol14_ne,stdCol15_ne,stdCol16_ne,stdCol17_ne,stdCol18_ne];
 Y_noneating_mean=[meanCol2_ne,meanCol3_ne,meanCol4_ne,meanCol5_ne,meanCol6_ne,meanCol7_ne,meanCol8_ne,meanCol9_ne,meanCol10_ne,meanCol11_ne,meanCol12_ne,meanCol13_ne,meanCol14_ne,meanCol15_ne,meanCol16_ne,meanCol17_ne,meanCol18_ne];
 Y_noneating_fft=[fftCol2_ne,fftCol3_ne,fftCol4_ne,fftCol5_ne,fftCol6_ne,fftCol7_ne,fftCol8_ne,fftCol9_ne,fftCol10_ne,fftCol11_ne,fftCol12_ne,fftCol13_ne,fftCol14_ne,fftCol15_ne,fftCol16_ne,fftCol17_ne,fftCol18_ne];
 Y_noneating_max=[maxCol2_ne,maxCol3_ne,maxCol4_ne,maxCol5_ne,maxCol6_ne,maxCol7_ne,maxCol8_ne,maxCol9_ne,maxCol10_ne,maxCol11_ne,maxCol12_ne,maxCol13_ne,maxCol14_ne,maxCol15_ne,maxCol16_ne,maxCol17_ne,maxCol18_ne];
 Y_noneating_entropy=[entropyCol2_ne,entropyCol3_ne,entropyCol4_ne,entropyCol5_ne,entropyCol6_ne,entropyCol7_ne,entropyCol8_ne,entropyCol9_ne,entropyCol10_ne,entropyCol11_ne,entropyCol12_ne,entropyCol13_ne,entropyCol14_ne,entropyCol15_ne,entropyCol16_ne,entropyCol17_ne,entropyCol18_ne];
Y_noneatingVals = vertcat(X_noneating,Y_noneating_rms, Y_noneating_std,Y_noneating_mean,Y_noneating_fft,Y_noneating_max,Y_noneating_entropy);
 %csvwrite('noneatingVals_1503510449718_IMU_fork.csv',Y_noneatingVals);
 %csvwrite(resFileNames_noneating(it),Y_noneatingVals);
 %{
 plot(X_eating, Y_eating);
 hold on
 plot(X_noneating, Y_noneating);
 hold off
 %}
 
 %graphNames=["1503510449718.fig","eatingVals_1503512024740.fig","eatingVals_1503513662628.fig"	,"eatingVals_1503515171349.fig"	,"eatingVals_1503523593605.fig"];
 
 graphNames_rms=["fig_1503510449718_rms.fig","eatingVals_1503512024740_rms.fig","eatingVals_1503513662628_rms.fig"	,"eatingVals_1503515171349_rms.fig"	,"eatingVals_1503523593605_rms.fig"];
 graphNames_mean=["1503510449718_mean.fig","eatingVals_1503512024740_mean.fig","eatingVals_1503513662628_mean.fig"	,"eatingVals_1503515171349_mean.fig"	,"eatingVals_1503523593605_mean.fig"];
 graphNames_std=["1503510449718_std.fig","eatingVals_1503512024740_std.fig","eatingVals_1503513662628_std.fig"	,"eatingVals_1503515171349_std.fig"	,"eatingVals_1503523593605_std.fig"];
 graphNames_fft=["1503510449718_fft.fig","eatingVals_1503512024740_fft.fig","eatingVals_1503513662628_fft.fig"	,"eatingVals_1503515171349_fft.fig"	,"eatingVals_1503523593605_fft.fig"];
 graphNames_max=["1503510449718_max.fig","eatingVals_1503512024740_max.fig","eatingVals_1503513662628_max.fig"	,"eatingVals_1503515171349_max.fig"	,"eatingVals_1503523593605_max.fig"];
 graphNames_entropy=["fig_1503510449718_ent.fig","eatingVals_1503512024740_ent.fig","eatingVals_1503513662628_ent.fig"	,"eatingVals_1503515171349_ent.fig"	,"eatingVals_1503523593605_ent.fig"];

 
 it=2
 oneUserResultsEating=[];

 oneUserResultsEating=[Y_eating_rms(:,1),Y_eating_entropy(:,2), Y_eating_std(:,3), Y_eating_entropy(:,4), Y_eating_rms(:,5),Y_eating_fft(:,6),Y_eating_fft(:,8), Y_eating_std(:,9), Y_eating_mean(:,10), Y_eating_entropy(:,11),Y_eating_fft(:,12),Y_eating_std(:,13),Y_eating_std(:,16),Y_eating_mean(:,17),Y_eating_rms(:,17)];
dlmwrite('test.csv',oneUserResultsEating,'delimiter',',','-append');

oneUserResultsNonEating=[];

 oneUserResultsNonEating=[Y_noneating_rms(:,1),Y_noneating_entropy(:,2), Y_noneating_std(:,3), Y_noneating_entropy(:,4), Y_noneating_rms(:,5),Y_noneating_fft(:,6),Y_noneating_fft(:,8), Y_noneating_std(:,9), Y_noneating_mean(:,10), Y_noneating_entropy(:,11),Y_noneating_fft(:,12),Y_noneating_std(:,13),Y_noneating_std(:,16),Y_noneating_mean(:,17),Y_noneating_rms(:,17)];
dlmwrite('testNonEating.csv',oneUserResultsNonEating,'delimiter',',','-append');
 
 disp('testing');
 disp(oneUserResults);
 plot(X_eating, Y_eating_rms);
 hold on
 g1=plot(X_noneating, Y_noneating_rms);
 hold off
 disp(graphNames_rms(it));
 saveas(g1,graphNames_rms(it));
 
 plot(X_eating, Y_eating_std);
 hold on
 g2=plot(X_noneating, Y_noneating_std);
 hold off
 saveas(g2,graphNames_std(it));
 
 plot(X_eating, Y_eating_mean);
 hold on
 g3=plot(X_noneating, Y_noneating_mean);
 hold off
 saveas(g3,graphNames_mean(it));
 
 plot(X_eating, Y_eating_fft);
 hold on
 g4=plot(X_noneating, Y_noneating_fft);
 hold off
  saveas(g4,graphNames_fft(it));
  %saveas(g4,'/Users/apurvabharatia/Desktop/GraphsDM/1503510449718_IMU_fork_fft.fig')
 %/Users/apurvabharatia/Desktop/GraphsDM/csvMetaData.csv
 
 
 plot(X_eating, Y_eating_max);
 hold on
 g5=plot(X_noneating, Y_noneating_max);
 hold off
 saveas(g5,graphNames_mean(it));
%saveas(g5,'/Users/apurvabharatia/Desktop/GraphsDM/1503510449718_IMU_fork_max.fig')
 plot(X_eating, Y_eating_entropy);
 hold on
 g6=plot(X_noneating,Y_noneating_entropy);
 hold off
 saveas(g6,graphNames_entropy(it));
 
 finalmat = csvread('test.csv');
 disp("pca function")
 disp(finalmat);
 
 