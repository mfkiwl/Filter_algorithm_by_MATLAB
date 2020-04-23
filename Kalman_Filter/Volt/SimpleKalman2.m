function  [volt,P_out, K]= SimpleKalman2(z)
%
%
persistent A H Q R  % �ý��� �� ����
persistent x P  % �ʱⰪ
persistent firstRun

if isempty(firstRun) % ���Ӻ��� ������ �� �ʱⰪ�� ����
    A = 1;
    H = 1;
    Q = 0;
    R = 4;
    
    x = 14;
    P = 6;
    
    firstRun = 1;
end

xp = A*x; % ������ ����
Pp = A*P*A'+ Q; % ���� ���л� ����

K = Pp*H'* (H*Pp*H'+R)^-1; % Į���̵� ���

x = xp + K*(z - H*xp); % ������ ���
P = Pp - K*H*Pp; % ���� ���л� ���

P_out = P;
volt = x;

end