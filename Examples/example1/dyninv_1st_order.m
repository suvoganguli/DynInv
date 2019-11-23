clear

A= -4;
B = 0.5;
C = 1;
D = 0;

CA = C*A;
invCB = inv(C*B);
K = 2; 

sim('system_dyninv_olp');
sim('system_dyninv_1st_order');

figure(1); clf
plot(t, y, t, y_olp, t, yc);
xlabel('t');
ylabel('y');
legend('y','yo','yc');
grid on;

figure(2); clf
plot(t, u);
xlabel('t');
ylabel('u');
grid on;

