function [accuracy, recall, precision, fmeasure,C] = calculateMetricsLogisticRegression(trainmat, trainlabelmat, testmat, testlabelmat)
    mdl = fitglm(trainmat, trainlabelmat, 'Distribution', 'binomial', 'Link', 'logit'); % Logistic Regression sınıflandırıcısı

    predictions = predict(mdl, testmat);

    threshold = 0.5; % Eşik değeri
    predictions = double(predictions >= threshold);

    C = confusionmat(testlabelmat, predictions);

    accuracy = sum(diag(C)) / sum(C(:));
    
    % Duyarlılık (recall) hesapla
    recall = C(1,1)./sum(C(:,1));
    
    % Hassasiyet (precision) hesapla
    precision = C(1,1) ./ sum(C(1,:));
    
    % F-measure hesapla
   
    fmeasure = 2 * (precision .* recall) / (precision + recall);
end
