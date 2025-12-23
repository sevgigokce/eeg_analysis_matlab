%%classification learner kullanmak için
%  Electroencephalogram (EEG) Feature Extraction toolbox

%---Input-------------------------------------------------------------
%
% opts : parameter settings
%

%---Output------------------------------------------------------------
% feat:  Feature vector
%---------------------------------------------------------------------


%%  Extract features ( without parameter )

fs = 500;             % Sampling frequency
Ts = 1 / fs;          % Period
len = 4500;           %1 trail için 500*9
preprocessing_signal  = load('ica_filter_emd_eeg.mat');
preprocessing_signal=preprocessing_signal.ica_filter_emd_eeg;
%%classification learner kullanmak için
%%rest
for k=1:30
    eegSignal{k} = preprocessing_signal{1,k};
    for ch=1:16
        for i=1:15
            part_rest = eegSignal{1,k}(ch,(i-1)*len+1:i*len);
            rest = part_rest(1,1:fs*2); %m rest 0 2 sec
            %rest_part{1,k}(i,ch)=rest;
            %Minimum Value
            f1{1,k}(i,ch) =jfeeg('min', rest);
            %Maximum Value
            f2{1,k}(i,ch) =jfeeg('max', rest);
            %Auto-Regressive Model
            opts.order = 1;
            f3{1,k}(i,ch) =jfeeg('ar', rest, opts);
            %Median Value
            f4{1,k}(i,ch) =jfeeg('md', rest);
            %Variance
            f5{1,k}(i,ch) =jfeeg('var', rest);
            %Standard Deviation
            f6{1,k}(i,ch) =jfeeg('sd', rest);
            %Arithmetic Mean
            f7{1,k}(i,ch) =jfeeg('am', rest);
            %RenyiEntropy
            opts.alpha = 2;
            f8{1,k}(i,ch) =jfeeg('re', rest, opts);
            %LogEnergyEntropy
            f9{1,k}(i,ch) =jfeeg('le', rest);
            %Shannon Entropy
            f10{1,k}(i,ch) =jfeeg('sh', rest);
            %Tsallis Entropy
            opts.alpha = 2;
            f11{1,k}(i,ch) = jfeeg('te', rest, opts);
            %Log Root Sum of Sequential Variation
            f12{1,k}(i,ch) =jfeeg('lrssv', rest);
            %Mean Teager Energy
            f13{1,k}(i,ch) =jfeeg('mte', rest);
            %Mean Energy
            f14{1,k}(i,ch) =jfeeg('me', rest);
            %Mean Curve Length
            f15{1,k}(i,ch) =jfeeg('mcl', rest);
            %Normalized Second Difference
            f16{1,k}(i,ch) =jfeeg('n2d', rest);
            %Second Difference
            f17{1,k}(i,ch) =jfeeg('2d', rest);
            %Normalized First Difference
            f18{1,k}(i,ch) =jfeeg('n1d', rest);
            %First Difference
            f19{1,k}(i,ch) =jfeeg('1d', rest);
            %Kurtosis
            f20{1,k}(i,ch) =jfeeg('kurt', rest);
            %Skewness
            f21{1,k}(i,ch) =jfeeg('skew', rest);
            % Hjorth Complexity
            f22{1,k}(i,ch) =jfeeg('hc', rest);
            %Hjorth Mobility
            f23{1,k}(i,ch) =jfeeg('hm', rest);
            %Hjorth Activity
            f24{1,k}(i,ch) =jfeeg('ha', rest);
            %Band Power Delt
            opts.fs = 500;
            f25{1,k}(i,ch) =jfeeg('bpd', rest, opts);
            %Band Power Theta
            opts.fs = 500;
            f26{1,k}(i,ch) =jfeeg('bpt', rest, opts);
            %Band Power Alpha
            opts.fs = 500;
            f27{1,k}(i,ch) =jfeeg('bpa', rest, opts);
            %Band Power Beta
            opts.fs =500;
            f28{1,k}(i,ch) =jfeeg('bpb', rest, opts);
            %Band Power Gamma
            opts.fs =500;
            f29{1,k}(i,ch) =jfeeg('bpg', rest, opts);
            %Ratio of Band Power Alpha to Beta
            opts.fs =500;
            f30{1,k}(i,ch) =jfeeg('rba', rest, opts);

            %Feature vector
            feat_rest{1,k} = [f1{1,k},f2{1,k},f3{1,k},f4{1,k},f5{1,k},f6{1,k},f7{1,k},f8{1,k},f9{1,k},f10{1,k}...
                ,f11{1,k},f12{1,k},f13{1,k},f14{1,k},f15{1,k},f16{1,k},f17{1,k},f18{1,k},f19{1,k},f20{1,k}...
                ,f21{1,k},f22{1,k},f23{1,k},f24{1,k},f25{1,k},f26{1,k},f27{1,k},f28{1,k},f29{1,k},f30{1,k}];


        end
    end
