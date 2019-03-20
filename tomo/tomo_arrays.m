count_y = 40;
tomo = [];
dens = [];
for lc_y=1:count_y
    tomo_name = strcat('tomo_y_', num2str(lc_y));
    if(exist(tomo_name, 'var')==1)
        tomo(:, lc_y, :) = eval(tomo_name)';
        clear(tomo_name);
    end;
    
    dens_name = strcat('dens_y_', num2str(lc_y));
    if(exist(dens_name, 'var')==1)
        dens(:, lc_y, :) = eval(dens_name)';
    end;
    clear(dens_name);
end;

clear lc_y tomo_name dens_name;