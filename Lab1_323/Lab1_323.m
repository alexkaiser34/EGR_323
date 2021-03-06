%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab 1
% Filename: EGR323_Lab1.m
% Author: Zachary Van Dyke
% Course: EGR 323
% Date: 5/12/2022
% Assignment: Lab #1: MATLAB (Introduction/Review)
% Instructor: Dr. Krug
% Description: To introduce students to MATLAB and some of its operations.
% Revision: 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng('shuffle');

%-------------------------Part I-------------------------
%variables
t1 = -2:.01:2;
u1 = zeros(1,length(t1));
u3 = zeros(1,length(t1));

%generating u(t)
u1(t1 >= 0) = 1;
u2 = u1.*t1;
u3(t1 >= -0.75 & t1 <= 0.75) = 1;

%plot graphs
figure
 plot(t1,u1,t1,u2,t1,u3);
 xlim([-2 2]);
 ylim([-1 2]);
 legend("u(t)","u(t)*t","u(t+0.75)-u(t-0.75)",'location','best');
 grid;
 xlabel('Time');
 ylabel('Data');
 title('Plots Utilizing u(t)');

%-------------------------Part II-------------------------
%variables
t2 = -1:0.01:1;
pulse = tcospuls(t2);

%plot graphs
figure
 plot(t2,pulse);
 xlim([-1 1]);
 ylim([-0.5 1.5]);
 grid;
 xlabel('Time');
 ylabel('Data');
 title('TriCos Function');

%-------------------------Part III-------------------------
%variables
t3 = -10:0.01:10;
t4 = -10:0.01:10;
t5 = -10:0.01:10;
t6 = -10:0.01:10;
pulse1 = tcospuls(t3);
pulse2 = tcospuls((t4-6)/4) - tcospuls((-t4-2)/4);
pulse3 = (1/5).*tcospuls(2.*t5+4)+tcospuls(2.*t5-4);
pulse4 = tcospuls((t6+1)/4).*tcospuls((t6-1)/4);

%plot graphs
figure
 subplot(4,1,1);
 plot(t3,pulse1);
 xlim([-10 10]);
 ylim([-1.5 1.5]);
 grid;
 xlabel('Time');
 ylabel('Data');
 title('TriCos Function');

 subplot(4,1,2);
 plot(t4,pulse2);
 xlim([-10 10]);
 ylim([-1.5 1.5]);
 grid;
 xlabel('Time');
 ylabel('Data');
 title('TriCos Function');
 subplot(4,1,3);
 plot(t5,pulse3); 
 xlim([-10 10]);
 ylim([-1.5 1.5]);
 grid;
 xlabel('Time');
 ylabel('Data');
 title('TriCos Function');
 subplot(4,1,4);
 plot(t6,pulse4);
 xlim([-10 10]);
 ylim([-1.5 1.5]);
 grid;
 xlabel('Time');
 ylabel('Data');
 title('TriCos Function');
