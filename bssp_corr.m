function [ c_index, c_level , correlation] = bssp_corr( ascan, pulse, index )
%BSSP_CORR Summary of this function goes here
%   Detailed explanation goes here

maxc=-1;
s_pulse = size(pulse);
pulse_length = s_pulse(2);
h = round(pulse_length/2);
s=size(ascan);
ascan_length=s(2);
correlation = [];
for lc=index-h+1:index+h
    lcb=lc-h+1;
    lce=lc+h;
    if lcb>0&&lce<ascan_length
        c=sum(ascan(lcb:lce).*pulse);
        correlation = [correlation, c];
        if c>maxc
            
            c_index = lc;
            c_level = ascan(c_index);
            maxc = c;
        end;
    end;
end;
end

