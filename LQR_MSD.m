% -------------------------------------------------
% LQR Controller for a Mass-Spring-Damper System
% xdd = -(k/m)x -(c/m)xd + (1/m)u
% -------------------------------------------------

clear
clc

% prompt
prompt = 'What tuning do you want? \n 1. cheap control \n 2. expensive control \n 3. penalise velocity \n 4. default\n\n';

% System
m = 0.5;
c = 0.25;
k = 1;

A = [0      1;
     -k/m -c/m];
 
B = [0;
    1/m];

C = eye(2);

D = [0;
     0];
 
 % Q and R variations
 tuner = input(prompt);
 
 switch tuner
     case 1
         % cheap control
         Q = eye(2);
         R = 0.01;
         tit = 'Cheap Control';
         
     case 2
         % Expensive control
         Q = eye(2);
         R = 100;
         tit = 'Expensive Control';
         
     case 3
         % Penalize only the velocity state
         Q = [0.001 0;
              0 100];
         R = 1;
         tit = 'Penalize velocity state';
         
     otherwise
         % default
         Q = eye(2);
         R = 1;
         tit = 'Default';
 end
 
 % LQR
 [K,P,E] = lqr(A,B,Q,R);
 
 disp('LQR gain is ');
 K
 
 % Initial state
 x0 = [pi;
        1.5];
 tf = 20;
 
 % Simulate the model with lqr feedback
 sim('LQR_Sim');
 
 % Extract values
 t = states.time;
 x1 = states.signals.values(:,1);
 x2 = states.signals.values(:,2);
 u = control.signals.values(:,1);
 
 % plot
 figure
 sgtitle(tit);
 subplot(3,1,1);
 plot(t,x1,'LineWidth',2);
 grid on;
 legend('x_1');
 title('displacement');
 
 subplot(3,1,2);
 plot(t,x2,'LineWidth',2);
 grid on;
 legend('x_2');
 title('velocity');
 
 subplot(3,1,3);
 plot(t,u,'LineWidth',2);
 grid on;
 legend('u');
 title('control');
    