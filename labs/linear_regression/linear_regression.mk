% ML 4/M - Python labs - Linear Regression
% Simon Rogers

# Aims

- Do a least squares regression on the Olympic 100~m data in Python

# Tasks

- Download the data (`data100m.csv') from the Moodle page
- Plot Olympic year against winning time (I recommend using `matplotlib` to plot in Python)
- Using the expressions derived in the lecture compute $w_0$ and $w_1$
- Create a new plot that includes the data and the function defined by $w_0$ and $w_1$
- The methods derived in the lecture gives us a linear function. Derive the expressions for the values of $w_0$, $w_1$, and $w_2$ that minimise the squared loss for the function:

$$ t_n = w_0 + w_1 x_n + w_2 x_n^2 $$

- Compute the values of these three coefficients for the Olympic data and plot the data (as before) and the new curve.