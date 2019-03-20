function [ surf_ind, surf_values ] = bssp_get_surface_signal( ascan, surf_points, pulse_length, start_with )
%BSSP_REMOVE_SURFACE Summary of this function goes here
%   Detailed explanation goes here


surf_ind = [];
hh = pulse_length / 2;

s = size(surf_points);
for lc_surf = start_with:s(2)
    ss = surf_points(lc_surf);
    surf_ind = [surf_ind ss-hh+1:ss+hh];
end

surf_values = ascan(surf_ind);

end

