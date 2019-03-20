function [  ] = draw_cut_x( x, y, z, c )
%DRAW_CUT_X Summary of this function goes here
%   Detailed explanation goes here

s = size(x);

for lc=1:s(2)
    x_ = x(lc);
    draw_patch([x_ x_ x_ x_],[0 y y 0],[0 0 z z], c);
end;


end

