function avg = AvgFilter(x)
%
%
persistent prevAvg k
persistent firstRun


if isempty(firstRun)
    k = 1;
    prevAvg = 0;
    
    firstRun = 1;
end

alpha = (k-1)/k;

% ��� ���� = (1-K)/K * �� ���� ��� + 1/K * ���� �� 

avg = alpha*prevAvg + (1-alpha)*x;

prevAvg = avg;
k = k+1;
