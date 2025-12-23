%% deney için sınıflandırma
data=load('features_2class.mat');
data=data.features_2class   ;
% knn  = [];
% tree = [];
% svm  = [];
% dsc  = [];
% nvi  = [];
% esm  = [];
% nrl  = [];
% mlt  = [];
% krn  = [];

label={[ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];...
    [ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];...
    [ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];...
    [ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];...
    [ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];...
    [ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1)];[ones(15,1); ...
    2*ones(15,1)];[ones(15,1);2*ones(15,1) ]};

train = [];
% sira ile datalari al
for i=1:30
    trainmat    = [];
    trainlabelmat = [];
    index       = 1;
    test        = data(i,1);
    testmat     = cell2mat(test);
    test_label  = label(i,1);
    testlabelmat= cell2mat(test_label);

    % sirasi alinan haricindekileri isle
    for j=1:30
        if i~=j
            train{index,1}       = data(j,1);
            train_label{index,1} = label(j,1);
            index                = index + 1;
        end
    end

    % aldigimiz train datalarini isleyelim
    trainmat      = [];
    trainlabelmat = [];
    trainmat      = [train{1,1}{1,1}; train{2,1}{1,1}; train{3,1}{1,1};
        train{4,1}{1,1}; train{5,1}{1,1}; train{6,1}{1,1}; train{7,1}{1,1};
        train{8,1}{1,1}; train{9,1}{1,1}; train{10,1}{1,1}; train{11,1}{1,1};
        train{12,1}{1,1}; train{13,1}{1,1}; train{14,1}{1,1}; train{15,1}{1,1};
        train{16,1}{1,1}; train{17,1}{1,1}; train{18,1}{1,1}; train{19,1}{1,1};
        train{20,1}{1,1}; train{21,1}{1,1}; train{22,1}{1,1}; train{23,1}{1,1};
        train{24,1}{1,1}; train{25,1}{1,1}; train{26,1}{1,1}; train{27,1}{1,1};
        train{28,1}{1,1}; train{29,1}{1,1}];


    trainlabelmat  = [train_label{1,1}{1,1}; train_label{2,1}{1,1}; train_label{3,1}{1,1};
        train_label{4,1}{1,1}; train_label{5,1}{1,1}; train_label{6,1}{1,1}; train_label{7,1}{1,1};
        train_label{8,1}{1,1}; train_label{9,1}{1,1}; train_label{10,1}{1,1}; train_label{11,1}{1,1};
        train_label{12,1}{1,1}; train_label{13,1}{1,1}; train_label{14,1}{1,1}; train_label{15,1}{1,1};
        train_label{16,1}{1,1}; train_label{17,1}{1,1}; train_label{18,1}{1,1}; train_label{19,1}{1,1};
        train_label{20,1}{1,1}; train_label{21,1}{1,1}; train_label{22,1}{1,1}; train_label{23,1}{1,1};
        train_label{24,1}{1,1}; train_label{25,1}{1,1}; train_label{26,1}{1,1}; train_label{27,1}{1,1};
        train_label{28,1}{1,1}; train_label{29,1}{1,1}];

   % knn{i,1}  = classifyknn(testmat,trainmat,testlabelmat,trainlabelmat)
   % tree{i,1} = classifytree(testmat,trainmat,testlabelmat,trainlabelmat)
   % svm{i,1}  = classifysvm(testmat,trainmat,testlabelmat,trainlabelmat)
   %dsc{i,1}  = classifydiscriminant(testmat,trainmat,testlabelmat,trainlabelmat)
   % nvi{i,1}  = classifynaive(testmat,trainmat,testlabelmat,trainlabelmat)
   %esm{i,1}  = classifyensemble(testmat,trainmat,testlabelmat,trainlabelmat)
   % nrl{i,1}  = classifyneural(testmat,trainmat,testlabelmat,trainlabelmat)
   %deepneural{i,1}=classifydeepneural(testmat,trainmat,testlabelmat,trainlabelmat)
   % mlt{i,1}  = classifymulticlasssvm(testmat,trainmat,testlabelmat,trainlabelmat)
   % krn{i,1}  = classifykernel(testmat,trainmat,testlabelmat,trainlabelmat)
[accuracy, recall, precision, fmeasure,C] = calculateMetricsKNN(trainmat, trainlabelmat, testmat, testlabelmat);
KNN{i,1}=accuracy;
KNN{i,2}=precision;
KNN{i,3}=recall;
KNN{i,4}=fmeasure;
confisionmatrix_KNN{i,1}=C;


