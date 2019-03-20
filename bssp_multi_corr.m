function [ c_index, c_level , correlation ,er_out] = bssp_multi_corr( ascan, pulse, index , er)
%BSSP_MULTI_CORR Summary of this function goes here
%   Detailed explanation goes here

c_index0 = bssp_corr( ascan, pulse, index );
cur_er = 2*er;
er_out = [];
while(cur_er>er)
[ c_index, c_level , correlation] = bssp_corr( ascan, pulse, c_index0 );
cur_er = abs(c_index-c_index0);
er_out = [er_out, cur_er];
c_index0 = bssp_corr( ascan, pulse, c_index );
end;

end

