function [  ] = demo_tomo( tomo )
%DEMO_TOMO Summary of this function goes here
%   Detailed explanation goes here

s = size(tomo);
axes = demo_create_tomo();
for lc_z=1:s(3)
    demo_add_tomo(tomo(:, :, lc_z)', lc_z, axes);
end

