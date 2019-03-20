function [ Z, H ] = extract_from_ascans( ascans, p , h_eval )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

hp = p.pulse_length/2;
w_device = p.w_device;
c = p.c;

z=bssp_process_signals(ascans,p.zero_level, p.amp, p.w);

bb = p.outer1;
h = bssp_mm_to_entries(h_eval, w_device, c);
ee = bb+h;

H = bssp_entries_to_mm((0:h-2*hp-1)+hp , w_device, c);
Z = z(:, bb+hp:ee-hp-1);

end

