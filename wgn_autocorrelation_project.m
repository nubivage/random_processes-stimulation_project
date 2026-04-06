clc;
clear;
close all;

%% PARAMETERS
N1 = 1000;
N2 = 10000;
lags = -50:50;

%% GENERATE WHITE GAUSSIAN NOISE
x1 = randn(1, N1);   % Mean = 0, Variance = 1
x2 = randn(1, N2);

%% AUTOCORRELATION FUNCTION
[R1] = autocorr_est(x1, lags);
[R2] = autocorr_est(x2, lags);

%% AVERAGING METHOD (10 sets of 100 samples)
num_sets = 10;
set_size = 100;

R_total = zeros(size(lags));

for i = 1:num_sets
    segment = x1((i-1)*set_size + 1 : i*set_size);
    R_temp = autocorr_est(segment, lags);
    R_total = R_total + R_temp;
end

R_avg = R_total / num_sets;

%% THEORETICAL AUTOCORRELATION
R_theoretical = zeros(size(lags));
R_theoretical(lags == 0) = 1;

%% PLOTTING RESULTS
figure;

subplot(3,1,1);
plot(lags, R1, 'LineWidth', 1.5);
title('Autocorrelation (N = 1000)');
xlabel('Lag'); ylabel('R_x_x(k)');
grid on;

subplot(3,1,2);
plot(lags, R_avg, 'LineWidth', 1.5);
title('Averaged Autocorrelation (10 sets of 100)');
xlabel('Lag'); ylabel('R_x_x(k)');
grid on;

subplot(3,1,3);
plot(lags, R2, 'LineWidth', 1.5);
title('Autocorrelation (N = 10000)');
xlabel('Lag'); ylabel('R_x_x(k)');
grid on;

%% COMPARISON WITH THEORETICAL
figure;
plot(lags, R2, 'LineWidth', 1.5);
hold on;
stem(lags, R_theoretical, 'r');
title('Comparison with Theoretical Autocorrelation');
legend('Estimated (N=10000)', 'Theoretical');
xlabel('Lag'); ylabel('R_x_x(k)');
grid on;

%% FUNCTION: AUTOCORRELATION
function R = autocorr_est(x, lags)

    N = length(x);
    R = zeros(size(lags));

    for k = 1:length(lags)
        lag = lags(k);

        if lag >= 0
            R(k) = sum(x(1:N-lag) .* x(1+lag:N)) / N;
        else
            lag_abs = abs(lag);
            R(k) = sum(x(1+lag_abs:N) .* x(1:N-lag_abs)) / N;
        end
    end
end