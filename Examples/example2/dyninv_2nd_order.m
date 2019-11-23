clear

w = 6;
z = 0.1;

A = [0 1; -w^2 -2*z*w];
B = [0; w^2];
C = [1 0; 0 1];
D = 0;

% control xdot
CA = [0 1]*A;
invCB = inv([0 1]*B);

K1 = 4; 
K2 = 1;

use_octave = 0;
if use_octave
  olp = ss(A,B,C,D);
  
  clp1 = invCB * olp(2,1) / (1 + CA * olp);
  clp2 = K1*clp1/(1+K1*clp1);
  
  eig(clp1.A)
    
  figure(1);
  step(clp2)
  
end

sim_loop = 1;
if sim_loop
    sim('system_dyninv_olp');
    sim('system_dyninv_2nd_order');
    
    figure(1); clf
    plot(t, y, t, y_olp(:,1), t, yc);
    xlabel('t');
    ylabel('y');
    legend('y','yo','yc');
    grid on;
    
    figure(2); clf
    plot(t, u);
    xlabel('t');
    ylabel('u');
    grid on;
end

