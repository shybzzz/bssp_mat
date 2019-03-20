function [ axes1 ] = demo_create_tomo(  )
%DEMO_CREATE_TOMO Summary of this function goes here
%   Detailed explanation goes here

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create xlabel
xlabel('x (mm)');

% Create ylabel
ylabel('y (mm)');

% Uncomment the following line to preserve the Z-limits of the axes
% zlim(axes1,[0 7500]);
view(axes1,[-37.5 30]);
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',24,'FontWeight','bold');

end

