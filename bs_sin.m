function [ pulse ] = bs_sin( p_length, w_device, w_transducer )
%BS_SIN Summary of this function goes here
%   Detailed explanation goes here

pulse = sin(bssp_entries_2_mks( (1:p_length),  w_device)*w_transducer*(2*pi));

end

