%% olympval.m
% From A First Course in Machine Learning, Chapter 1.
% Simon Rogers, 31/10/11 [simon.rogers@glasgow.ac.uk]
% Revised by Sayyed Mohsen Vazirizade, Oct/11/2017 [smvazirizade@email.arizona.edu]
clc;clear all;close all;



%% Load the Olympic data and extract the training and validation data
%load ../data/olympics.mat
male100=load('olympic100m.txt')
x = male100(:,1); % Olympic years
t = male100(:,2); % Winning times
pos = find(x>1979);

% Rescale x for numerical reasons
x = x - x(1);
x = x./4;


valx = x(pos:end);
valt = t(pos:end);
x(pos:end) = [];
t(pos:end) = [];
%% Fit the different models and plot the results
orders = [1 4 8]; %We shall fit models of these orders
% Plot the data
figure(1);hold off
plot(x,t,'bo','markersize',5);
hold all
plot(valx,valt,'ro','markersize',5);
plotx = [min(x):0.01:max(valx)]';
for i = 1:length(orders)
    X = [];
    plotX = [];
    valX = [];
    for k = 0:orders(i)
        X = [X x.^k];
        valX = [valX valx.^k];
        plotX = [plotX plotx.^k];
    end
    % Compute w
    w = (X'*X)\X'*t;
    plot(plotx,plotX*w,'linewidth',2);
    % Compute validation loss
    val_loss(i) = mean((valX*w - valt).^2);
end
ylim([9 12]);
legend('Training','Validation','Linear','4th order','8th order');


%% Display the validation losses
for i = 1:length(orders)
 fprintf('\n Model order: %g, Validation loss: %g',...
        orders(i),val_loss(i));
end
xlabel('Olympic number (note, not year!)');
ylabel('Winning time');
