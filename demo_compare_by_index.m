function [ output_args ] = demo_compare_by_index( aScans, indices, h )
%DEMO_COMPARE_BY_INDEX Summary of this function goes here
%   Detailed explanation goes here

v = [];
s = size(indices);
for lc=1:s(2)
    v = [v; aScans(indices(lc), :)];
end;

demo_compare(v, h);

end

