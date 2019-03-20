function [  ] = demo_add_tomo( zdata1, z_level, axes )
%DEMO_ADD_TOMO Summary of this function goes here
%   Detailed explanation goes here

% Create surf
zdata = squeeze(zdata1);
s = size(zdata);
%[x,y] = meshgrid(1:s(1), 1:s(2));
z(1:s(1), 1:s(2)) = z_level;
%surf(z, zdata,'Parent',axes,'LineStyle',':', 'EdgeColor',[0.678431391716003 0.921568632125854 1]);
surf(z, zdata,'Parent',axes,'LineStyle','none');

end

