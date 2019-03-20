function [ measured_h, z, isurf, bsurf, fit_at, bss ] = demo_detect(axes1, t, ascan, h, z0)
%DEMO_DETECT Summary of this function goes here
%   Detailed explanation goes here

[measured_h, z, isurf, interf, bsurf ] = bssp_bottom( ascan, h, z0 );
s_ = size(isurf);
isurf_length = s_(2);
s_ = size(z);
z_length = s_(2);
s_ = size(bsurf);
bsurf_length = s_(2);

y_lim = [0 4e-2];
ylim(axes1,y_lim);
xlim(axes1,[-2 h + 5]);
xlabel('h (mm)');
ylabel('E* (arb. units)');
box(axes1,'on');
hold(axes1,'on');

hold on;

for lc=1:isurf_length
    s = bssp_entries_to_mm(isurf(lc)-interf, 68, 5.92);
    isurf_h = plot([s,s], y_lim, 'LineWidth',3,'Color',[0 0 1], 'LineStyle',':');
end;

fh = []; fa = [];
for lc=1:bsurf_length
    b_surf_i = bsurf(lc);
    s = bssp_entries_to_mm(b_surf_i-interf, 68, 5.92);
    fh = [fh; s];
    fa = [fa; z(b_surf_i)];
    bsurf_h = plot([s,s], y_lim, 'LineWidth',3,'Color',[0 0.5 0], 'LineStyle',':');
    
end;

%fit_at = fit(fh,fa,'exp1');
fit_at = NaN;
%zf_h = plot(fit_at);
%set(zf_h, 'LineWidth',3);
timeline = bssp_entries_to_mm((1:z_length)-interf, 68, 5.92);
z_h = plot(timeline, z, 'LineWidth',2,'Color',[0 0 0]);

bss_margin = 40;
bss = sum(z((isurf(1)+bss_margin):(bsurf(1)-bss_margin)));

%legend([z_h, isurf_h, bsurf_h, zf_h], {'Demodulated Signal', 'Outer Surface', 'Inner Surface', 'Attenuation'})
% legend([z_h, isurf_h, bsurf_h], {'Demodulated Signal', 'Outer Surface', 'Inner Surface'})
f_alias = strcat('(', t, ') ');
h_alias = str_v_u('H = ', round(measured_h,2), 'mm');
bss_alias = str_v_u('BSS = ', round(bss*100), '%');

title({f_alias, h_alias, bss_alias});
grid on;


end

