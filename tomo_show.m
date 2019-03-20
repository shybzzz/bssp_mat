function tomo_show(zdata1)
%CREATEFIGURE(ZDATA1)
%  ZDATA1:  contour z

%  Auto-generated by MATLAB on 18-Aug-2016 06:58:31

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create contour
contourf(zdata1,'LineStyle','none','LevelStep',(max(max(zdata1))-min(min(zdata1)))/100);

box(axes1,'on');
axis(axes1,'tight');
% Set the remaining axes properties
set(axes1,'BoxStyle','full', 'FontSize',24,'FontWeight',...
    'bold','Layer','top');
% Create colorbar
colorbar('peer',axes1);
axis equal;

