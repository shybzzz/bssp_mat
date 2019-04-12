function [Z, H] = bscan( f, ascans, p , h_eval, step, begin)
%BSCAN Summary of this function goes here
%   Detailed explanation goes here

s = size(ascans);
[Z, H] = extract_from_ascans( ascans, p , h_eval );

ss = (s(1) - 1)*step;
x = begin + (0:step:ss);
y = H;
[x_ ,y_] = meshgrid(x, y);
bscanfigure(f, x_, y_, Z', p, [min(min(Z)), max(max(Z))]);
pbaspect([ss, h_eval, 1]);

%title(str_v_u('step_l= ', step, 'mm'));

end

