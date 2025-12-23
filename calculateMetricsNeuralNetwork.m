function [accuracy, recall, precision, fmeasure,C] = calculateMetricsNeuralNetwork(trainmat, trainlabelmat, testmat, testlabelmat)
    mdl = patternnet(10); % 10 gizli nöronlu bir yapay sinir ağı

    mdl = train(mdl, trainmat', trainlabelmat');

    predictions = mdl(testmat');

    [~, predictions] = max(predictions);
    predictions = predictions';

    C = confusionmat(testlabelmat, predictions);

    accuracy = sum(diag(C)) / sum(C(:));
    
    % Duyarlılık (recall) hesapla
    recall = C(1,1)./sum(C(:,1));
    
    % Hassasiyet (precision) hesapla
    precision = C(1,1) ./ sum(C(1,:));
    
    % F-measure hesapla
   
    fmeasure = 2 * (precision .* recall) / (precision + recall);
end
