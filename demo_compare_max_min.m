function [ max_i, min_i, d ] = demo_compare_max_min( m, h )
%DEMO_COMPARE_MAX_MIN Summary of this function goes here
%   Detailed explanation goes here

d = bssp_scattering( m, h );
[~, max_i] = max(d);
[~, min_i] = min(d);
demo_compare(m([min_i, max_i], :), h);

end

