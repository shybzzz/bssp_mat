function [ data, bss, bss_min, bss_max, bss_median, files ] = panoram_path( specimens, size_x, size_y, per_specimen, root, fileName )
%PANORAM_PATH Summary of this function goes here
%   Detailed explanation goes here

files = specimens_path(specimens, root, fileName);
[data, bss, bss_median, bss_size, bss_mean, bss_min, bss_max] = panoram_read(files, per_specimen);

dataS = size(data);
sX = dataS(2);
sY = dataS(1);

bss_max_ = max(bss_max);

res = figure;
bss_hist(res, bss, sX, sY, bss_max_, bss_median, bss_mean, bss_min, bss_max, bss_size);



for lcX  = 1:sX
    for lcY = 1:sY
        d = data(lcY, lcX);
        
        if isempty(d.z) == 0
            subplot1 = subplot(sY + 1, sX, lcY * sX + lcX , 'CLim',[0 bss_max_]);

            label = files(lcY, lcX).label;
            
            dBss = d.bss;
            medianTitle = strcat('Median = ', num2str(round(d.bss_median * 100)), '%');
            meanTitle = strcat('Mean = ', num2str(round(mean(dBss) * 100)), '%');
            minTitle = strcat('Min = ', num2str(round(min(dBss) * 100)), '%');
            maxTitle = strcat('Max = ', num2str(round(max(dBss) * 100)), '%');
            title({strcat(...
                  '(', label, ')')...
                , strcat(...
                medianTitle, '; '...
                , meanTitle, '; ')...
                , strcat(...
                minTitle, '; '...
                , maxTitle, '; '...
                )});
            
            cscan_figure(subplot1, d.x,d.y,d.z);
            colorbar('Limits',[0 bss_max_]);        
            pbaspect([size_x size_y 1]);
        end                
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

