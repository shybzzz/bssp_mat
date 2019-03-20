a = [
    %1e4, 25, 1;
    %1000, 40, 3
    ];
n_random = 100;
h=50;
w_device = 68;
w_tranducer = 10; 
pulse_length = 50;

scattering = 1;

c = 5.92;
signal_length = bssp_mm_to_entries(h, w_device, c);
window = 4*round(w_device/w_tranducer);


%dfittool(sc);
%figure; hist(sc);


dev = [];
signals = [];
n_rand=[20*h 2000*h 20000*h];
mks = bssp_entries_2_mks(1:signal_length, w_device);
mm = bssp_entries_to_mm(1:signal_length, w_device, c);
p = bs_bell(pulse_length, w_device, w_tranducer);
for n_r=n_rand;
    
    sc = bs_create_product(a, n_r, h);
    [sc_d, ~, s] = bs_scattering( sc, p, signal_length, w_device, c, window );
    dev = [dev, sc_d];
    signals = [signals; s];
    figure; plot(mm, s);
    %power = bssp_power(s);
    %figure; plot(mm, power);
    
    %hold on; plot(mm(1:signal_length - window/2), bssp_demodulate(power, window));
    
end;

%figure; plot(n_rand/h, dev);




