# random_processes-stimulation_project
Estimation and analysis of Autocorrelation of  White Gaussian Noise and its Convergence with Increasing Sample Size

WGN Autocorrelation Project

Overview
This project simulates White Gaussian Noise (WGN) and estimates its autocorrelation using MATLAB. It studies how the accuracy of estimation improves with increasing sample size and averaging.

Objective
To generate white Gaussian noise, estimate its autocorrelation, and compare it with theoretical values while analyzing the effect of sample size.

Method
Generate WGN using randn()
Compute autocorrelation for N = 1000 and N = 10000
Divide 1000 samples into smaller sets and average results
Compare with theoretical autocorrelation

Result
N = 1000 → Noisy result
Averaging → Smoother result
N = 10000 → Close to theoretical

Conclusion
Increasing sample size and averaging improves the accuracy of autocorrelation estimation and verifies WSS and ergodic properties.
