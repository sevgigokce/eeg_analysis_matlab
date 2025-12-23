%%shapiro wilk testi tek tek 
ds = load('istatistik_2and3imagination.mat');
ds = ds.istatistik;
normal_matrix=[];
non_normal_matrix=[];
correlation_matrix=ds;

title=['00min_CH01';'00min_CH02';'00min_CH03';'00min_CH04';'00min_CH05';'00min_CH06';'00min_CH07';'00min_CH08';'00min_CH09';'00min_CH10';'00min_CH11';'00min_CH12';'00min_CH13';'00min_CH14';'00min_CH15';'00min_CH16'
'00max_CH01';'00max_CH02';'00max_CH03';'00max_CH04';'00max_CH05';'00max_CH06';'00max_CH07';'00max_CH08';'00max_CH09';'00max_CH10';'00max_CH11';'00max_CH12';'00max_CH13';'00max_CH14';'00max_CH15';'00max_CH16'
'000ar_CH01';'000ar_CH02';'000ar_CH03';'000ar_CH04';'000ar_CH05';'000ar_CH06';'000ar_CH07';'000ar_CH08';'000ar_CH09';'000ar_CH10';'000ar_CH11';'000ar_CH12';'000ar_CH13';'000ar_CH14';'000ar_CH15';'000ar_CH16'
'000md_CH01';'000md_CH02';'000md_CH03';'000md_CH04';'000md_CH05';'000md_CH06';'000md_CH07';'000md_CH08';'000md_CH09';'000md_CH10';'000md_CH11';'000md_CH12';'000md_CH13';'000md_CH14';'000md_CH15';'000md_CH16'
'00var_CH01';'00var_CH02';'00var_CH03';'00var_CH04';'00var_CH05';'00var_CH06';'00var_CH07';'00var_CH08';'00var_CH09';'00var_CH10';'00var_CH11';'00var_CH12';'00var_CH13';'00var_CH14';'00var_CH15';'00var_CH16'
'000sd_CH01';'000sd_CH02';'000sd_CH03';'000sd_CH04';'000sd_CH05';'000sd_CH06';'000sd_CH07';'000sd_CH08';'000sd_CH09';'000sd_CH10';'000sd_CH11';'000sd_CH12';'000sd_CH13';'000sd_CH14';'000sd_CH15';'000sd_CH16'
'000am_CH01';'000am_CH02';'000am_CH03';'000am_CH04';'000am_CH05';'000am_CH06';'000am_CH07';'000am_CH08';'000am_CH09';'000am_CH10';'000am_CH11';'000am_CH12';'000am_CH13';'000am_CH14';'000am_CH15';'000am_CH16'
'000re_CH01';'000re_CH02';'000re_CH03';'000re_CH04';'000re_CH05';'000re_CH06';'000re_CH07';'000re_CH08';'000re_CH09';'000re_CH10';'000re_CH11';'000re_CH12';'000re_CH13';'000re_CH14';'000re_CH15';'000re_CH16'
'000le_CH01';'000le_CH02';'000le_CH03';'000le_CH04';'000le_CH05';'000le_CH06';'000le_CH07';'000le_CH08';'000le_CH09';'000le_CH10';'000le_CH11';'000le_CH12';'000le_CH13';'000le_CH14';'000le_CH15';'000le_CH16'
'000sh_CH01';'000sh_CH02';'000sh_CH03';'000sh_CH04';'000sh_CH05';'000sh_CH06';'000sh_CH07';'000sh_CH08';'000sh_CH09';'000sh_CH10';'000sh_CH11';'000sh_CH12';'000sh_CH13';'000sh_CH14';'000sh_CH15';'000sh_CH16'
'000te_CH01';'000te_CH02';'000te_CH03';'000te_CH04';'000te_CH05';'000te_CH06';'000te_CH07';'000te_CH08';'000te_CH09';'000te_CH10';'000te_CH11';'000te_CH12';'000te_CH13';'000te_CH14';'000te_CH15';'000te_CH16'
'lrssv_CH01';'lrssv_CH02';'lrssv_CH03';'lrssv_CH04';'lrssv_CH05';'lrssv_CH06';'lrssv_CH07';'lrssv_CH08';'lrssv_CH09';'lrssv_CH10';'lrssv_CH11';'lrssv_CH12';'lrssv_CH13';'lrssv_CH14';'lrssv_CH15';'lrssv_CH16'
'00mte_CH01';'00mte_CH02';'00mte_CH03';'00mte_CH04';'00mte_CH05';'00mte_CH06';'00mte_CH07';'00mte_CH08';'00mte_CH09';'00mte_CH10';'00mte_CH11';'00mte_CH12';'00mte_CH13';'00mte_CH14';'00mte_CH15';'00mte_CH16'
'000me_CH01';'000me_CH02';'000me_CH03';'000me_CH04';'000me_CH05';'000me_CH06';'000me_CH07';'000me_CH08';'000me_CH09';'000me_CH10';'000me_CH11';'000me_CH12';'000me_CH13';'000me_CH14';'000me_CH15';'000me_CH16'
'00mcl_CH01';'00mcl_CH02';'00mcl_CH03';'00mcl_CH04';'00mcl_CH05';'00mcl_CH06';'00mcl_CH07';'00mcl_CH08';'00mcl_CH09';'00mcl_CH10';'00mcl_CH11';'00mcl_CH12';'00mcl_CH13';'00mcl_CH14';'00mcl_CH15';'00mcl_CH16'
'00n2d_CH01';'00n2d_CH02';'00n2d_CH03';'00n2d_CH04';'00n2d_CH05';'00n2d_CH06';'00n2d_CH07';'00n2d_CH08';'00n2d_CH09';'00n2d_CH10';'00n2d_CH11';'00n2d_CH12';'00n2d_CH13';'00n2d_CH14';'00n2d_CH15';'00n2d_CH16'
'0002d_CH01';'0002d_CH02';'0002d_CH03';'0002d_CH04';'0002d_CH05';'0002d_CH06';'0002d_CH07';'0002d_CH08';'0002d_CH09';'0002d_CH10';'0002d_CH11';'0002d_CH12';'0002d_CH13';'0002d_CH14';'0002d_CH15';'0002d_CH16'
'00n1d_CH01';'00n1d_CH02';'00n1d_CH03';'00n1d_CH04';'00n1d_CH05';'00n1d_CH06';'00n1d_CH07';'00n1d_CH08';'00n1d_CH09';'00n1d_CH10';'00n1d_CH11';'00n1d_CH12';'00n1d_CH13';'00n1d_CH14';'00n1d_CH15';'00n1d_CH16'
'0001d_CH01';'0001d_CH02';'0001d_CH03';'0001d_CH04';'0001d_CH05';'0001d_CH06';'0001d_CH07';'0001d_CH08';'0001d_CH09';'0001d_CH10';'0001d_CH11';'0001d_CH12';'0001d_CH13';'0001d_CH14';'0001d_CH15';'0001d_CH16'
'0kurt_CH01';'0kurt_CH02';'0kurt_CH03';'0kurt_CH04';'0kurt_CH05';'0kurt_CH06';'0kurt_CH07';'0kurt_CH08';'0kurt_CH09';'0kurt_CH10';'0kurt_CH11';'0kurt_CH12';'0kurt_CH13';'0kurt_CH14';'0kurt_CH15';'0kurt_CH16'
'0skew_CH01';'0skew_CH02';'0skew_CH03';'0skew_CH04';'0skew_CH05';'0skew_CH06';'0skew_CH07';'0skew_CH08';'0skew_CH09';'0skew_CH10';'0skew_CH11';'0skew_CH12';'0skew_CH13';'0skew_CH14';'0skew_CH15';'0skew_CH16'
'000hc_CH01';'000hc_CH02';'000hc_CH03';'000hc_CH04';'000hc_CH05';'000hc_CH06';'000hc_CH07';'000hc_CH08';'000hc_CH09';'000hc_CH10';'000hc_CH11';'000hc_CH12';'000hc_CH13';'000hc_CH14';'000hc_CH15';'000hc_CH16'
'000hm_CH01';'000hm_CH02';'000hm_CH03';'000hm_CH04';'000hm_CH05';'000hm_CH06';'000hm_CH07';'000hm_CH08';'000hm_CH09';'000hm_CH10';'000hm_CH11';'000hm_CH12';'000hm_CH13';'000hm_CH14';'000hm_CH15';'000hm_CH16'
'000ha_CH01';'000ha_CH02';'000ha_CH03';'000ha_CH04';'000ha_CH05';'000ha_CH06';'000ha_CH07';'000ha_CH08';'000ha_CH09';'000ha_CH10';'000ha_CH11';'000ha_CH12';'000ha_CH13';'000ha_CH14';'000ha_CH15';'000ha_CH16'
'00bpd_CH01';'00bpd_CH02';'00bpd_CH03';'00bpd_CH04';'00bpd_CH05';'00bpd_CH06';'00bpd_CH07';'00bpd_CH08';'00bpd_CH09';'00bpd_CH10';'00bpd_CH11';'00bpd_CH12';'00bpd_CH13';'00bpd_CH14';'00bpd_CH15';'00bpd_CH16'
'00bpt_CH01';'00bpt_CH02';'00bpt_CH03';'00bpt_CH04';'00bpt_CH05';'00bpt_CH06';'00bpt_CH07';'00bpt_CH08';'00bpt_CH09';'00bpt_CH10';'00bpt_CH11';'00bpt_CH12';'00bpt_CH13';'00bpt_CH14';'00bpt_CH15';'00bpt_CH16'
'00bpa_CH01';'00bpa_CH02';'00bpa_CH03';'00bpa_CH04';'00bpa_CH05';'00bpa_CH06';'00bpa_CH07';'00bpa_CH08';'00bpa_CH09';'00bpa_CH10';'00bpa_CH11';'00bpa_CH12';'00bpa_CH13';'00bpa_CH14';'00bpa_CH15';'00bpa_CH16'
'00bpb_CH01';'00bpb_CH02';'00bpb_CH03';'00bpb_CH04';'00bpb_CH05';'00bpb_CH06';'00bpb_CH07';'00bpb_CH08';'00bpb_CH09';'00bpb_CH10';'00bpb_CH11';'00bpb_CH12';'00bpb_CH13';'00bpb_CH14';'00bpb_CH15';'00bpb_CH16'
'00bpg_CH01';'00bpg_CH02';'00bpg_CH03';'00bpg_CH04';'00bpg_CH05';'00bpg_CH06';'00bpg_CH07';'00bpg_CH08';'00bpg_CH09';'00bpg_CH10';'00bpg_CH11';'00bpg_CH12';'00bpg_CH13';'00bpg_CH14';'00bpg_CH15';'00bpg_CH16'
'00rba_CH01';'00rba_CH02';'00rba_CH03';'00rba_CH04';'00rba_CH05';'00rba_CH06';'00rba_CH07';'00rba_CH08';'00rba_CH09';'00rba_CH10';'00rba_CH11';'00rba_CH12';'00rba_CH13';'00rba_CH14';'00rba_CH15';'00rba_CH16'];



