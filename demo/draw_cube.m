function [ ] = draw_cube( origin, size, c )
%DRAW_CUBE Summary of this function goes here
%   Detailed explanation goes here

x=([0 1 1 0 0 0;1 1 0 0 1 1;1 1 0 0 1 1;0 1 1 0 0 0])*size(1)+origin(1);
y=([0 0 1 1 0 0;0 1 1 0 0 0;0 1 1 0 1 1;0 0 1 1 1 1])*size(2)+origin(2);
z=([0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1])*size(3)+origin(3);

for i=1:6
    draw_patch(x(:,i),y(:,i),z(:,i), c);
end

end

