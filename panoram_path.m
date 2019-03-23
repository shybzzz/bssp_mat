function [ data, bss, bss_min, bss_max, bss_median ] = panoram_path( files, size_x, size_y, per_specimen )
%PANORAM_PATH Summary of this function goes here
%   Detailed explanation goes here


[data, bss, bss_median, bss_size, bss_mean, bss_min, bss_max, sX, sY] = panoram_read(files, per_specimen);

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
cMin.Position = [44.8,345.6,411.2,20];
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
cMax.Position = [44.80000000000001,283.2,412.8000000000001,20];
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

