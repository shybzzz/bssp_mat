function cscan_figure(axes1, xdata1, ydata1, zdata1)
box(axes1,'on');
hold(axes1,'on');

% Create ylabel
ylabel('y, (mm)');

% Create xlabel
xlabel('x, (mm)');

% Create contour
contourf(xdata1,ydata1,zdata1,'LineStyle','none','LevelStep',0.001);

% Create colorbar
colorbar('peer',axes1);