end


% imagination

for k=1:30
    eegSignal{k} = preprocessing_signal{1,k};
    for ch=1:16
        for i=1:15
            part_imagination = eegSignal{1,k}(ch,(i-1)*len+1:i*len);%%2.25-5.25
            imagination = part_imagination(1,fs*2.25:fs*5.25);
            %imagination_part{1,k}(i,ch)=imagination

            %Minimum Value
            f1{1,k}(i,ch) =jfeeg('min', imagination);
            %Maximum Value
            f2{1,k}(i,ch) =jfeeg('max', imagination);
            %Auto-Regressive Model
            opts.order = 1;
            f3{1,k}(i,ch) =jfeeg('ar', imagination, opts);
            %Median Value
            f4{1,k}(i,ch) =jfeeg('md', imagination);
            %Variance
            f5{1,k}(i,ch) =jfeeg('var', imagination);
            %Standard Deviation
            f6{1,k}(i,ch) =jfeeg('sd', imagination);
            %Arithmetic Mean
            f7{1,k}(i,ch) =jfeeg('am', imagination);
            %RenyiEntropy
            opts.alpha = 2;
            f8{1,k}(i,ch) =jfeeg('re', imagination, opts);
            %LogEnergyEntropy
            f9{1,k}(i,ch) =jfeeg('le', imagination);
            %Shannon Entropy
            f10{1,k}(i,ch) =jfeeg('sh', imagination);
            % Tsallis Entropy
            opts.alpha = 2;
            f11{1,k}(i,ch) = jfeeg('te', imagination, opts);
            %Log Root Sum of Sequential Variation
            f12{1,k}(i,ch) =jfeeg('lrssv', imagination);
            %Mean Teager Energy
            f13{1,k}(i,ch) =jfeeg('mte', imagination);
            %Mean Energy
            f14{1,k}(i,ch) =jfeeg('me', imagination);
            %Mean Curve Length
            f15{1,k}(i,ch) =jfeeg('mcl', imagination);
            %Normalized Second Difference
            f16{1,k}(i,ch) =jfeeg('n2d', imagination);
            %Second Difference
            f17{1,k}(i,ch) =jfeeg('2d', imagination);
            %Normalized First Difference
            f18{1,k}(i,ch) =jfeeg('n1d', imagination);
            %First Difference
            f19{1,k}(i,ch) =jfeeg('1d', imagination);
            %Kurtosis
            f20{1,k}(i,ch) =jfeeg('kurt', imagination);
            %Skewness
            f21{1,k}(i,ch) =jfeeg('skew', imagination);
            % Hjorth Complexity
            f22{1,k}(i,ch) =jfeeg('hc', imagination);
            % Hjorth Mobility
            f23{1,k}(i,ch) =jfeeg('hm', imagination);
            % Hjorth Activity
            f24{1,k}(i,ch) =jfeeg('ha', imagination);
            %Band Power Delta
            opts.fs = 500;
            f25{1,k}(i,ch) =jfeeg('bpd', imagination, opts);
            %Band Power Theta
            opts.fs = 500;
            f26{1,k}(i,ch) =jfeeg('bpt', imagination, opts);
            % Band Power Alpha
            opts.fs = 500;
            f27{1,k}(i,ch) =jfeeg('bpa', imagination, opts);
            %Band Power Beta
            opts.fs =500;
            f28{1,k}(i,ch) =jfeeg('bpb', imagination, opts);
            %Band Power Gamma
            opts.fs =500;
            f29{1,k}(i,ch) =jfeeg('bpg', imagination, opts);
            %Ratio of Band Power Alpha to Beta
            opts.fs =500;
            f30{1,k}(i,ch) =jfeeg('rba', imagination, opts);

            % Feature vector
            feat_imagination{1,k} = [f1{1,k},f2{1,k},f3{1,k},f4{1,k},f5{1,k},f6{1,k},f7{1,k},f8{1,k},f9{1,k},f10{1,k}...
                ,f11{1,k},f12{1,k},f13{1,k},f14{1,k},f15{1,k},f16{1,k},f17{1,k},f18{1,k},f19{1,k},f20{1,k}...
                ,f21{1,k},f22{1,k},f23{1,k},f24{1,k},f25{1,k},f26{1,k},f27{1,k},f28{1,k},f29{1,k},f30{1,k}];


        end
    end
