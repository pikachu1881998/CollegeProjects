% Example of how to do a BODE plot using MATLAB

% Specify the transfer function (two vectors that represent the coefficients of the numerator and denominator of the transfer function separated by a comma).

h=tf([2.02*10^-5 0 0],[8.2*10^-14 2.58*10^-9 2.1*10^-5 26.4*10^-3 8]);

% do the plot (freq. in radians/sec by default)

bode(h)