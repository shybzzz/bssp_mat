function [] = bscan_path( specimens, root, fileName, p, h_eval, step, begin, lines, total )
%BSCAN_PATH Summary of this function goes here
%   Detailed explanation goes here

specimensS = size(specimens);
per_line = total/lines;
for lc = 1:specimensS(2)
    files = specimens_path(specimens(lc), root, fileName);
    f = figure;
    filesS = size(files);
    filesC = filesS(2);
    max_(1:filesC, 1:lines) = nan;
    min_(1:filesC, 1:lines) = nan;
    median_(1:filesC, 1:lines) = nan;
    mean_(1:filesC, 1:lines) = nan;
    ZZ = [];
    
    fLc = 1;
    for lcF = 1:filesC
        fName = files(lcF).fileName;
        for lcL = 1:lines
            sF = subplot(lines, filesC, (lcL - 1) * filesC + lcF);
            if(exist(fName, "file"))
                d = load(fName);
                Z = bscan(sF, d.aScans((lcL-1)*per_line+1:(lcL*per_line), :), p, h_eval, step, begin);
                %ZZ(lcF, :) = [ZZ(lcF, :), Z(:)'];
                max_(lcF, lcL) = max(max(Z));
                min_(lcF, lcL) = min(min(Z));
                median_(lcF, lcL) = median(median(Z));
                mean_(lcF, lcL) = mean(mean(Z));
            end
            fLc = fLc + 1;
        end
    end
    
    fLc = 1;
    lims = [min(min(min_)), max(max(max_))];
    for lcF = 1:filesC
        for lcL = 1:lines
            sF = subplot(lines, filesC,  (lcL - 1) * filesC + lcF);
            set(sF, 'CLim', lims);
            colorbar('Limits',lims);
            
            label = files(lcF).label;
            medianTitle = strcat('Median = ', num2str(round(median_(lcF, lcL) * 100)), '%');
            meanTitle = strcat('Mean = ', num2str(round(mean_(lcF, lcL) * 100)), '%');
            minTitle = strcat('Min = ', num2str(round(min_(lcF, lcL) * 100)), '%');
            maxTitle = strcat('Max = ', num2str(round(max_(lcF, lcL) * 100)), '%');
            title({...
                strcat(...
                  '(', label, '-', num2str(lcL), ')')...
                strcat(...
                medianTitle, '; '...
                , meanTitle, '; ')...
                , strcat(...
                minTitle, '; '...
                , maxTitle, '; '...
                )});
            
            fLc = fLc + 1;
        end
        
    end
end

end