end

% rest 
for m=1:30
    features_2rest{m,1} = [feat_rest{1,m}];
end

% imagination
for m=1:30
    features_2imagination{m,1} = [feat_imagination{1,m}];
end

%2 class rest imagination
for m=1:30
    features_2class{m,1} = [feat_rest{1,m};feat_imagination{1,m}];
end

features_all_2class=[features_2class{1,1};
    features_2class{2,1};
    features_2class{3,1};
    features_2class{4,1};
    features_2class{5,1};
    features_2class{6,1};
    features_2class{7,1};
    features_2class{8,1};
    features_2class{9,1};
    features_2class{10,1};
    features_2class{11,1};
    features_2class{12,1};
    features_2class{13,1};
    features_2class{14,1};
    features_2class{15,1};
    features_2class{16,1};
    features_2class{17,1};
    features_2class{18,1};
    features_2class{19,1};
    features_2class{20,1};
    features_2class{21,1};
    features_2class{22,1};
    features_2class{23,1};
    features_2class{24,1};
    features_2class{25,1};
    features_2class{26,1};
    features_2class{27,1};
    features_2class{28,1};
    features_2class{29,1};
    features_2class{30,1}];

label_2class=[ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);...
    ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);...
    ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);...
    ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);...
    ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);...
    ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1);ones(15,1); ...
    2*ones(15,1);ones(15,1);2*ones(15,1) ];


features_label_2class=[features_all_2class label_2class];

