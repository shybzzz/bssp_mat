function [ z ] = search_entries_start( ascan )
%SEARCH_ENTRIES_START Summary of this function goes here
%   Detailed explanation goes here

z=bssp_process_signals(ascan,512, 512, 21);
search_entries_start_figure(z); hold on;

search_entries(z, z(12:37), 1, 467);

end

