function [ x , y, z ] = cscan_mesh( v, size_x, size_y, step_x, step_y )
%CSCAN_MESH Summary of this function goes here
%   Detailed explanation goes here

x=(0:size_x-1)*step_x;
y=(0:size_y-1)*step_y;

[x,y] = meshgrid(x,y);

z=[];
for lc=1:size_y
    z=[z; v((lc-1)*size_x+1:lc*size_x)];
end;



end

