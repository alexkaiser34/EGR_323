figure(1);
f = 0.1;

t1 = 0:0.1:20;
y1 = cos(2*pi*f*t1);

t2= 0:1:20;
y2 = cos(2*pi*f*t2);

t3 = 0:4:20;
y3 = cos(2*pi*f*t3);

subplot(3,1,1);
plot(t1,y1);

subplot(3,1,2);
plot(t2,y2);

subplot(3,1,3);
plot(t3,y3);

figure(2);
subplot(3,1,1);
stem(t1,y1);

subplot(3,1,2);
stem(t2,y2);

subplot(3,1,3);
stem(t3,y3);