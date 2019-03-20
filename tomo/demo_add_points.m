function [  ] = demo_add_points( points )
%DEMO_ADD_POINTS Summary of this function goes here
%   Detailed explanation goes here

s = size(points);
x_unknown(1:s(1)) = nan; y_unknown(1:s(1)) = nan;
x_good(1:s(1)) = nan; y_good(1:s(1)) = nan;
x_bad(1:s(1)) = nan; y_bad(1:s(1)) = nan;
for lc_p = 1:s(1)
    point = points(lc_p);
    x = point.x;
    y = point.y;
    if (isnan(point.s))
        x_unknown(lc_p) = x;
        y_unknown(lc_p) = y;
    else
        size_p = size(point.s);
        if (size_p(1)==0)
            x_bad(lc_p) = x;
            y_bad(lc_p) = y;
        else
            x_good(lc_p) = x;
            y_good(lc_p) = y;
        end;
    end;
    
end;

%figure; hold on;
plot(x_unknown, y_unknown, 'MarkerSize',10,'Marker','o','LineWidth',2,'LineStyle','none', 'Color',[0 0.447058826684952 0.74117648601532]);
plot(x_good, y_good, 'MarkerFaceColor',[0 0.447058826684952 0.74117648601532],...
    'MarkerSize',10,...
    'Marker','o',...
    'LineWidth',2,...
    'LineStyle','none', 'Color',[0 0.447058826684952 0.74117648601532]);
plot(x_bad, y_bad, 'MarkerSize',10,'Marker','x','LineWidth',3,'LineStyle','none',...
    'Color',[0.850980401039124 0.325490206480026 0.0980392172932625]);
end