[accuracy, recall, precision, fmeasure,C] = calculateMetricsSVM(trainmat, trainlabelmat, testmat, testlabelmat);
SVM{i,1}=accuracy;
SVM{i,2}=precision;
SVM{i,3}=recall;
SVM{i,4}=fmeasure;
confisionmatrix_SVM{i,1}=C;

[accuracy, recall, precision, fmeasure,C] = calculateMetricsDecisionTree(trainmat, trainlabelmat, testmat, testlabelmat);
DT{i,1}=accuracy;
DT{i,2}=precision;
DT{i,3}=recall;
DT{i,4}=fmeasure;
confisionmatrix_DecisionTree{i,1}=C;

% [accuracy, recall, precision, fmeasure] = calculateMetricsLogisticRegression(trainmat, trainlabelmat, testmat, testlabelmat);
% LR{i,1}=accuracy;
% LR{i,2}=precision;
% LR{i,3}=recall;
% LR{i,4}=fmeasure;

[accuracy, recall, precision, fmeasure,C] = calculateMetricsNaiveBayes(trainmat, trainlabelmat, testmat, testlabelmat);
NB{i,1}=accuracy;
NB{i,2}=precision;
NB{i,3}=recall;
NB{i,4}=fmeasure;
confisionmatrix_NaiveBayes{i,1}=C;

% [accuracy, recall, precision, fmeasure] = calculateMetricsNeuralNetwork(trainmat, trainlabelmat, testmat, testlabelmat);
% NN{i,1}=accuracy;
% NN{i,2}=precision;
% NN{i,3}=recall;
% NN{i,4}=fmeasure;

[accuracy, recall, precision, fmeasure,C] = calculateMetricsRandomForest(trainmat, trainlabelmat, testmat, testlabelmat);
RF{i,1}=accuracy;
RF{i,2}=precision;
RF{i,3}=recall;
RF{i,4}=fmeasure;
confisionmatrix_RandomForest{i,1}=C;

[accuracy, recall, precision, fmeasure,C] = calculateMetricsAdaBoost(trainmat, trainlabelmat, testmat, testlabelmat);
AB{i,1}=accuracy;
AB{i,2}=precision;
AB{i,3}=recall;
AB{i,4}=fmeasure;
confisionmatrix_Adaboost{i,1}=C;

[accuracy, recall, precision, fmeasure,C] = calculateMetricsBagging(trainmat, trainlabelmat, testmat, testlabelmat);
BAG{i,1}=accuracy;
BAG{i,2}=precision;
BAG{i,3}=recall;
BAG{i,4}=fmeasure;
confisionmatrix_Bagging{i,1}=C;

% [accuracy, recall, precision, fmeasure] = calculateMetricsGradientBoosting(trainmat, trainlabelmat, testmat, testlabelmat);
% GB{i,1}=accuracy;
% GB{i,2}=precision;
% GB{i,3}=recall;
% GB{i,4}=fmeasure;

[accuracy, recall, precision, fmeasure,C] = calculateMetricsKernel(trainmat, trainlabelmat, testmat, testlabelmat);
ker{i,1}=accuracy;
ker{i,2}=precision;
ker{i,3}=recall;
ker{i,4}=fmeasure;
confisionmatrix_kernel{i,1}=C;

[accuracy, recall, precision, fmeasure,C] = calculateMetricsNeural(trainmat, trainlabelmat, testmat, testlabelmat);
ner{i,1}=accuracy;
ner{i,2}=precision;
ner{i,3}=recall;
ner{i,4}=fmeasure;
confisionmatrix_neural{i,1}=C;
end

accuracy_KNN=sum(cell2mat(KNN(:,1)))/30;
precision_KNN=sum(cell2mat(KNN(:,2)))/30;
recall_KNN=sum(cell2mat(KNN(:,3)))/30;
fmeasure_KNN=sum(cell2mat(KNN(:,4)))/30;

accuracy_SVM=sum(cell2mat(SVM(:,1)))/30;
precision_SVM=sum(cell2mat(SVM(:,2)))/30;
recall_SVM=sum(cell2mat(SVM(:,3)))/30;
fmeasure_SVM=sum(cell2mat(SVM(:,4)))/30;

accuracy_DT=sum(cell2mat(DT(:,1)))/30;
precision_DT=sum(cell2mat(DT(:,2)))/30;
recall_DT=sum(cell2mat(DT(:,3)))/30;
fmeasure_DT=sum(cell2mat(DT(:,4)))/30;

