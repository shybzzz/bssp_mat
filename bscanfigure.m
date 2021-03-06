function bscanfigure(figure1, xdata1, ydata1, zdata1, p, lims)
%CREATEFIGURE(XDATA1, YDATA1, ZDATA1)
%  XDATA1:  contour x
%  YDATA1:  contour y
%  ZDATA1:  contour z

%  Auto-generated by MATLAB on 16-Mar-2016 09:00:29



% Create contour
contourf(xdata1,ydata1,zdata1,'LineStyle','none','LevelStep',0.001);
axis ij;
% Create ylabel
ylabel('h, mm');

% Create xlabel
xlabel('l, mm');
