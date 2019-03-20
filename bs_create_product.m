function [ sc ] = bs_create_product( a, n_random, h )
%BS_SIM Summary of this function goes here
%   Detailed explanation goes here


sc = [];

size_a = size(a);
size_a = size_a(1);

for lc_a=1:size_a
    for lc_sc=0:a(lc_a, 1)
        sc = [sc  a(lc_a, 2)+a(lc_a, 3)*randn()];
    end;
end;

for lc_r=1:n_random
    sc = [sc h*rand()];
end;

end





