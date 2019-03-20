function [ c_index, c_level , correlation, er ] = demo_corr( ascan, pulse, index )
%DEMO_CORR Summary of this function goes here
%   Detailed explanation goes here

[c_index, c_level , correlation, er]=bssp_multi_corr(ascan, pulse, index, 1);

figure1 = figure;
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontWeight','bold', 'FontSize',24);
%ylim(axes1,[0 1]);
xlim(axes1,[0 600]);
xlabel('t (arb. units)');
ylabel('E* (arb. units)');
box(axes1,'on');
hold(axes1,'on');

ha = plot(ascan, 'LineWidth',2,'Color',[0 0 0], 'LineStyle',':');
hp = plot(pulse, 'LineWidth',3,'Color',[0 0 1], 'LineStyle',':');
sp = size(pulse);
h = round(sp(2)/2);
t=index-h+1:index+h;
hep = plot(t, ascan(t), 'LineWidth',3,'Color',[1 0 0], 'LineStyle',':');

hi = plot([index, index], [0,1], 'LineWidth',3,'Color',[1 0 0]);
hc = plot([c_index, c_index], [0,1], 'LineWidth',3,'Color',[0 0 1]);

legend([ha,hp, hep, hi, hc], {'A-Scan', 'Pulse', 'Echo-Pulse', 'Evaluated Index', 'Calculated Index'});

demo_bolded(er);

end

