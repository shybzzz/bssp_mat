function [ measured_h, zu, isurf, bsurf, fit_at, bss, x, y, z, hix, hiy, bss_median ] = panoram( ascans, h, per_zone, step_x, step_y )
%PANORAM Summary of this function goes here
%   Detailed explanation goes here

zu = load('E:\Drive\Cooperations\BSST\Transducers\1070\z0.mat');
[ measured_h, zu, isurf, bsurf, fit_at, bss ] = demo_compare(ascans, h, per_zone, zu.z0);
s = size(ascans);
[x, y, z] = cscan(bss, per_zone, s(1) / per_zone, step_x, step_y);

[hiy, hix] = hist(bss);
figure; hist(bss);
bss_median = median(bss);
title(strcat('Median = ', num2str(round(bss_median * 100)), '%'))

end

