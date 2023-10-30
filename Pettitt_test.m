data = [
    16.4, 13.8, 29.1, 8.4, 8.0, 19.2, 10.4, 25.7, 25.4, 100.0, ...
    10.2, 21.4, 12.0, 13.3, 17.7, 30.3, 14.5, 8.4, 13.9, 13.3, ...
    34.0, 31.2, 14.5, 32.3, 18.1, 19.1, 12.3, 30.4, 31.3, 18.2, ...
    31.0, 32.8, 19.6, 2.7, 30.1, 22.3, 24.0, 15.4, 16.9, 20.5, ...
    31.5, 19.0, 38.2, 23.8, 25.2, 18.2, 12.0, 14.4, 26.5, 32.5, ...
    32.1, 10.4, 18.8, 31.0, 38.6, 26.0, 13.3, 31.3, 32.2, 23.0, ...
    17.0, 26.2, 33.7, 17.6
];


N = length(data); 
U = zeros(1, N);

for t = 1:N
    
    part1 = sum(rank(data(1:t)));
    part2 = sum(rank(data(t+1:N)));
    U(t) = abs(part1 - part2);
end


[max_U, max_U_index] = max(U);

%% Critical value calculation for alpha = 0.05%%
alpha = 0.05;
critical_value = (N * (N - 1)) / 12 * (1 - alpha);

if max_U > critical_value
    fprintf('Maximum U: %.2f\n', max_U);
    fprintf('Critical Value: %.2f\n', critical_value);
    fprintf('Reject the null hypothesis. There is a significant change in the data.\n');
else
    fprintf('Maximum U: %.2f\n', max_U);
    fprintf('Critical Value: %.2f\n', critical_value);
    fprintf('Fail to reject the null hypothesis. The data appears homogeneous.\n');
end
