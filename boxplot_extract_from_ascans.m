function [ d ] = boxplot_extract_from_ascans( ascans, p , h_eval, step, plot_style )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

s = size(ascans);
Z = extract_from_ascans( ascans, p , h_eval );

%TODO - move to separate function;
d = [];
for lc=1:step:s(1)
    dd=[];
    bb=lc;
    ee=lc+step-1;
    zz=Z(bb:ee, :);
    for lcc=1:step
        dd=[dd zz(lcc, :)];
    end;
    d=[d; dd];
end;

figure1 = figure;
%axes1 = axes('Parent',figure1,'BoxStyle','full','Layer','top',...
%    'FontWeight','bold',...
%    'FontSize',24);

% box(axes1,'on');
% hold(axes1,'on');
%%
% Create ylabel
% ylabel('S^p^r, ум. од.');
% Create xlabel
% xlabel('номер зони');
boxplot(d', 'jitter', 0.1, 'symbol', '.', 'plotstyle', plot_style);
%% Uncomment the following line to preserve the Y-limits of the axes
%  ylim(axes1,[-0.0044259680723328 0.05]);
end


