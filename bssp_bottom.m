function [measured_h, z, isurf, interf, bsurf ] = bssp_bottom( ascan, h, z0 )
%BSSP_BOTTOM Summary of this function goes here
%   Detailed explanation goes here

pulse_length = 50;
z=bssp_process_signals(ascan,512, 512, 21);
isurf = bssp_detect_surface(z, z(1:pulse_length), 1, 450);

interf = isurf(1);



hh = pulse_length / 2;
hh2 = 2*hh -1;
bb = interf - hh;
bsurf = bssp_detect_surface(z, z(bb : bb+hh2), bb, bssp_mm_to_entries(h, 68, 5.92)+interf);
ee = bsurf(1)+hh;
measured_h = bssp_entries_to_mm(ee-interf - hh2, 68, 5.92);

start_with = 2;
i_surf_ind = bssp_get_surface_signal(z, isurf, pulse_length, start_with);


%z(i_surf_ind) = median(z(~ismember(z, z(i_surf_ind))));
z0_ = z0*z(interf)/z0(interf);
z = z - z0_;
z = z / sum(z(bb:ee));
s = size(z);

for lc=1:s(2)
    if(z(lc)<0)
        z(lc) = 0;
    end
end;
%zu = z(bb+hh2:ee-hh2);

end

