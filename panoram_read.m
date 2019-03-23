function [data, bss, bss_median, bss_size, bss_mean, bss_min, bss_max, sX, sY] = panoram_read(files, per_specimen)
%UNTITLED Summary of this function goes here
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


end

