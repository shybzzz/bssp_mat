function [ s ] = bssp_detect_surface( ascan, pulse, b, e )
%BSSP_DETECT_SURFACE Summary of this function goes here
%   Detailed explanation goes here

s=[];
h=e-b;
s_=size(ascan);
ascan_length = s_(2);
ss = size(pulse);

i=e;
ended = false;
while (i<ascan_length)&&(~ended)
    bb = bssp_multi_corr(ascan, pulse, i, 1);
    s = [s bb];
    i = i+h;
    ended = bb+ss(1)>=ascan_length;
end
end

