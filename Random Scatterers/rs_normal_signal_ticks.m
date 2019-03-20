function [ ticks ] = rs_normal_signal_ticks( input_ticks, n, w, h, a )
%RS_NORMAL_SIGNAL Summary of this function goes here
%   Detailed explanation goes here

ticks = input_ticks;
for lc=1:n
    ticks = [ticks; h + w*randn()/2 a/n];
end;

end

