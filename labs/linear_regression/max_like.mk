% Machine Learning 4/M
% Maximum Likelihood Laboratory

# Aims

 - To implement the maximum likelihood estimator of the parameters of a linear model
 - To plot predictions and their variance

# Tasks

 - Download the Olympic data (again)
 - Implement the maximum likelihood estimator for the parameters $\mathbf{w}$ and $\sigma^2$ of the linear model
  - Note that $\mathbf{w}$ should be identical to the value from minimising the loss
  - The relevant equations are:
  $$ \mathbf{w} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{t} ~~\mbox{(a vector with one value per parameter)} $$
  $$ \sigma^2 = \frac{1}{N}(\mathbf{t} - \mathbf{X}\mathbf{w})^T(\mathbf{t} - \mathbf{X}\mathbf{w}) ~~\mbox{(a scalar)} $$
 - Plot the training data, the predictive mean (i.e. $\mathbf{X}_{test}\mathbf{w}$, the polynomial function)
 - On top of your previous plot add dashed lines to show $\pm \sigma$, i.e. a line at $\mathbf{X}_{test}\mathbf{w}+\sigma$ and one at $\mathbf{X}_{test}\mathbf{w}-\sigma$ 
 - Plot the predictive density for the 2016 Olympics (your x axis will be winning time, t, and your y axis p(t)). I.e. a Gaussian pdf with mean $\mathbf{w}^T\mathbf{x}_{2016}$ and variance $\sigma^2$