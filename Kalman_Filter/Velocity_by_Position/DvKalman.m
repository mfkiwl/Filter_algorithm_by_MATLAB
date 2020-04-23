function [pos, vel] = DvKalman(z) % z�� ������

persistent A H Q R % �ý��� �� ����(�𵨸�,����)
persistent x P     % �ʱⰪ
persistent firstRun

if isempty(firstRun)
    dt = 0.1;
    
    A = [1 dt;
         0  1];
     
    H = [1 0];
    
    Q = [1 0;
         0 3];
     
    R = 10;
    
    x = [0 20]'; % �ʱ� ��ġ : 0  �ʱ� �ӵ� : 20
    P = 5*eye(2); % �밢��� 2x2 ũ��
    
    firstRun = 1;
end

xp = A*x;
Pp = A*P*A'+Q;

K = Pp*H'*(H*Pp*H'+R)^-1;

x = xp + K*(z-H*xp);
P = Pp-K*H*Pp;

pos = x(1,1);
vel = x(2,1);

end


    
    
