function [ steps , n] = bssp_hist_config( d, b, e )
%BSSP_HIST_CONFIG returns number of bars to fulfill good statistic
%practices
%   d - values; b, e - begin and end of the range

s = size(d);
n = round(5*log10(s(1)));
st = (e-b)/n;
steps = b:st:e;
end

