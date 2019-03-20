function [ measured_h, z, isurf, bsurf, fit_at, bss ] = demo_compare( ascans, h, per_zone, z0 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

s = size(ascans);
figure;
m = s(1);
n = m / per_zone;
for lc=1:m
    [measured_h(lc,:) , z(lc,:), isurf(lc,:), bsurf(lc,:), fit_at(lc,:), bss(:, lc)] = demo_detect(subplot(n,per_zone,lc), num2str(lc), ascans(lc,:), h, z0);
end;



end

