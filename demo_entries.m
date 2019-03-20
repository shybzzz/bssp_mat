function [ measured_h, z, isurf, bsurf, fit_at ] = demo_entries( ascan, h )
%DEMO_DETECT Summary of this function goes here
%   Detailed explanation goes here
figure1 = figure;
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontWeight','bold', 'FontSize',24);
[ measured_h, z, isurf, bsurf, fit_at ] = demo_detect(axes1, '', ascan, h);


end

