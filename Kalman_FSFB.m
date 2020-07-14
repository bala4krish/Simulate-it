% ----------------------------------------------------------
% State feedback control using Kalman estimation and LQR 
% 
% System: 
%   xdot = Ax + Bu + B1w
%	y = Cx + Dv
%	u,v - white noise, w - control
%
% Kalman Filter: 
%   xhatdot = (A-LC)xhat + Ly + B1W
%   L = PC'/(DD')
%   P = are(A',C'*C./D.^2, B*B')
%
% LQR:
%   K = lqr(A,B1,eye(2),0.25)
% ----------------------------------------------------------

%System
A = [0 1; -2 3];
B = [0 1]';
B1 = [2 1]';
C = [1 1];
D = [1];

% Solution to algebraic riccati equation
P = are(A',C'*C./D.^2, B*B');

% Kalman gain
L = P*C'/(D*D');

% Feedback control using LQR
K = lqr(A,B1,eye(2),0.25);

% Simulate the model 
 sim('Kalman_FSFB_Sim');
 
% Extract values
t = states.time;
x1 = states.signals.values(:,1);
x2 = states.signals.values(:,2);

x1hat = estimate.signals.values(:,1);
x2hat = estimate.signals.values(:,2);

ty = output.time;
y = output.signals.values;

% plot
figure
sgtitle('State estimation & Control');
subplot(3,1,1);
plot(t,x1,'r',t,x1hat,'b','LineWidth',1.5);
grid on;
legend('Actual','Estimate');
title('state x_1');

subplot(3,1,2);
plot(t,x2,'r',t,x2hat,'b','LineWidth',1.5);
grid on;
legend('Actual','Estimate');
title('state x_2');

subplot(3,1,3);
plot(ty,y,'g','LineWidth',1.5);
grid on;
legend('y');
title('output y');
