function [ b_raw, b_at, a_raw, a_att ] = demo_contact( aScans , h)
%DEMO_CONTACT Summary of this function goes here
%   Detailed explanation goes here

a_raw = bssp_demodulate(bssp_power(bssp_normalize(aScans, 512, 512)), h);
b_raw=[]; b_at = []; a_att = [];
s=size(aScans);
s = s(1);
for lc=1:s
    aa=a_raw(lc,:);
    [~, aa_at, ~, ~, bb] = bssp_bottom( aScans(lc,:), h );
    b_raw = [b_raw aa(bb(1))];
    a_att = [a_att; aa_at];
    b_at=[b_at aa_at(bb(1))];
end;

b_raw = a2db(b_raw);
b_at = a2db(b_at);

end

