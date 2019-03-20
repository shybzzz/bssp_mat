function [ n ] = bssp_normalize( ascans, zero_level, amp )

n = [];
s = bssp_size(ascans);
for lc=1:s
    n(lc, :) = (ascans(lc, :)-zero_level)/amp;
end;

end

