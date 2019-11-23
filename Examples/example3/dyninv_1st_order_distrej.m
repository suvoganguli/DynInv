clear

A= -4;
B = 0.5;
C = 1;
D = 0;

CA = C*A;
invCB = inv(C*B);

usecase = 1;
if usecase == 1
    Kp = 2;
    Ki = 2;
    model = 'system_dyninv_1st_order_distrej1';
elseif usecase == 2
    Kb = 4;
    fi = 0.25;
    fc = sqrt(fi);
    model = 'system_dyninv_1st_order_distrej2';
end

sim(model);

figure(1); clf
plot(t, y, t, yc);
xlabel('t');
ylabel('y');
legend('y','yc');
grid on;

figure(2); clf
plot(t, u);
xlabel('t');
ylabel('u');
grid on;


