function [ fl ] = smirnov_bulk( data, n )
%SMIRNOV_BULK Summary of this function goes here
%   Detailed explanation goes here

fl=[];
s=size(data);
s=s(2);
s=round(s/n);

for(lc=0:s-1)
    d=data(lc*n+1:(lc+1)*n);
    [f, l]= smirnov(d);
    fl=[fl; f l];
end;

end

