function [ points ] = mock_points( step_x, step_y, s_x, s_y )
%MOCK_POINTS Summary of this function goes here
%   Detailed explanation goes here

points = [];
for lcy=0:step_y:(s_y - 1) * step_y
    for lcx=0:step_x:(s_x - 1) * step_x
        point = struct;
        point.x = lcx;
        point.y = lcy;
        point.s = nan;
        points = [points; point];
    end
end
