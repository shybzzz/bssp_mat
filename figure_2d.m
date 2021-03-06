function figure_2d(zdata1, levelStep)
%CREATEFIGURE(ZDATA1)
%  ZDATA1:  contour z

%  Auto-generated by MATLAB on 29-Sep-2016 06:50:42

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'BoxStyle','full','Layer','top',...
    'FontWeight','bold',...
    'FontSize',24);
box(axes1,'on');
hold(axes1,'on');

% Create contour
contourf(zdata1,'LineStyle','none','LevelStep', levelStep);

% Create colorbar
colorbar('peer',axes1);

