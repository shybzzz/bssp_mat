function [  ] = draw_cut_z( x, y, z, c )
%DRAW_CUT_Z Summary of this function goes here
%   Detailed explanation goes here

s = size(z);

for lc=1:s(2)
    z_ = z(lc);
    draw_patch([0 x x 0],[0 0 y y],[z_ z_ z_ z_], c);
end;


end

