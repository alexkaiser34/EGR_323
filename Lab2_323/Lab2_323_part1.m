%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab2_part1
% Names: Alex Kaiser, Ryan Lenoir, Zach V
% Class: EGR 323
% Description: This part involved plotting cosine waves
% at different frequencies, in both discrete and continuous time.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% plot cosine of 3 different time vectors %%%%%%%%

fig1 = figure(1);
f = 0.1;

t1 = 0:0.1:20;                  % creating x axis time vector
y1 = cos(2 * pi * f * t1);

t2 = 0:1:20;                    % creating x axis time vector
y2 = cos(2 * pi * f * t2);

t3 = 0:4:20;                    % creating x axis time vector
y3 = cos(2 * pi * f * t3);

subplot(3, 1, 1);
plot(t1, y1);                   % plotting cos 1 function

subplot(3, 1, 2);
plot(t2, y2);                   % plotting cos 2 function

subplot(3, 1, 3);
plot(t3, y3);                   % plotting cos 3 function

plt_t = axes(fig1, 'visible', 'off');
plt_t.Title.Visible = 'on';
plt_t.XLabel.Visible = 'on';
plt_t.YLabel.Visible = 'on';
ylabel(plt_t, 'Amplitude (V)');
xlabel(plt_t, 'Time (s)');
title(plt_t, 'Cosine waves at different sampling rates');

%%%%%%%%%%%%%%% use stem to graph cosine of 3 different time vectors %%%%
fig2 = figure(2);

subplot(3, 1, 1);
stem(t1, y1);

subplot(3, 1, 2);
stem(t2, y2);

subplot(3, 1, 3);
stem(t3, y3);

plt_t = axes(fig2, 'visible', 'off');
plt_t.Title.Visible = 'on';
plt_t.XLabel.Visible = 'on';
plt_t.YLabel.Visible = 'on';
ylabel(plt_t, 'Amplitude (V)');
xlabel(plt_t, 'Time (s)');
title(plt_t, 'Cosine waves at different sampling rates using stem');

%%%%%%%%%%%%%%% comparing DT to CT of different freqs %%%%%%%%
figure(3);
dt = 0:4:20;
ct = 0:0.1:20;
f = 0.1;                    %.1 Hz frequency for “DT” signal
f2 = [0.1 0.05 0.01 0.15];      % frequency for CT signal

g1 = cos(2 * pi * f * dt);          % DT signal
g2 = cos(2 * pi * f2(1) * ct);      % CT signal, 0.1

stem(dt, g1);
hold on
plot(ct, g2);
hold off
title("Cosine wave at DT = 0.1 Hz, CT = 0.1 Hz");
xlabel("Time (s)");
ylabel("Amplitude (V)");
legend("Discrete", "Continuous");

figure(4);

g1 = cos(2 * pi * f * dt);          % DT signal
g2 = cos(2 * pi * f2(2) * ct);      % CT signal, 0.05
stem(dt, g1);
hold on
plot(ct, g2);
hold off
title("Cosine wave at DT = 0.1 Hz, CT = 0.05 Hz");
xlabel("Time (s)");
ylabel("Amplitude (V)");
legend("Discrete", "Continuous");

figure(5);

g1 = cos(2 * pi * f * dt);          % DT signal 
g2 = cos(2 * pi * f2(3) * ct);      % CT signal, 0.01
stem(dt, g1);
hold on
plot(ct, g2);
hold off
title("Cosine wave at DT = 0.1 Hz, CT = 0.01 Hz");
xlabel("Time (s)");
ylabel("Amplitude (V)");
legend("Discrete", "Continuous");

figure(6);

g1 = cos(2 * pi * f * dt);      % DT signal
g2 = cos(2 * pi * f2(4) * ct);  % CT signal, 0.15
stem(dt, g1);
hold on
plot(ct, g2);
title("Cosine wave at DT = 0.1 Hz, CT = 0.15 Hz");
xlabel("Time (s)");
ylabel("Amplitude (V)");
legend("Discrete", "Continuous");
