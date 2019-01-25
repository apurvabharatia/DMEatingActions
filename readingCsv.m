
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
[rtemp,ctemp]=size(datIMU_11)
temp_extraIMU=1:1:rtemp;

%for i = 1 : rtemp
 %   temp_extraIMU(i)=0
%end
    
temp_extraIMU=transpose(temp_extraIMU)
datIMU_new=horzcat(datIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU);







%Add extra columns


%Add extra 

%datEMG= textscan('1503510449718_EMG','%d %d %d %d %d %d %d %d %d ');
datEMG=csvread('1503510449718_EMG_fork.csv')

[r1,c1]=size(datEMG)
disp(r1)
disp(c1)

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
temp_extra1EMG=1:1:rtempEMG;
temp_extra1EMG=transpose(temp_extra1EMG)
datEMG_new=horzcat(datEMG_1, temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,datEMG_2,datEMG_3,datEMG_4,datEMG_5,datEMG_6,datEMG_7,datEMG_8,datEMG_9);


dat_IMU_EMG_new=vertcat(datIMU_new, datEMG_new)

dat_IMU_EMG_sorted=sortrows(dat_IMU_EMG_new);

[rdat_IMU_EMG_sorted, cdat_IMU_EMG_sorted]=size(dat_IMU_EMG_sorted)


%[r2,c2]=size(dat_IMU_EMG)
%disp(size(dat_IMU_EMG))
                                                    
%dat_new=vertcat(datIMU, datEMG)
%disp(dat_new)

datGT=csvread('1503510449718_groundTruth_fork.csv');

[rGT, cGT]=size(datGT)
fulleating=[]
for i= 1:rGT
    
    fr=datGT(i,1)
    to=datGT(i,2)
    eating=fr:1:to
    eating=transpose(eating)
    fulleating=vertcat(fulleating,eating)
    
end
[rfullEating, cfullEating]=size(fulleating)

for i = 1:rfullEating
    fulleating(i)=floor(fulleating(i)*1.667)
end

annotations=[]

for i= 1:rdat_IMU_EMG_sorted
   
    if ismember(i,fulleating)
        annotations(i)=1
    else
        annotations(i)=0
    end
end