title={'min_CH1','min_CH2','min_CH3','min_CH4','min_CH5','min_CH6','min_CH7','min_CH8','min_CH9','min_CH10','min_CH11','min_CH12','min_CH13','min_CH14','min_CH15','min_CH16','max_CH1','max_CH2','max_CH3','max_CH4','max_CH5','max_CH6','max_CH7','max_CH8','max_CH9','max_CH10','max_CH11','max_CH12','max_CH13','max_CH14','max_CH15','max_CH16','ar_CH1','ar_CH2','ar_CH3','ar_CH4','ar_CH5','ar_CH6','ar_CH7','ar_CH8','ar_CH9','ar_CH10','ar_CH11','ar_CH12','ar_CH13','ar_CH14','ar_CH15','ar_CH16','md_CH1','md_CH2','md_CH3','md_CH4','md_CH5','md_CH6','md_CH7','md_CH8','md_CH9','md_CH10','md_CH11','md_CH12','md_CH13','md_CH14','md_CH15','md_CH16','var_CH1','var_CH2','var_CH3','var_CH4','var_CH5','var_CH6','var_CH7','var_CH8','var_CH9','var_CH10','var_CH11','var_CH12','var_CH13','var_CH14','var_CH15','var_CH16','sd_CH1','sd_CH2','sd_CH3','sd_CH4','sd_CH5','sd_CH6','sd_CH7','sd_CH8','sd_CH9','sd_CH10','sd_CH11','sd_CH12','sd_CH13','sd_CH14','sd_CH15','sd_CH16','am_CH1','am_CH2','am_CH3','am_CH4','am_CH5','am_CH6','am_CH7','am_CH8','am_CH9','am_CH10','am_CH11','am_CH12','am_CH13','am_CH14','am_CH15','am_CH16','re_CH1','re_CH2','re_CH3','re_CH4','re_CH5','re_CH6','re_CH7','re_CH8','re_CH9','re_CH10','re_CH11','re_CH12','re_CH13','re_CH14','re_CH15','re_CH16','le_CH1','le_CH2','le_CH3','le_CH4','le_CH5','le_CH6','le_CH7','le_CH8','le_CH9','le_CH10','le_CH11','le_CH12','le_CH13','le_CH14','le_CH15','le_CH16','sh_CH1','sh_CH2','sh_CH3','sh_CH4','sh_CH5','sh_CH6','sh_CH7','sh_CH8','sh_CH9','sh_CH10','sh_CH11','sh_CH12','sh_CH13','sh_CH14','sh_CH15','sh_CH16','te_CH1','te_CH2','te_CH3','te_CH4','te_CH5','te_CH6','te_CH7','te_CH8','te_CH9','te_CH10','te_CH11','te_CH12','te_CH13','te_CH14','te_CH15','te_CH16','lrssv_CH1','lrssv_CH2','lrssv_CH3','lrssv_CH4','lrssv_CH5','lrssv_CH6','lrssv_CH7','lrssv_CH8','lrssv_CH9','lrssv_CH10','lrssv_CH11','lrssv_CH12','lrssv_CH13','lrssv_CH14','lrssv_CH15','lrssv_CH16','mte_CH1','mte_CH2','mte_CH3','mte_CH4','mte_CH5','mte_CH6','mte_CH7','mte_CH8','mte_CH9','mte_CH10','mte_CH11','mte_CH12','mte_CH13','mte_CH14','mte_CH15','mte_CH16','me_CH1','me_CH2','me_CH3','me_CH4','me_CH5','me_CH6','me_CH7','me_CH8','me_CH9','me_CH10','me_CH11','me_CH12','me_CH13','me_CH14','me_CH15','me_CH16','mcl_CH1','mcl_CH2','mcl_CH3','mcl_CH4','mcl_CH5','mcl_CH6','mcl_CH7','mcl_CH8','mcl_CH9','mcl_CH10','mcl_CH11','mcl_CH12','mcl_CH13','mcl_CH14','mcl_CH15','mcl_CH16','n2d_CH1','n2d_CH2','n2d_CH3','n2d_CH4','n2d_CH5','n2d_CH6','n2d_CH7','n2d_CH8','n2d_CH9','n2d_CH10','n2d_CH11','n2d_CH12','n2d_CH13','n2d_CH14','n2d_CH15','n2d_CH16','2d_CH1','2d_CH2','2d_CH3','2d_CH4','2d_CH5','2d_CH6','2d_CH7','2d_CH8','2d_CH9','2d_CH10','2d_CH11','2d_CH12','2d_CH13','2d_CH14','2d_CH15','2d_CH16','n1d_CH1','n1d_CH2','n1d_CH3','n1d_CH4','n1d_CH5','n1d_CH6','n1d_CH7','n1d_CH8','n1d_CH9','n1d_CH10','n1d_CH11','n1d_CH12','n1d_CH13','n1d_CH14','n1d_CH15','n1d_CH16','1d_CH1','1d_CH2','1d_CH3','1d_CH4','1d_CH5','1d_CH6','1d_CH7','1d_CH8','1d_CH9','1d_CH10','1d_CH11','1d_CH12','1d_CH13','1d_CH14','1d_CH15','1d_CH16','kurt_CH1','kurt_CH2','kurt_CH3','kurt_CH4','kurt_CH5','kurt_CH6','kurt_CH7','kurt_CH8','kurt_CH9','kurt_CH10','kurt_CH11','kurt_CH12','kurt_CH13','kurt_CH14','kurt_CH15','kurt_CH16','skew_CH1','skew_CH2','skew_CH3','skew_CH4','skew_CH5','skew_CH6','skew_CH7','skew_CH8','skew_CH9','skew_CH10','skew_CH11','skew_CH12','skew_CH13','skew_CH14','skew_CH15','skew_CH16','hc_CH1','hc_CH2','hc_CH3','hc_CH4','hc_CH5','hc_CH6','hc_CH7','hc_CH8','hc_CH9','hc_CH10','hc_CH11','hc_CH12','hc_CH13','hc_CH14','hc_CH15','hc_CH16','hm_CH1','hm_CH2','hm_CH3','hm_CH4','hm_CH5','hm_CH6','hm_CH7','hm_CH8','hm_CH9','hm_CH10','hm_CH11','hm_CH12','hm_CH13','hm_CH14','hm_CH15','hm_CH16','ha_CH1','ha_CH2','ha_CH3','ha_CH4','ha_CH5','ha_CH6','ha_CH7','ha_CH8','ha_CH9','ha_CH10','ha_CH11','ha_CH12','ha_CH13','ha_CH14','ha_CH15','ha_CH16','bpd_CH1','bpd_CH2','bpd_CH3','bpd_CH4','bpd_CH5','bpd_CH6','bpd_CH7','bpd_CH8','bpd_CH9','bpd_CH10','bpd_CH11','bpd_CH12','bpd_CH13','bpd_CH14','bpd_CH15','bpd_CH16','bpt_CH1','bpt_CH2','bpt_CH3','bpt_CH4','bpt_CH5','bpt_CH6','bpt_CH7','bpt_CH8','bpt_CH9','bpt_CH10','bpt_CH11','bpt_CH12','bpt_CH13','bpt_CH14','bpt_CH15','bpt_CH16','bpa_CH1','bpa_CH2','bpa_CH3','bpa_CH4','bpa_CH5','bpa_CH6','bpa_CH7','bpa_CH8','bpa_CH9','bpa_CH10','bpa_CH11','bpa_CH12','bpa_CH13','bpa_CH14','bpa_CH15','bpa_CH16','bpb_CH1','bpb_CH2','bpb_CH3','bpb_CH4','bpb_CH5','bpb_CH6','bpb_CH7','bpb_CH8','bpb_CH9','bpb_CH10','bpb_CH11','bpb_CH12','bpb_CH13','bpb_CH14','bpb_CH15','bpb_CH16','bpg_CH1','bpg_CH2','bpg_CH3','bpg_CH4','bpg_CH5','bpg_CH6','bpg_CH7','bpg_CH8','bpg_CH9','bpg_CH10','bpg_CH11','bpg_CH12','bpg_CH13','bpg_CH14','bpg_CH15','bpg_CH16','rba_CH1','rba_CH2','rba_CH3','rba_CH4','rba_CH5','rba_CH6','rba_CH7','rba_CH8','rba_CH9','rba_CH10','rba_CH11','rba_CH12','rba_CH13','rba_CH14','rba_CH15','rba_CH16','LABEL'};

