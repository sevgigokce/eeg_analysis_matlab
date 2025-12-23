function [accuracy, recall, precision, fmeasure,C] = calculateMetricsBagging(trainmat, trainlabelmat, testmat, testlabelmat)
    mdl = TreeBagger(100, trainmat, trainlabelmat); % 100 ağaçlık Bagging sınıflandırıcısı

    predictions = predict(mdl, testmat);
    predictions = str2double(predictions);

    C = confusionmat(testlabelmat, predictions);

    accuracy = sum(diag(C)) / sum(C(:));
    
    % Duyarlılık (recall) hesapla
    recall = C(1,1)./sum(C(:,1));
    
    % Hassasiyet (precision) hesapla
    precision = C(1,1) ./ sum(C(1,:));
    
    % F-measure hesapla
   
    fmeasure = 2 * (precision .* recall) / (precision + recall);
end
