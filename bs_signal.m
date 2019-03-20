function [ signal ] = bs_signal( sc, p , signal_length, w_device, c, sc_power)
%BS_SIGNAL Summary of this function goes here
%   Detailed explanation goes here

size_sc = size(sc);
size_sc = size_sc(2);
p_length = size(p);
p_length = p_length(2);
half = p_length/2;
signal(1:signal_length) = 0;
power=sqrt(sc_power/size_sc);
        
for lc_sc=1:size_sc
    entry = bssp_mm_to_entries(sc(lc_sc), w_device, c);
    b = entry-half+1;
    e= entry+half;
    if(b>0 && e<=signal_length)
        signal(b:e) = signal(b:e)+p*power;
    end;
end;   

end

