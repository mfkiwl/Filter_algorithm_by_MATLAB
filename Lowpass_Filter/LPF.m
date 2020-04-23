function xlpf = LPF(x)
%
%
persistent prevX
persistent firstRun

if isempty(firstRun)
    prevX = x; % ������ ���̱� ����
    firstRun = 1;
end

% 0 < alpha < 0.7
alpha = 0.7;

% ���� �ֽŰ��� ����ġ�� �� ũ�� ����Ѵ�.
% alpha�� ������ �������� ������ �� ��Ÿ����.
% alpha�� ũ�� ���� �������� ������ �� Ŀ�� ������ �پ��� ��ȭ�� ��������.
xlpf = alpha*prevX+(1-alpha)*x;

prevX = xlpf;