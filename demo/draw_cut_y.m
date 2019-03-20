function [  ] = draw_cut_y( x, y, z, c )
%DRAW_CUT_Y Summary of this function goes here
%   Detailed explanation goes here

s = size(y);

for lc=1:s(2)
    y_ = y(lc);
    draw_patch([0 x x 0],[y_ y_ y_ y_],[0 0 z z], c);
end;


end

