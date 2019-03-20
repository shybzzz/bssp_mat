function [ p ] = bssp_process_signals( ascans, zero_level, amp, w )
%BSSP_PROCESS_SIGNALS Summary of this function goes here
%   Detailed explanation goes here

p = bssp_demodulate(bssp_power(bssp_normalize(ascans, zero_level, amp)), w);
end

