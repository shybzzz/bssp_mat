function [ h ] = stat_hist( d , b, e)
%STAT_HIST Summary of this function goes here
%   Detailed explanation goes here

[ ~, steps ] = bssp_hist_config( d, b, e );
h = histfit(d, steps , 'rician');

end

