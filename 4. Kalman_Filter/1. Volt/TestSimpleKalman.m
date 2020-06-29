clc
clear all

dt = 0.2;
t = 0:dt:10;

Nsamples = length(t);

Xsaved = zeros(Nsamples,1); % ��� ���� -> �迭
Zsaved = zeros(Nsamples,1); % ��� ���� -> �迭

for k=1:Nsamples
    z = GetVolt(); % ������ ��
    volt = SimpleKalman(z); % Į�� 
    
    Xsaved(k) = volt; % Į���� ���� ����
    Zsaved(k) = z; % ������ ����
end

figure
plot(t,Xsaved,'r:o');
hold on
plot(t,Zsaved,'b:*')
legend('Kalman Filter','Measured')