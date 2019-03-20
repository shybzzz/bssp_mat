function [ db ] = a2db( a )
%A2DB Summary of this function goes here
%   Detailed explanation goes here

db = 10*log10(a/a(1));
end

