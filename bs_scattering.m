function [ sc_d, s_p_power, s ] = bs_scattering( sc, p, signal_length, w_device, c, window )
%BS_SCATTERING Summary of this function goes here
%   Detailed explanation goes here

s = bs_signal(sc, p, signal_length, w_device, c, 1);
s_p_power = bssp_demodulate(bssp_power(s), window);
sc_d=sum(s_p_power)/(signal_length-window/2);
end

