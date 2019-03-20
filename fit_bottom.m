function [ fit_obj, h ] = fit_bottom( aScans,  h_eval, step_x, step_y, s_x, s_y)
%FIT_BOTTOM Summary of this function goes here
%   Detailed explanation goes here

xy=[];
for yy=0:step_x:s_x
    for xx=0:step_y:s_y
        xy = [xy; xx, yy];
    end;
end;

h = [];
s = size(aScans);
for lc=1:s(1)
    [hh] = bssp_bottom(aScans(lc,:), h_eval);
    h = [h; hh];
end;

fit_obj = fit(xy, h, 'lowess');
demo_surface(fit_obj);

end

