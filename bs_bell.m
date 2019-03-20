function [ pulse ] = bs_bell( p_length, w_device, w_transducer )
%BS_SIN Summary of this function goes here
%   Detailed explanation goes here

pulse = exp(-9*((1:p_length)-p_length/2).^2/(p_length^2)).*bs_sin(p_length, w_device, w_transducer);

end

