function [ entries ] = bssp_mm_to_entries( mm, w_device , c)
%BSSP_MM_TO_ENTRIES Summary of this function goes here
%   Detailed explanation goes here

entries = round(2*w_device*mm/c);

end

