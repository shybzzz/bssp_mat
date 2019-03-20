function [ p ] = bssp_power( ascans )
%BSSP_POWER Summary of this function goes here
%   Detailed explanation goes here

p = [];
s = bssp_size(ascans);
for lc=1:s
    p(lc, :) = ascans(lc, :).^2;
end;

end

