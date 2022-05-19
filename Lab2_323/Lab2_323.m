
w1 = 2*pi*12500;

w2 = 2*pi*15500;

wn = [ w1 w2 ];

[b1, a1] = butter(2,wn,'bandpass', 's');
tf(b1,a1);
w = 2*pi*10000:2*pi*100:2*pi*18000;

butter_func = (3.553e08 * (i*w).^2) ./ ((i*w).^4 + (2.666e04 * (i*w).^3) + (1.565e10 * (i*w).^2) + (2.039e14*(i*w)) + 5.851e19);
db_butter = 20*log(abs(butter_func));

figure(1);
subplot(2,1,1);
plot(w,abs(butter_func));
subplot(2,1,2);
plot(w,db);

[ b2, a2 ] = cheby1(2, 0.5, wn, "bandpass", "s");
tf(b2,a2);

cheby1_func = (5.086e08 * (i*w).^2) ./ (((i*w).^4) + (2.687e04 * (i*w).^3) + (1.584e10 * (i*w).^2) + (2.055e14 * (i*w)) + 5.851e19);
db_cheby1 = 20*log(abs(cheby1_func));

figure(2);
subplot(2,1,1);
plot(w,abs(cheby1_func));
subplot(2,1,2);
plot(w,db_cheby1);

[ b3, a3 ] = cheby2(2, 20, wn, "bandpass", "s");
tf(b3,a3);

cheby2_func_n = (0.1*(i*w).^4) - (2.572e-13*(i*w).^3) + (1.601e09*(i*w).^2) - (0.001968*(i*w)) + 5.851e18;
cheby2_func_d = (i*w).^4 + (1.131e04*(i*w).^3) + (1.537e10*(i*w).^2) + (8.651e13*(i*w)) + 5.851e19;
cheby2_func = cheby2_func_n ./ cheby2_func_d;
db_cheby2 = 20*log(abs(cheby2_func));

figure(3);
subplot(2,1,1);
plot(w,abs(cheby2_func));
subplot(2,1,2);
plot(w,db_cheby2);

[ b4, a4 ] = ellip(2, 0.5, 20, wn, "bandpass", "s");
tf(b4,a4);

ellip_func_n = (0.1*(i*w).^4) + (2.054e09*(i*w).^2) + 5.851e18;
ellip_func_d = (i*w).^4 + (2.531e04*(i*w).^3) + (1.585e10*(i*w).^2) + (1.936e14*(i*w)) + 5.851e19;
ellip_func = ellip_func_n ./ ellip_func_d;
db_ellip = 20*log(abs(ellip_func));

figure(4);
subplot(2,1,1);
plot(w,abs(ellip_func));
subplot(2,1,2);
plot(w,db_ellip);

H1 = freqs(b1,a1,w);
H2 = freqs(b2,a2,w);
H3 = freqs(b3,a3,w);
H4 = freqs(b4,a4,w);

angle1 = angle(H1) * 180/pi;
angle2 = angle(H2) * 180/pi;
angle3 = angle(H3) * 180/pi;
angle4 = angle(H4) * 180/pi;

figure(5);
semilogx(w,abs(H1));
hold on
semilogx(w,abs(H2));
hold on
semilogx(w,abs(H3));
hold on
semilogx(w,abs(H4));
hold off

figure(6);
semilogx(w, angle1);
hold on
semilogx(w, angle2);
hold on
semilogx(w, angle3);
hold on
semilogx(w, angle4);
