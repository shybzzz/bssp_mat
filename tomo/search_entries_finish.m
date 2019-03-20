function [ entries ] = search_entries_finish( ascan, eval_entries )
%SEARCH_ENTRIES_FINISH Summary of this function goes here
%   Detailed explanation goes here

s = size(eval_entries);
entries = [];
for lc=1:s(2)
    entry_index = search_entries(ascan, ascan(467-12:467+11), 467, eval_entries(lc));
    entries(lc, :) = [entry_index ascan(entry_index)];
end;

end

