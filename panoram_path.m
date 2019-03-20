function [ data, bss, bss_min, bss_max, bss_median ] = panoram_path( files, size_x, size_y, per_specimen )
%PANORAM_PATH Summary of this function goes here
%   Detailed explanation goes here


filesS = size(files);
sX = filesS(2);
sY = filesS(1);

bss = [];
bss_median = nan(sX, 1);
bss_size = zeros(sX, 1);
bss_mean = nan(sX, 1);
bss_min = nan(sX, 1);
bss_max = nan(sX, 1);

for lcX  = 1:sX
    bssAll = [];
    for lcY = 1:sY
        f_name = files(lcY, lcX).fileName;
        if(exist(f_name))
            d = load(f_name);
            data(lcY, lcX) = d;
            bb = d.bss;            
        else
            bb = nan(1, per_specimen);
        end
        bssAll = [bssAll, bb];
    end
    bss = [bss; bssAll];
    notNan = bssAll(~isnan(bssAll));
    bss_median(lcX) = median(notNan);
    bss_mean(lcX) = mean(notNan);
    bss_min(lcX) = min(notNan);
    bss_max(lcX) = max(notNan);
    sNotNan = size(notNan);
    bss_size(lcX) = sNotNan(2);
end
bss = bss';

bss_max_ = max(bss_max);

res = figure;
for lcX = 1:sX
    subplot1 = subplot(sY + 1, sX, lcX);
    hist(bss(:, lcX));
    xlim(subplot1,[0 1.1 * bss_max_]);
    ylim(subplot1,[0 100]);
    set(subplot1,'XGrid','on','YGrid','on');
    medianTitle = strcat('Median = ', num2str(round(bss_median(lcX) * 100)), '%');
    meanTitle = strcat('Mean = ', num2str(round(bss_mean(lcX) * 100)), '%');
    minTitle = strcat('Min = ', num2str(round(bss_min(lcX) * 100)), '%');
    maxTitle = strcat('Max = ', num2str(round(bss_max(lcX) * 100)), '%');
    sizeTitle = strcat('Count = ', num2str(bss_size(lcX)));
    title(strcat(...
          medianTitle, '; '...
        , meanTitle, '; '...
        , minTitle, '; '...
        , maxTitle, '; '...
        , sizeTitle...
        ));
end

for lcX  = 1:sX
    for lcY = 1:sY
        d = data(lcY, lcX);
        subplot1 = subplot(sY + 1, sX, lcY * sX + lcX , 'CLim',[0 bss_max_]);
        
        if isempty(d.z) == 0
            label = files(lcY, lcX).label;
            
            dBss = d.bss;
            medianTitle = strcat('Median = ', num2str(round(d.bss_median * 100)), '%');
            meanTitle = strcat('Mean = ', num2str(round(mean(dBss) * 100)), '%');
            minTitle = strcat('Min = ', num2str(round(min(dBss) * 100)), '%');
            maxTitle = strcat('Max = ', num2str(round(max(dBss) * 100)), '%');
            title(strcat(...
                  '(', label, ')'...
                , medianTitle, '; '...
                , meanTitle, '; '...
                , minTitle, '; '...
                , maxTitle, '; '...
                ));
            
            cscan_figure(subplot1, d.x,d.y,d.z);
        end
        
        colorbar('Limits',[0 bss_max_]);
        
        pbaspect([size_x size_y 1]);
    end
end

f = figure;
p = uipanel(f);
cMin = uicontrol(p,'Style','slider');
cMin.Value = 0;
cMin.Max = bss_max_ - bss_max_/100;
cMin.Callback = @HandleMin;

    function HandleMin(src, event)
        bss_min__ = src.Value;
        bss_max__ = cMax.Value;
        set(0, 'CurrentFigure', res);
        for lcX  = 1:sX
            for lcY = 1:sY
                subplot(sY + 1, sX, lcY * sX + lcX , 'CLim',[bss_min__ bss_max__]);
                colorbar('Limits',[bss_min__ bss_max__]);
            end
        end
        cMax.Min = bss_min__ + (bss_max__ - bss_min__)/100;
    end

cMax = uicontrol(p,'Style','slider');
cMax.Value = bss_max_;
cMax.Max = bss_max_;
cMax.Min = bss_max_/100;
cMax.Callback = @HandleMax;

    function HandleMax(src, event)
        bss_min__ = cMin.Value;
        bss_max__ = src.Value;
        set(0, 'CurrentFigure', res);
        for lcX  = 1:sX
            for lcY = 1:sY
                subplot(sY + 1, sX, lcY * sX + lcX , 'CLim',[bss_min__ bss_max__]);
                colorbar('Limits',[bss_min__ bss_max__]);
            end
        end
        cMin.Max = bss_max__ - (bss_max__ - bss_min__)/100;
    end


end

