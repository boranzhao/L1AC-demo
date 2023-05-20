% This script implements an L1 adaptive controller for the numerical example considered in the following paper
% P. A. Ioannou, et al., "L1-adaptive control: Stability, robustness, and interpretations," IEEE TAC, 2014.

clear;
close all;
% clc;
%% Setting up
%format
theta=2;
Gamma=1e8;
step_size = 1e-4;
k_sp = 1e3; % setting to a positive number to shape the prediction error dynamics; setting to zero to deactivate such shaping.  See Section 2.1.6 of the L1 adaptive control book. 

%% Simulations
%% First filter/gamma
open('simple_example');
tic;
sim('simple_example');
toc;

%%
figure;
subplot(3,1,1)
plot(simu_time,theta_hat,'LineWidth',1)
ylabel('$\hat \theta$','interpreter','latex')
% ylim([-6 6])
goodplot([7 6])
subplot(3,1,2)
plot(simu_time,x-x_nom,'LineWidth',1)
ylabel('$x-x_{nom}$','interpreter','latex')
goodplot([7 6])
subplot(3,1,3)
plot(simu_time,u,'LineWidth',1)
ylabel('$u$','interpreter','latex')
xlabel('Time (s)')
% ylim([-120 120])
%
goodplot([7 6])
return;

%% save and print 
figname = ['Gamma-1e8-ode4-1e-4'];
% figname = ['Gamma-1e8-ode4-1e-4-w-loop-shaping-ksp-1e4'];
% figname = ['Gamma-1e8-ode4-1e-4-w-loop-shaping-ksp-1e4-zoomin'];

% figname = ['Gamma-1e8-ode1be-1e-4'];
% figname = ['Gamma-1e8-ode1be-1e-4-zoomin'];


%     savefig('energy.fig');
print(figname,'-painters', '-dpdf', '-r150');