function [ f, l ] = smirnov( data )
%SMIRNOV Summary of this function goes here
%   Detailed explanation goes here

s = sort(data);
s_=size(s);
m = mean(s);
d = std(s);

f = (m-s(1))/d;
l = (s(s_(2))-m)/d;

end

