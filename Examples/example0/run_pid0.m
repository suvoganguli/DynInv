clear

% high frequency low dampled pole
% use PI control

w = 10;
w1 = 1;
z = 0.1;

s = tf('s');

olp = w1*w^2/( (s^2 + 2*z*w*s + w^2) * (s+w1) );

Kp = 0.25;
Ki = 0.5;
Kpi = Kp + Ki/s;
Ksys = Kpi;

loop = Ksys * olp;

om = 1e-2:0.01:1e2;
t = 0:0.01:30;


figure(1); clf
bode(olp,om)
hold on
bode(Ksys,om);
legend('olp','Ksys')
grid on

figure(2); clf
margin(loop);
xlim([1e-2 1e2])
grid on

clp = loop/(1+loop);

figure(3); clf
bode(clp,om)
legend('clp');
grid on;


figure(4);
step(olp,clp,t)
grid on
legend('olp','clp');

figure(5)
step(Ksys/(1+loop),t)
legend('u')
grid on;

