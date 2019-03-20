function [ d ] = bssp_demodulate( ascans, w )
%BSSP_DEMODULATE Summary of this function goes here
%   Detailed explanation goes here

d = [];
[~, s] = bssp_size(ascans);
h=round(w/2);
for lcs=1:s(1)
    for lc=h:s(2)-h
        d(lcs, lc) = sum(ascans(lcs, lc-h+1:lc+h))/w;
    end;
end;
end

