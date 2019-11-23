clear

w = 3;
z = 0.1;

A = [0 1; -w^2 -2*z*w];
B = [0; 2];
C = [1 0];
D = 0;

olp = ss(A,B,C,D);
figure(1);
bode(olp);

Kp = 0.20;
Ki = 3.1;
Kd = 0.35;
s = tf('s');

Ksys = Kp + Ki/s + Kd*s/(0.001*s+1);
lag = 3.5/(s+3.5);

Ksys = Ksys * lag;

loop = Ksys * olp;

om = 1e-2:0.01:1e2;

figure(2); clf
margin(loop);
xlim([1e-2 1e2])

figure(3); clf
bode(olp,om)
hold on
bode(Ksys,om);
legend('olp','Ksys')

clp = loop/(1+loop);
figure(4);
step(olp,clp)
xlim([0 20])
legend('olp','clp');

figure(5);
bode(clp,om)
legend('clp');

figure(6)
step(Ksys/(1+loop))
xlim([0 20])
legend('u')

