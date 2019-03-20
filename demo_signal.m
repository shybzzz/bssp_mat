function [ fd, h ] = demo_signal( a_scans, zero_h, zero_level, amplification,  w_device, window_size, sound_velocity )
%DEMO_SIGNAL Summary of this function goes here
%   Detailed explanation goes here

fd = bssp_process_signals(a_scans, zero_level, amplification, window_size);
s=size(fd);
h = bssp_entries_to_mm(-zero_h+1:s(2)-zero_h, w_device, sound_velocity);
demo_signal_plot(h, fd');

end

