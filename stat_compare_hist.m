function [  ] = stat_compare_hist( d, b, e, n )
%STAT_COMPARE_HIST Summary of this function goes here
%   Detailed explanation goes here
s = size(d);
s = s(1);
s = round(s/n);
figure;
for lc=1:n
    subplot(n, 1, lc);
    stat_hist(d((lc-1)*s+1:lc*s), b, e);
end;

end

