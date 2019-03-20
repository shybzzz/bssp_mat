function [ surf ] = search_entries( ascan, pulse, b, e )
%SEARCH_ENTRIES Summary of this function goes here
%   Detailed explanation goes here

isurf = bssp_detect_surface(ascan, pulse, b, e);
s_isurf = size(isurf);
max_ = max(ascan);
min_ = min(ascan);
x_ = [];
y_ = [];
for lc=1:s_isurf(2)
    x_ = [x_ isurf(lc) isurf(lc)];
    y_ = [y_ min_ max_];
end;


plot(x_, y_,'LineWidth',3,'LineStyle',':');

surf = isurf(1);

end