for i=1:480
    for j=1:2
        [H(i,j), pValue(i,j), W(i,j)]=swtest(ds{1,i}(:,j),0.05);
    end

     if H(i,1)==0 && H(i,2)==0 % burada 0 se hipotezi kabul et degilse reddet
        normal_matrix{1,i}(:,1)=[ds{1,i}(:,1)];
        normal_matrix{1,i}(:,2)=[ds{1,i}(:,2)]; 
        normal_matrix{2,i} = title(i,:) ;
    else
        normal_matrix{1,i}(:,1)=nan;
        normal_matrix{1,i}(:,2)=nan; 
        normal_matrix{2,i} = title(i,:);
    end


    if H(i,1)~= 0 || H(i,2)~=0 % burada 0 olanlari normal kabul etmistik olmayanlari nonnormal olarak kabul ediyoruz.
        non_normal_matrix{1,i}(:,1)=[ds{1,i}(:,1)];
        non_normal_matrix{1,i}(:,2)=[ds{1,i}(:,2)];
        non_normal_matrix{2,i} = title(i,:) ;
    else
        non_normal_matrix{1,i}(:,1)=nan;
        non_normal_matrix{1,i}(:,2)=nan; 
        non_normal_matrix{2,i} = title(i,:) ;
    end
end

%%normal dağılıma sahip özelliklerin matrisini oluşturduk.
% asagidaki kodlarimizda none olan degerleri matrisimizden siliyoruz.
x=[];
for i=1:480    
        if isnan( normal_matrix{1,i}(:,1))
            x(length(x)+1) = i; % her bir kisi icin kolon indexleri
        end
end


%%normal dağılıma sahip özelliklerin matrisini oluşturduk.
x=[];
for i=1:480  
        if isnan( normal_matrix{1,i}(:,1))
            x(length(x)+1) = i; % her bir kisi icin kolon indexleri
        end
end

normal_matrix(:,[x]) = [];
%%normal dağılıma sahip olmayan özelliklerin matrisini oluşturduk.
x=[];
for i=1:480    
        if isnan( non_normal_matrix{1,i}(:,1))
            x(length(x)+1) = i; % her bir kisi icin kolon indexleri
        end
end

non_normal_matrix(:,[x]) = [];
%%özelliklerin biribiri ile dağılımını incelemek için correlation matrix
%%oluşturduk.
for i=1:480
    correlation_matrix{2,i} = title(i,:) ;
end

save('normal_matrix','normal_matrix');
save('non_normal_matrix','non_normal_matrix');
save('correlation_matrix',"correlation_matrix")