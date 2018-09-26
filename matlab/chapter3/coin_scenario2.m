%% coin_scenario2.m
% From A First Course in Machine Learning, Chapter 3.
% Simon Rogers, 01/11/11 [simon.rogers@glasgow.ac.uk]
% Revised by Sayyed Mohsen Vazirizade, Oct/15/2017 [smvazirizade@email.arizona.edu]
% Coin game, prior scenario 2

clc;clear all;close all;
rng(1);

%% Load the coin data
%load ../data/coin_data
toss_data=[1 0 1 1 1 1 0 0 0 1];
toss_data2=[1 1 0 0 1 1 1 1 1 1];
big_data=round(rand(1000,1)+0.25);
%% Plot the prior density
alpha = 50;
beta = 50;
fprintf('\nPrior parameters: alpha: %g, beta: %g',alpha,beta);
r = [0:0.01:1];
plot(r,betapdf(r,alpha,beta));
xlabel('r');
ylabel('p(r)');

%% Incorporate the data one toss at a time
post_alpha = alpha;
post_beta = beta;
ch = {'T','H'};
toss_string = [];
for i = 1:length(toss_data)
    %%
   toss_string = [toss_string ch{toss_data(i)+1}];
   figure(1);hold off
   subplot(221)
   plot(r,betapdf(r,post_alpha,post_beta),'k--');    
   post_alpha = post_alpha + toss_data(i);
   post_beta = post_beta + 1 - toss_data(i);
   hold on
   plot(r,betapdf(r,post_alpha,post_beta),'k');
   legend({'Previous posterior','New posterior'},'FontSize',5,'location','northwest');
   ti = sprintf('Posterior after %g tosses: %s',i,toss_string);
   title(ti);
   xlabel('r');ylabel('p(r|...)');
   pause(1)
end
    
%% Incorporate another ten
%figure(1);hold off
subplot(222)
plot(r,betapdf(r,post_alpha,post_beta),'k--');
hold on
N = length(toss_data2);
post_alpha = post_alpha + sum(toss_data2);
post_beta = post_beta + N - sum(toss_data2);
plot(r,betapdf(r,post_alpha,post_beta),'k');
legend({'Posterior after 10','Posterior after 20'},'FontSize',5,'location','northwest');
xlabel('r');ylabel('p(r|...)');
title('Incorporate another ten')
pause(2)

%% Incorpoate another 1000
%figure(1);hold off
subplot(223)
plot(r,betapdf(r,post_alpha,post_beta),'k--');
hold on
N = length(big_data);
post_alpha = post_alpha + sum(big_data);
post_beta = post_beta + N - sum(big_data);
plot(r,betapdf(r,post_alpha,post_beta),'k');
legend({'Posterior after 20','Posterior after 1020'},'FontSize',5,'location','northwest');
xlabel('r');ylabel('p(r|...)');
pause(2)

%% Interactive example
fprintf('\n Enter H or T to add a toss result and see the effect on the posterior.  Use ctrl-C to exit');
nTosses = 0;
post_alpha = alpha;
post_beta = beta;
while 1
    fprintf('\nYou have currently entered %g tosses\n',nTosses);
    this_toss = input('Enter next toss (H or T):','s');
    %figure(1);hold off
    subplot(224)
    plot(r,betapdf(r,post_alpha,post_beta),'k--');
    hold on
    xlabel('r');ylabel('p(r|...)');
    switch this_toss
        case 'H'
            post_alpha = post_alpha + 1;
        case 'T'
            post_beta = post_beta + 1;
        otherwise
            fprintf('\n Please enter H or T');
            continue
    end
    nTosses = nTosses + 1;
    plot(r,betapdf(r,post_alpha,post_beta),'k');
    legend({'Previous','New'},'FontSize',5,'location','northwest');
end
