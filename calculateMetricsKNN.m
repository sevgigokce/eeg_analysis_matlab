function [accuracy, recall, precision, fmeasure,C] = calculateMetricsKNN(trainmat, trainlabelmat, testmat, testlabelmat)
    mdl = fitcknn(trainmat, trainlabelmat, 'NumNeighbors', 3);

    predictions = predict(mdl, testmat);

    C = confusionmat(testlabelmat, predictions);

    accuracy = sum(diag(C)) / sum(C(:));
    
    % Duyarlılık (recall) hesapla
    recall = C(1,1)./sum(C(:,1));
    
    % Hassasiyet (precision) hesapla
    precision = C(1,1) ./ sum(C(1,:));
    
    % F-measure hesapla
   
    fmeasure = 2 * (precision .* recall) / (precision + recall);
end

