function [ mm ] = bssp_entries_to_mm( entries, w_device , c)
%BSSP_MM_TO_ENTRIES Summary of this function goes here
%   Detailed explanation goes here

mm = 0.5*c*bssp_entries_2_mks( entries,  w_device);

end

