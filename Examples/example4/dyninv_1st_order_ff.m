clear

A= -10;
B = 0.5;
C = 1;
D = 0;

CA = C*A;
invCB = inv(C*B);
Kb = 1;

ff_on = 0;
if ff_on
    fi = 0.25;
    fc = sqrt(fi); 
else
    fi = 0;
    fc = 1;
end

sim('system_dyninv_1st_order_ff');

figure(1); clf
plot(t, y, t, yc);
xlabel('t');
ylabel('y');
legend('y','yc');
grid on;
hold on;

figure(2); clf
plot(t, u);
xlabel('t');
ylabel('u');
grid on;
hold on;


ff_on = 1;
if ff_on
    fi = 0.25;
    fc = sqrt(fi); 
else
    fi = 0;
    fc = 1;
end

sim('system_dyninv_1st_order_ff');

figure(1);
plot(t, y, t, yc);

figure(2);
plot(t, u);



