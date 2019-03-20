function [ x, y, z ] = cscan( v, size_x, size_y, step_x, step_y )
%CSCAN Summary of this function goes here
%   Detailed explanation goes here

[x, y, z] = cscan_mesh(v, size_x, size_y, step_x, step_y);
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'BoxStyle','full','Layer','top',...
    'FontWeight','bold',...
    'FontSize',24);
cscan_figure(axes1, x,y,z);
pbaspect([size_x size_y 1]);

end