% accuray_LR=sum(cell2mat(LR(:,1)))/30;
% fmeasure_LR=sum(cell2mat(LR(:,4)))/30;

accuracy_NB=sum(cell2mat(NB(:,1)))/30;
precision_NB=sum(cell2mat(NB(:,2)))/30;
recall_NB=sum(cell2mat(NB(:,3)))/30;
fmeasure_NB=sum(cell2mat(NB(:,4)))/30;
% 
% accuray_NN=sum(cell2mat(NN(:,1)))/30;
% fmeasure_NN=sum(cell2mat(NN(:,4)))/30;

accuracy_RF=sum(cell2mat(RF(:,1)))/30;
precision_RF=sum(cell2mat(RF(:,2)))/30;
recall_RF=sum(cell2mat(RF(:,3)))/30;
fmeasure_RF=sum(cell2mat(RF(:,4)))/30;

accuracy_AB=sum(cell2mat(AB(:,1)))/30;
precision_AB=sum(cell2mat(AB(:,2)))/30;
recall_AB=sum(cell2mat(AB(:,3)))/30;
fmeasure_AB=sum(cell2mat(AB(:,4)))/30;

accuracy_BAG=sum(cell2mat(BAG(:,1)))/30;
precision_BAG=sum(cell2mat(BAG(:,2)))/30;
recall_BAG=sum(cell2mat(BAG(:,3)))/30;
fmeasure_BAG=sum(cell2mat(BAG(:,4)))/30;
% 
% accuray_GB=sum(cell2mat(GB(:,1)))/30;
% fmeasure_GB=sum(cell2mat(GB(:,4)))/30;

accuracy_ker=sum(cell2mat(ker(:,1)))/30;
precision_ker=sum(cell2mat(ker(:,2)))/30;
recall_ker=sum(cell2mat(ker(:,3)))/30;
fmeasure_ker=sum(cell2mat(ker(:,4)))/30;

accuracy_ner=sum(cell2mat(ner(:,1)))/30;
precision_ner=sum(cell2mat(ner(:,2)))/30;
recall_ner=sum(cell2mat(ner(:,3)))/30;
fmeasure_ner=sum(cell2mat(ner(:,4)))/30;
%res_knn = sum(cell2mat(knn))/30;
% res_tree = sum(cell2mat(tree))/30;
%res_svm = sum(cell2mat(svm))/30;
% res_dsc = sum(cell2mat(dsc))/30;
%res_nvi = sum(cell2mat(nvi))/30;
%res_esm = sum(cell2mat(esm))/30;
%res_nrl = sum(cell2mat(nrl))/30;
%res_dep = sum(cell2mat(deepneural))/30;
%res_mlt = sum(cell2mat(mlt))/30;
%res_krn = sum(cell2mat(krn))/30;


% title('KNN','SVM','DT','NB','RF','AB','BAG','ker','ner')
% class_matrix=[res_svm res_nvi res_nrl res_mlt res_krn];

%title('accuracy_KNN','accuracy_SVM','accuracy_DecisionTree','accuracy_NaiveBayes','accuracy_RandomForest','accuracy_AdaBoost','accuracy_Bagging','accuracy_Kernel','accuracy_Neural')
accuracy_matrix=[accuracy_KNN accuracy_SVM accuracy_DT accuracy_NB accuracy_RF accuracy_AB accuracy_BAG accuracy_ker accuracy_ner];
%title('fmeasure_KNN','fmeasure_SVM','fmeasure_DecisionTree','fmeasure_NaiveBayes','fmeasure_RandomForest','fmeasure_AdaBoost','fmeasure_Bagging','fmeasure_Kernel','fmeasure_Neural')
precision_matrix=[precision_KNN precision_SVM precision_DT precision_NB precision_RF precision_AB precision_BAG precision_ker precision_ner];
recall_matrix=[recall_KNN recall_SVM recall_DT recall_NB recall_RF recall_AB recall_BAG recall_ker recall_ner];
fmeasure_matrix=[fmeasure_KNN fmeasure_SVM fmeasure_DT fmeasure_NB fmeasure_RF fmeasure_AB fmeasure_BAG fmeasure_ker fmeasure_ner];
accuracy_matrix=accuracy_matrix*100
precision_matrix=precision_matrix*100
recall_matrix=recall_matrix*100
%fmeasure_matrix=fmeasure_matrix/100