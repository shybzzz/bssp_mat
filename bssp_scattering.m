function [ sc ] = bssp_scattering( aScans, h )
%BSSP_SCATTERING Summary of this function goes here
%   Detailed explanation goes here

s = size(aScans); s = s(1);
sc=[];

for lc=1:s
    [~, ~, ~, ~, ~, zu ] = bssp_bottom( aScans(lc,:), h );
    sc = [sc sum(zu)];
end;


end