xlswrite('experiment2_2class.xlsx',title,1,'A1');
xlswrite('experiment2_2class.xlsx',features_label_2class,1,'A2');




% %
% No.	Abbreviation	Name	Parameter ( default )
% 30	'rba'	Ratio of Band Power Alpha to Beta	opts.fs =
% 29	'bpg'	Band Power Gamma	opts.fs =
% 28	'bpb'	Band Power Beta	opts.fs =
% 27	'bpa'	Band Power Alpha	opts.fs =
% 26	'bpt'	Band Power Theta	opts.fs =
% 25	'bpd'	Band Power Delta	opts.fs =
% 24	'ha'	Hjorth Activity	-
% 23	'hm'	Hjorth Mobility	-
% 22	'hc'	Hjorth Complexity	-
% 21	'skew'	Skewness	-
% 20	'kurt'	Kurtosis	-
% 19	'1d'	First Difference	-
% 18	'n1d'	Normalized First Difference	-
% 17	'2d'	Second Difference	-
% 16	'n2d'	Normalized Second Difference	-
% 15	'mcl'	Mean Curve Length	-
% 14	'me'	Mean Energy	-
% 13	'mte'	Mean Teager Energy	-
% 12	'lrssv'	Log Root Sum of Sequential Variation	-
% 11	'te'	Tsallis Entropy	opts.alpha = 2
% 10	'sh'	Shannon Entropy	-
% 09	'le'	LogEnergyEntropy	-
% 08	're'	RenyiEntropy	opts.alpha = 2
% 07	'am'	Arithmetic Mean	-
% 06	'sd'	Standard Deviation	-
% 05	'var'	Variance	-
% 04	'md'	Median Value	-
% 03	'ar'	Auto-Regressive Model	opts.order = 4
% 02	'max'	Maximum Value	-
% 01	'min'	Minimum Value	-

