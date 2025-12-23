eeg1=load('eeg1'); eeg1=eeg1.eeg1_data;
eeg2=load('eeg2'); eeg2=eeg2.eeg2_data;
eeg3=load('eeg3'); eeg3=eeg3.eeg3_data;
eeg4=load('eeg4'); eeg4=eeg4.eeg4_data;
eeg5=load('eeg5'); eeg5=eeg5.eeg5_data;
eeg6=load('eeg6'); eeg6=eeg6.eeg6_data;
eeg7=load('eeg7'); eeg7=eeg7.eeg7_data;
eeg8=load('eeg8'); eeg8=eeg8.eeg8_data;
eeg9=load('eeg9'); eeg9=eeg9.eeg9_data;
eeg10=load('eeg10'); eeg10=eeg10.eeg10_data;
eeg11=load('eeg11'); eeg11=eeg11.eeg11_data;
eeg12=load('eeg12'); eeg12=eeg12.eeg12_data;
eeg13=load('eeg13'); eeg13=eeg13.eeg13_data;
eeg14=load('eeg14'); eeg14=eeg14.eeg14_data;
eeg15=load('eeg15'); eeg15=eeg15.eeg15_data;
eeg16=load('eeg16'); eeg16=eeg16.eeg16_data;
eeg17=load('eeg17'); eeg17=eeg17.eeg17_data;
eeg18=load('eeg18'); eeg18=eeg18.eeg18_data;
eeg19=load('eeg19'); eeg19=eeg19.eeg19_data;
eeg20=load('eeg20'); eeg20=eeg20.eeg20_data;
eeg21=load('eeg21'); eeg21=eeg21.eeg21_data;
eeg22=load('eeg22'); eeg22=eeg22.eeg22_data;
eeg23=load('eeg23'); eeg23=eeg23.eeg23_data;
eeg24=load('eeg24'); eeg24=eeg24.eeg24_data;
eeg25=load('eeg25'); eeg25=eeg25.eeg25_data;
eeg26=load('eeg26'); eeg26=eeg26.eeg26_data;
eeg27=load('eeg27'); eeg27=eeg27.eeg27_data;
eeg28=load('eeg28'); eeg28=eeg28.eeg28_data;
eeg29=load('eeg29'); eeg29=eeg29.eeg29_data;
eeg30=load('eeg30'); eeg30=eeg30.eeg30_data;

eeg=cell(1, 30);
eeg={eeg1 eeg2 eeg3 eeg5 eeg6 eeg6 eeg7 eeg8 eeg9 eeg10...
    eeg11 eeg12 eeg13 eeg14 eeg15 eeg16 eeg17 eeg18 eeg19 eeg20...
    eeg21 eeg22 eeg23 eeg24 eeg25 eeg26 eeg27 eeg28 eeg29 eeg30}

cutted_eeg=cell(1, 30);
for person=1:30
    for i=1:16
        cutted_eeg{1,person}(i,:)=eeg{1, person}(i,:)
    end
end


emd_eeg=cell(1, 30);
for person=1:30
    for i=1:16
        [imf,~,info] = emd( eeg{1, person}(i,:));
        emd_eeg{1,person}(i,:)=imf(:,1)+imf(:,2)+imf(:,3)
    end
end

save emd_eeg


emd(eeg1(1,:))