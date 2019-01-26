%code that creates eating and noneating img,emu matrix output files for all the users
%given in the summary data 

outputDirPathStep1 = 'output-step1';
    if ~exist(outputDirPathStep1, 'dir')
        mkdir(outputDirPathStep1);
    end
    
summaryID = fopen('summaryData.csv');
fileData = textscan(summaryID,'%s %s %s %d',...
'Delimiter',',',...
'CollectOutput',0,...
'EndOfLine','\r\n');

fname = fileData{1};

for k=1:length(fname)
    modk = k%3;
    if modk==1
        emgFileName = fname{k};
        disp(emgFileName);
    elseif modk==2
        imuFileName = fname{k};
        disp(imuFileName);
    else 
        gtFileName = fname{k};
        disp(gtFileName);
        datIMU= csvread(emgFileName);
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
        temp_extraIMU=zeros(rtemp,1);
        
        %for i = 1 : rtemp
        %   temp_extraIMU(i)=0
        %end
        
        %temp_extraIMU=transpose(temp_extraIMU)
        datIMU_new=horzcat(datIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU,temp_extraIMU);
        
        %Add extra columns
        
        
        %Add extra
        
        %datEMG= textscan('1503510449718_EMG','%d %d %d %d %d %d %d %d %d ');
        datEMG=csvread(imuFileName);
        
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
        temp_extra1EMG=zeros(rtempEMG,1);
        %temp_extra1EMG=transpose(temp_extra1EMG)
        datEMG_new=horzcat(datEMG_1, temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,temp_extra1EMG,datEMG_2,datEMG_3,datEMG_4,datEMG_5,datEMG_6,datEMG_7,datEMG_8,datEMG_9);
        
        dat_IMU_EMG_new=vertcat(datIMU_new, datEMG_new);
        
        dat_IMU_EMG_sorted=sortrows(dat_IMU_EMG_new);
        
        [rdat_IMU_EMG_sorted, cdat_IMU_EMG_sorted]=size(dat_IMU_EMG_sorted);
        
        datGT=csvread(gtFileName);
        
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
        
        disp("dimensions of new imu");
        disp(size(datIMU_new));
        disp("dimensions of new emg");
        disp(size(datEMG_new));
        disp("dimensions of sorted combined imu_emg");
        disp(size(dat_IMU_EMG_sorted));
        disp("dimensions of ground truth");
        disp(size(datGT));
        disp("dimensions of expanded ground truth");
        disp(size(fulleating));
        
        annotations=[]
        
        for i= 1:rdat_IMU_EMG_sorted
            
            if ismember(i,fulleating)
                annotations(i)=1;
            else
                annotations(i)=0;
            end
        end
        
        annotations = transpose(annotations);
        disp("annotations size ")
        disp(size(annotations))
        dat_IMU_EMG_sorted=horzcat(dat_IMU_EMG_sorted,annotations);
        disp("imu_emg_finalMatrix");
        disp(size(dat_IMU_EMG_sorted));
        
        %counting eating and noneating
        
        [finalRow,finalColumn] = size(dat_IMU_EMG_sorted);
        
        eatingLabel = 1;
        noneatingLabel = 0;
        noneating = 0;
        eating = 0;
        
        for i= 1:finalRow
            
            label = dat_IMU_EMG_sorted(i,20);
            if (label<1.0)
                noneating = noneating + 1;
            else
                eating = eating + 1;
            end
        end
        disp('the count of non eating frames are :')
        disp(noneating)
        disp('the count of eating frames are :')
        disp(eating)
        feat = fopen(strcat('output-step1/','output'), 'w') ;
        outputFile = strcat('output-step1/',gtFileName);
        csvwrite(outputFile,dat_IMU_EMG_sorted);
   
    end
end


