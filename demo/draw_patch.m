function [  ] = draw_patch( x, y, z, c )
%DRAW_PATCH Summary of this function goes here
%   Detailed explanation goes here

    h=patch(x,y,z, 'k');
    set(h,'EdgeColor','w');
    set(h,'FaceColor',c(1:3));
    set(h,'FaceAlpha',c(4));
end

