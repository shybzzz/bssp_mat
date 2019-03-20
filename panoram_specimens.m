function [ bss_all, bss_median_, bss_min, bss_max, bss_median_all, hist_x, hist_y ] = panoram_specimens( dir, specimen_start, specimen_end, per_zone, step_x, step_y, surface )
%PANORAM_SPECIMENS Summary of this function goes here
%   Detailed explanation goes here

bss_all = [];
bss_dim = [];
bss_median_ = [];

specimens_count = specimen_end - specimen_start + 1;
for lc = specimen_start : specimen_end
    f_name = strcat(dir,'\', num2str(lc),'\', num2str(0),'\', surface,'_handled.mat')
    load(f_name);
    bss_all = [bss_all, bss];
    s = size(bss);
    bss_dim = [bss_dim s(2)];
    bss_ = median(bss);
    bss_median_ = [ bss_median_, bss_ ]
end;

bss_median_all = median(bss_all);
bss_min = min(bss_all);
bss_max = max(bss_all);

st = 1;
figure;
for lc = specimen_start : specimen_end
    spec_num = lc - specimen_start + 1;
    axes1 = subplot(specimens_count, 1, spec_num , 'CLim',[bss_min bss_max]);
    title(strcat('(', num2str(lc), ') BSS = ', num2str(round(bss_median_(spec_num) * 100)), '%'));
    s = size(aScans);
    size_x = per_zone;
    size_y = s(1) / per_zone;
    bss_size = bss_dim(spec_num);
    en = st + bss_size;
    bss_ = bss_all(st : en - 1);
    st = en;
    [x,y,z] = cscan_mesh(bss_, size_x, size_y, step_x, step_y);
    cscan_figure(axes1, x,y,z);
    colorbar('Limits',[0.0375 0.2457]);
    pbaspect([size_x size_y 1]);
end;


[hist_x, hist_y] = hist(bss_all);

figure; hist(bss_all);
title(strcat('Median = ',num2str(round(bss_median_all*100)), '%'));


end

