function [] = bscan( ascans, p , h_eval, step, begin)
%BSCAN Summary of this function goes here
%   Detailed explanation goes here

s = size(ascans);
[Z, H] = extract_from_ascans( ascans, p , h_eval );

x = begin + (0:step:(s(1) - 1)*step);
y = H;
[x ,y] = meshgrid(x, y);
bscanfigure(x, y, Z', p);

%title(str_v_u('step_l= ', step, 'mm'));

end

