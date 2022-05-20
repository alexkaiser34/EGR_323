%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab2_part2
% Names: Alex Kaiser, Ryan Lenoir, Zach V
% Class: EGR 323
% Description: This part involved using 4 different types of filters,
% butterwroth, chebyshev types 1 and 2, and elliptical, to construct
% data for bandpass filters.  The magnitude of the transfer function
% for each filter was plotted in V/V and dB.  The phase angle was also
% plotted in degress for each filter.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Frequency variables
w1 = 2*pi*12500;
w2 = 2*pi*15500;

wn = [ w1 w2 ];
w = 0*pi*10000:2*pi*100:2*pi*30000;

%%%%%%%%%%%%%%%%%%%%%% Butterworth %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[b1, a1] = butter(2,wn,'bandpass', 's');
tf(b1,a1);

butter_func = (3.553e08 * (i*w).^2) ./ ((i*w).^4 + (2.666e04 * (i*w).^3) ...
    + (1.565e10 * (i*w).^2) + (2.039e14*(i*w)) + 5.851e19);
db_butter = 20*log(abs(butter_func));

figure(1);
subplot(2,1,1);
semilogx(w,butter_func);
title("Magnitude of Butterworth Filter (V/V)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (V/V)");
subplot(2,1,2);
semilogx(w,db_butter);
title("Magnitude of Butterworth Filter (dB)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (dB)");

%%%%%%%%%%%%%%%%%%%%% Cheby1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ b2, a2 ] = cheby1(2, 2, wn, "bandpass", "s");
tf(b2,a2);

cheby1_func = (2.323e08 * (i*w).^2) ./ (((i*w).^4) + (1.515e04 * (i*w).^3) ...
    + (1.559e10 * (i*w).^2) + (1.159e14 * (i*w)) + 5.851e19);
db_cheby1 = 20*log(abs(cheby1_func));

figure(2);
subplot(2,1,1);
plot(w,cheby1_func);
title("Magnitude of Chebyshev Type 1 Filter (V/V)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (V/V)");
subplot(2,1,2);
semilogx(w,db_cheby1);
title("Magnitude of Chebyshev Type 1 Filter (dB)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (dB)");

%%%%%%%%%%%%%%%%%%%%% Cheby2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ b3, a3 ] = cheby2(2, 30, wn, "bandpass", "s");
tf(b3,a3);

cheby2_func_n = (0.03162*(i*w).^4) - (4.067e-13*(i*w).^3) ...
    + (5.062e08*(i*w).^2) - (0.0003111*(i*w)) + 1.85e18;
cheby2_func_d = (i*w).^4 + (6597*(i*w).^3) + (1.532e10*(i*w).^2) ...
    + (5.046e13*(i*w)) + 5.851e19;
cheby2_func = cheby2_func_n ./ cheby2_func_d;
db_cheby2 = 20*log(abs(cheby2_func));

figure(3);
subplot(2,1,1);
semilogx(w,cheby2_func);
title("Magnitude of Chebyshev Type 2 Filter (V/V)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (V/V)");
subplot(2,1,2);
semilogx(w,db_cheby2);
title("Magnitude of Chebyshev Type 2 Filter (dB)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (dB)");

%%%%%%%%%%%%%%%%%%%%% ellip %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ b4, a4 ] = ellip(2, 2, 30, wn, "bandpass", "s");
tf(b4,a4);

ellip_func_n = (0.03162*(i*w).^4) + (7.216e08*(i*w).^2) + 1.85e18;
ellip_func_d = (i*w).^4 + (1.484e04*(i*w).^3) + (1.56e10*(i*w).^2)...
    + (1.135e14*(i*w)) + 5.851e19;
ellip_func = ellip_func_n ./ ellip_func_d;
db_ellip = 20*log(abs(ellip_func));

figure(4);
subplot(2,1,1);
semilogx(w,ellip_func);
title("Magnitude of Elliptical Filter (V/V)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (V/V)");
subplot(2,1,2);
semilogx(w,db_ellip);
title("Magnitude of Elliptical Filter (dB)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (dB)");

%%%%%%%%%%%%%%%%%% Magnitude and Phase of Frequency Response %%%%%%%%

H1 = freqs(b1,a1,w);    % butterworth
H2 = freqs(b2,a2,w);    % cheby1
H3 = freqs(b3,a3,w);    % cheby2
H4 = freqs(b4,a4,w);    % ellip

angle1 = angle(H1) * 180/pi;
angle2 = angle(H2) * 180/pi;
angle3 = angle(H3) * 180/pi;
angle4 = angle(H4) * 180/pi;

figure(5);
semilogx(w,H1);
hold on
semilogx(w,H2);
hold on
semilogx(w,H3);
hold on
semilogx(w,H4);
hold off
title("Magnitude of Different Filters (V/V)");
xlabel("Frequency (rad/s)");
ylabel("Magnitude (V/V)");
legend("Butterworth", "Chebyshev Type 1", "Chebyshev Type 2",...
    "Elliptical");

figure(6);
semilogx(w, angle1);
hold on
semilogx(w, angle2);
hold on
semilogx(w, angle3);
hold on
semilogx(w, angle4);
title("Phase Angle of Different Filters");
xlabel("Frequency (rad/s)");
ylabel("Phase Angle (degrees)");
legend("Butterworth", "Chebyshev Type 1", "Chebyshev Type 2",...
    "Elliptical");
