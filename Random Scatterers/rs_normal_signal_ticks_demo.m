ticks = [];
ticks = rs_normal_signal_ticks(ticks, 100, .5, 7, 1);
ticks = rs_normal_signal_ticks(ticks, 100, .5, 9, 1);
dfittool(ticks(:, 1));